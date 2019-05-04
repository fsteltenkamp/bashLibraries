#!/bin/bash
#getLibsfunction
function getLib() {
    local libs="$@";
    for lib in $libs; do
        libUrl=https://gitlab.com/fsteltenkamp/bashLibraries/raw/master/$lib.sh
        libFile="libs/$lib.sh"
        if [ ! -f $libFile ]; then
            echo "Downloading Library $lib...";
            #download lib
            wget -qO $libFile $libUrl
        fi
        source $libFile
    done
}
function getInstaller() {
    local installers="$@";
    #check for installers dir
    checkCreateDir installers
    for installer in $installers; do
        installerUrl="https://gitlab.com/fsteltenkamp/bashLibraries/raw/master/installers/$installer.sh"
        installerFile="installers/$installer.sh"
        if [ ! -f $installerFile ]; then
            echo "Downloading Installer $installer...";
            #download installer
            wget -qO $installerFile $installerUrl
        fi
        #include lib
        source $installerFile
    done
}
