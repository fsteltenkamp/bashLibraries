#!/bin/bash
function downloadFile() {
    local fileSrc=$1;
    local fileName=$2;
    if [ -z $fileName ]; then
        wget -q $fileSrc;
    else
        wget -qO $fileName $fileSrc
    fi
}