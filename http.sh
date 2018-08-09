#!/bin/bash
function downloadFile() {
    local fileSrc=$1;
    local fileName=$2;
    wget -qO $fileName $fileSrc
}