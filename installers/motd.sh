function installmotd() {
    coloredEcho "Downloading Simple Motd..." cyan
    downloadFile https://gitlab.com/snippets/1797332/raw /etc/motd
    # replace values
    coloredEcho "Replacing Detected Values..." cyan
    sed 's/{HOSTNAME}/$HOSTNAME/g' /etc/motd
    sed 's/{USER}/$CURUSER/g' /etc/motd
    sed 's/{SYSADMINNAME}/$ADMINNAME/g' /etc/motd
    sed 's/{SYSADMINMAIL}/$ADMINMAIL/g' /etc/motd
    sed 's/{DISTRO}/$DISTRO/g' /etc/motd
    sed 's/{KERN}/$KERN/g' /etc/motd
    sed 's/{ARCH}/$ARCH/g' /etc/motd
    coloredEcho "Motd has been updated..." green
}