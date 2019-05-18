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
    local filename;
    filename=$(echo "$file" | awk -F "/" '{print $1}')
    #hashdir:
    checkCreateDir ".hashes"
    #full file:
    local hashpath=".hashes/$filename.hash"
    checksum=$(shasum "$file" | awk '{ gsub(/,/, ""); print $1}')
    #save hash
    echo "$checksum" > "$hashpath"
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

#requires output
function hash_checkLibs() {
    #use dir because most people customize their ls?
    local libs toupdate
    toupdate=""
    libs=$(dir libs/)
    for lib in $libs; do
        url="https://gitlab.com/fsteltenkamp/bashLibraries/raw/master/$lib"
        local remoteHash localHash libname
        libname=$(echo "$lib" | awk -F. '{print $1}')
        remoteHash=$(hash_sha_onlineFile "$url")
        localHash=$(hash_sha_localFile "libs/$lib")
        log "file" "checking $lib: libname:\"$libname\" remoteHash:\"$remoteHash\" localHash:\"$localHash\""
        if [ "$remoteHash" == "$localHash" ]; then
            log "file" "$lib is up to date."
        else
            log "file" "adding \"$libname\" to updatevar"
            toupdate="$toupdate $libname"
        fi
    done
    echo "$toupdate"
}