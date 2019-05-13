#!/bin/bash

#requires http & file lib!
function hash_sha_onlineFile() {
    local url=$1;
    local tmpfile="$RANDOM-tempfile"
    local tmpfilefull=".hashtemps/$tmpfile"
    #check tmp dir:
    checkCreateDir ".hashtemps"
    #download file:
    downloadFile "$url" "$tmpfilefull"
    #generate checksum
    checksum=$(shasum "$tmpfilefull" | awk '{ gsub(/,/, ""); print $1}')
    echo "$checksum"
}

function hash_sha_localFile() {
    local file=$1;
    #hashdir:
    checkCreateDir ".hashes"
    #full file:
    local hashpath=".hashes/$file.hash"
    checksum=$(shasum "$file" | awk '{ gsub(/,/, ""); print $1}')
    #save hash
    echo "$checksum" >> "$hashpath"
    #return hash
    echo "$checksum"
}

function hash_sha_compare() {
    local base=$1;
    local compareto=$2;
    local basehash comparehash
    #create local hash
    basehash=hash_sha_localFile "$base"
    #get remote hash:
    comparehash=hash_sha_localFile "$compareto"
    #check
    if [ "$basehash" == "$comparehash" ]; then
        echo "ok!"
    fi
}

function hash_checkLibs() {
    getLib "output"
    #use dir because most people customize their ls?
    local libs updateLibs
    libs=$(dir libs/)
    for lib in $libs; do
        log "info" "checking $lib!"
        url="https://gitlab.com/fsteltenkamp/bashLibraries/raw/master/$lib"
        local remoteHash localHash libname
        libname=$(echo "$lib" | awk -F. '{print $1}')
        remoteHash=hash_sha_onlineFile "$url"
        localHash=hash_sha_localFile "libs/$lib"
        if [ "$remoteHash" == "$localHash" ]; then
            #do nothing, lib is up to date
            echo ""
        else
            updateLibs="$updateLibs $libname"
        fi
    done
    echo "$updateLibs"
}