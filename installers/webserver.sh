#!/bin/bash
function webserverInstall() {
    coloredEcho "Installing Webserver Packages" cyan
    packageInstall apache2 php php-curl php-mysql
}