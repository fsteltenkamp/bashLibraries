#!/bin/bash
function checkInstalled() {
    program=$1
    if type "$program" >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

function installAptKey() {
    keyUrl=$1
    #check if key is already installed here
    downloadFile "$keyUrl" - | apt-key add -
}

function addAptSource() {
    source=$1
    list=$2
    #check if source exists here
    echo "$source" | tee -a "/etc/apt/sources.list.d/$list.list"
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
    if docker image ls | grep -q "$container" 2>/dev/null; then
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
    sed -i "s#$toreplace#$replacewith#g" "$replacein"
}

function stubify() {
    stubifyme=$1
    stub=$(echo $stubifyme | sed -e 's/\.//g')
    echo $stub
}

function script_restart() {
    #if $RESTARTLOC is not set, crash and user has to restart manually.
    if [ -z "$RESTARTLOC" ]; then
        log "fatal" "No restart-location found! Please set RESTARTLOC as described in the Wiki. Exiting script. you can restart it manually!"
        exit 0
    fi
    log "warn" "restarting script!"
    exec "$RESTARTLOC"
}
