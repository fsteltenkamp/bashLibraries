#!/bin/bash
function checkInstalled() {
    program=$1
    if type $program >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

function installAptKey() {
    keyUrl=$1
    #check if key is already installed here
    downloadFile $1 - | apt-key add -
}

function addAptSource() {
    source=$1
    list=$2
    #check if source exists here
    echo $1 | tee -a "/etc/apt/sources.list.d/$2.list"
}

function installer() {
    package=$1
    case "$package" in
        "docker")
            getInstaller docker
            dockerInstall
            ;;
        "sinusbot")
            getInstaller sinusbot
            sinusbotInstall
            ;;
        *)
            echo "unknown package!"
            ;;
    esac
}

function checkDockerContainer() {
    if ! checkInstalled "docker"; then
        coloredEcho "Docker is not even installed!" orange
        echo "doesnt"
        return 1
    fi
    container=$1
    if docker image ls | grep -q $container 2>/dev/null; then
        return 0
    else
        return 1
    fi
}

function replace() {
    toreplace=$1
    replacewith=$2
    replacein=$3
    #log
    log "info" "Replacing $toreplace with $replacewith in $replacein"
    #test this:
    sed -i "s#$toreplace#$replacewith#g" $replacein
}
