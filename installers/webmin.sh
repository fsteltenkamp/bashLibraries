#!/bin/bash
function webminInstall() {
    coloredEcho "Adding Webmin Repository..." cyan
    echo "deb https://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list
    coloredEcho "Adding Webmin key..." cyan
    wget -qO - http://www.webmin.com/jcameron-key.asc | apt-key add -
    coloredEcho "Updating packages..." cyan
    packageUpdate
    coloredEcho "Installing Webmin" cyan
    packageInstall webmin
}

function userminInstall() {
    coloredEcho "Installing Usermin" cyan
    packageInstall usermin
}