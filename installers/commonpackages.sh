function commonpackagesinstall() {
    #get packages list
    local packages="nload ethstatus mc ncdu htop"
    coloredEcho "Installing Common Packages..." cyan
    packageInstall packages
}