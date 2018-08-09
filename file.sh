#!/bin/bash
function moveFile() {
    local fileSrc=$1;
    local fileTar=$2;
    mv $fileSrc $fileTar
}

function fileExists() {
    local file=$1;
    if [ ! -f $file ]; then
        return 0
    else
        return 1
    fi
}

function checkCreateDir() {
    local dir=$1;
    if [ ! -d $dir ]; then
        mkdir $dir;
        return 1
    else
        return 1
    fi
}