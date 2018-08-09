#!/bin/bash
function packageUpdate() {
    apt update && apt upgrade
}

function packageInstall() {
    local packages="$@";
    apt install -y packages
}