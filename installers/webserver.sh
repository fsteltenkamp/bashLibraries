#!/bin/bash
function webserverInstall() {
    coloredEcho "Installing Webserver Packages" cyan
    packageInstall apache2 php php-curl php-mysql
    if prompt_confirm "Install newest PHP Releases?"; then
        packageInstall apt-transport-https lsb-release ca-certificates
        wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
        sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
        packageUpdate
    fi
}