#!/bin/bash
function installmotd() {
    coloredEcho "Downloading Simple Motd..." cyan
    downloadFile https://gitlab.com/snippets/1797332/raw /etc/motd
    # replace values
    coloredEcho "Replacing Detected Values..." cyan
    replace "{HOSTNAME}" "$HOSTNAME" "/etc/motd"
    replace "{USER}" "$CURUSER" "/etc/motd"
    replace "{SYSADMINNAME}" "$ADMINNAME" "/etc/motd"
    replace "{SYSADMINMAIL}" "$ADMINMAIL" "/etc/motd"
    replace "{DISTRO}" "$DISTRO" "/etc/motd"
    replace "{KERN}" "$KERN" "/etc/motd"
    replace "{ARCH}" "$ARCH" "/etc/motd"
    coloredEcho "Motd has been updated..." green
}