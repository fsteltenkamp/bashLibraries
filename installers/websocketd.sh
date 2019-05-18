#!/bin/bash
#installer for websocketd
# www.websocketd.com

function websocketdInstall() {
    log "info" "Installing Websocketd"
    downloadFile "https://github.com/joewalnes/websocketd/releases/download/v0.3.0/websocketd-0.3.0-linux_amd64.zip" "websocketd.zip"
    checkCreateDir ".websocketInstall"
    moveFile "websocketd.zip" ".websocketInstall/websocketd.zip"
    cd ".websocketInstall" || log "fatal" "failed to change directory!" && return
    unzip "websocketd.zip"
    moveFile "websocketd" "/usr/bin/websocketd"
    cd "../" || log "fatal" "failed to change directory!" && return
    rm -r ".websocketInstall"
}