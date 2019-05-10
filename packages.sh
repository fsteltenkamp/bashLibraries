#!/bin/bash
function packageUpdate() {
    apt update -y && apt upgrade -y
}

function packageInstall() {
    local packages="$*";
    apt install -y "$packages"
}