#!/bin/bash

#getLibsfunction
function getLib() {
    local libs="$*";
    #check libs dir:
    if [ ! -d "libs" ]; then
        mkdir -p "libs";
    fi
    #download libs:
    for lib in $libs; do
        libUrl="https://gitlab.com/fsteltenkamp/bashLibraries/raw/master/$lib.sh"
        libFile="libs/$lib.sh"
        if [ ! -f "$libFile" ]; then
            echo "Downloading Library $lib...";
            #download lib
            wget -qO "$libFile" "$libUrl"
        fi
        echo "loading $lib Library..."
        # shellcheck disable=SC1090
        source "$libFile"
    done
}

#check libraries here:
getLib "output" "file" "http" "hash" "various"
log "info" "checking existing libraries..."
updateLibs=$(hash_checkLibs)
#todo: remove outdated libs and restart the script ( it should download the files normally )
for lib in $updateLibs; do
    echo "rm libs/$lib.sh"
done

#if there were any libraries to update, restart the script:
#shellcheck disable=SC2236
if [ ! -z "$updateLibs" ]; then
    log "debug" "\$updateLibs value: \"$updateLibs\" - restarting now!"
    script_restart
fi

function getInstaller() {
    local installers="$*";
    #check for installers dir
    checkCreateDir installers
    for installer in $installers; do
        installerUrl="https://gitlab.com/fsteltenkamp/bashLibraries/raw/master/installers/$installer.sh"
        installerFile="installers/$installer.sh"
        if [ ! -f "$installerFile" ]; then
            echo "Downloading Installer $installer...";
            #download installer
            wget -qO "$installerFile" "$installerUrl"
        fi
        #include lib
        # shellcheck disable=SC1090
        source "$installerFile"
    done
}
