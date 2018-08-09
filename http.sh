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

function getOnlineFileChecksum() {
    local file=$1;
    fileContent=$(curl $file)
    checksum=$(shasum $fileContent)
    return checksum
}