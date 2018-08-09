#!/bin/bash
function checkInstalled() {
    program=$1
    if type $program >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
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