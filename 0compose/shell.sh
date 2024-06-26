#!/bin/bash

CONTAINER_NAME=0compose-ubuntu-desktop-1

# check container exists
docker ps -a | awk '{print $NF}' | grep ${CONTAINER_NAME} &>/dev/null

if [[ $? != 0 ]]; then
    echo "You need to create docker container first"
    echo "Using: docker-compose up -d"
else
    # check container is running
    docker ps | awk '{print $NF}' | grep ${CONTAINER_NAME} &>/dev/null

    if [[ $? != 0 ]]; then
        echo "Start ${CONTAINER_NAME}"
        docker start ${CONTAINER_NAME}
    fi

    docker exec -it ${CONTAINER_NAME} bash
fi
