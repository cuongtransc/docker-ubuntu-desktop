#!/bin/bash
set -e

function gen_config() {
	# Set default VNC_PASSWORD if not exist
    # password is limited by 8 characters
    : ${VNC_PASSWORD:=coc@123}

	PROG=/usr/bin/vncpasswd

	/usr/bin/expect <<-EOF
		spawn "$PROG"
		expect "Password:"
		send "$VNC_PASSWORD\r"
		expect "Verify:"
		send "$VNC_PASSWORD\r"
		expect "Would you like to enter a view-only password (y/n)?"
		send "n\r"
		expect eof
		exit
	EOF
}

# prepare for config default
gen_config

if [ "$1" = 'vncserver' ]; then

    ##################### handle SIGTERM #####################
    function _term() {
        printf "%s\n" "Caught terminate signal!"
        kill -SIGTERM $child 2>/dev/null
        exit 0
    }

    trap _term SIGHUP SIGINT SIGTERM SIGQUIT

    ##################### start application #####################

	# Clean vncserver lock file
	rm -rf /tmp/.X11-unix/ /tmp/.X*-lock

	parameter=$@
	vncserver ${parameter[@]:9}

    tail -F /root/.vnc/*.log &

    child=$!
    wait "$child"
fi

exec "$@"

