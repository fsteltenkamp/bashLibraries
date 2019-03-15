#!/bin/bash
function dockerInstall() {
    if checkInstalled "docker"; then
        coloredEcho "Docker is already installed" orange
        return 0
    else
        #install dependencies
        packageInstall "apt-transport-https ca-certificates curl gnupg2 software-properties-common"
        #install key
        installAptKey "https://download.docker.com/linux/debian/gpg"
        #insert source into own list
        addAptSource "[arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" "docker"
        #update and install docker ce
        packageUpdate
        packageInstall "docker-ce docker-ce-cli containerd.io"
    fi
}