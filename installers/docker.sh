#!/bin/bash
function dockerInstall() {
    if checkInstalled "docker"; then
        return 0
    else
        #install dependencies
        packageInstall apt-transport-https ca-certificates curl gnupg2 software-properties-common
        #install key
        downloadFile https://download.docker.com/linux/debian/gpg - | apt-key add -
        #insert source into own list
        echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee -a /etc/apt/sources.list.d/docker.list
        packageUpdate
        packageInstall docker-ce
    fi
}