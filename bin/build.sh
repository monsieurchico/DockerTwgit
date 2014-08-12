#!/usr/bin/env bash

TWGIT="twgit"
[ "$1" = "default" ] && DEFAULT=1 || DEFAULT=0
CURRENT_DIR=$(dirname "$0")
USER_NAME=$(logname)
USER_HOME=$(sudo -u ${USER_NAME} -H sh -c 'echo "$HOME"')

if [ "${USER}" != "root" ]; then
    echo "ERROR : permission denied for current user << $USER >>. Use sudo or your root account"
    exit 1
fi

# make sure docker can be accessed by current user
if [ $(groups ${USER_NAME} | grep docker | wc -l) -eq 0 ]; then
    sudo useradd ${USERNAME} docker
fi
sudo chown ${USER_NAME}:docker /var/run/docker.sock

if [ ! -f "${CURRENT_DIR}/../res/id_rsa" ]; then
    if [ ${DEFAULT} -eq 1 ]; then
        cp ${USER_HOME}/.ssh/id_rsa ${CURRENT_DIR}/../res/id_rsa
    else
        echo "ERROR : please provide a << id_rsa >> file in the << res >> directory"
        exit 1
    fi
fi

if [ ! -f "./res/twgit.sh" ]; then
    cp ./res/twgit-dist.sh ./res/twgit.sh
fi

if [ ! -f "./res/.gitconfig" ]; then
    if [ ${DEFAULT} -eq 1 ]; then
        cp ${USER_HOME}/.gitconfig ./res/.gitconfig
    else
        echo "ERROR : please provide a << .gitconfig >> file in the << res >> directory"
        exit 1
    fi
fi

docker rmi ${TWGIT}
docker build -t ${TWGIT} .
