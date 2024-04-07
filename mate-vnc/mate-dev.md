# Dev

--------------------------------
## Selenium Server
```sh
# Terminal
# mate-terminal
apt install -y caja-open-terminal
pkill caja

apt install -y default-jre

java -jar selenium-server.jar standalone --selenium-manager true
```

```sh
# Font: China
apt install -y fonts-noto-cjk

# Video Codecs
apt install -y ffmpeg
```


--------------------------------
## Jupyter Server
```sh
apt install -y sudo

sudo apt install -y byobu htop

sudo apt install -y openssh-server
sudo service ssh start

# Python
sudo apt install -y python3-pip
sudo pip3 install virtualenv

# sudo apt install snapd
# sudo service snapd status
# sudo service snapd start
# snap install firefox

apt install -y zsh
wget https://www.dropbox.com/s/3uxj6fpd3wbax83/ct-config_20221201_073823.tgz -O /tmp/ct-config.tgz

user=root
sudo tar xzf /tmp/ct-config.tgz -C /root
sudo chown ${user}:${user} -R /root
sudo mv /root/peco /usr/local/bin
chsh -s /bin/zsh

# user=ubuntu
# # Config dotfiles
# sudo tar xzf /tmp/ct-config.tgz -C /home/${user}
# sudo chown ${user}:${user} -R /home/${user}
# sudo mv /home/${user}/peco /usr/local/bin

# Add user: ubuntu
user=ubuntu
adduser --disabled-password --gecos "" ${user}

chown ${user}:${user} -R /home/${user}

# Grant sudo
cat >> /etc/sudoers<<EOM
${user}    ALL=(ALL:ALL) NOPASSWD:ALL
EOM

###################################################
# Jupyter
virtualenv .venv
source .venv/bin/activate
pip install jupyterlab

# Config
jupyter server --generate-config

# Generate a password for authentication
jupyter server password

jupyter lab --ip=0.0.0.0 --no-browser

pip install selenium
```


## Start Jupiter
```sh
# Run GUI via ssh
# https://askubuntu.com/questions/47642/how-to-start-a-gui-software-on-a-remote-linux-pc-via-ssh
export DISPLAY=:1; ./start_jup.sh

export DISPLAY=:1; mate-terminal

# To display the application nowhere
# You need to install & start xvfb. xvfb will create an invisible X session at DISPLAY 10. Then you start your application directing its output to that DISPLAY:

sudo apt install xvfb
sudo Xvfb :10 -ac -screen 0 1024x768x24 &
DISPLAY=:10 firefox
```

Problem: Cannot run snap on Docker Container.
