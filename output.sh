#!/bin/bash

function coloredEcho(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput setaf $color;
    echo $exp;
    tput sgr0;
}

function log() {
    TYPE=$1
    MSG=$2
    LOGFILENAME=$3

    if [ -z $LOGFILENAME ]; then
        LOGFILENAME="out.log"
    fi

    #colors
    RED="\033[1;31m"
    GREEN="\033[1;32m"
    YELLOW="\033[1;33m"
    BLUE="\033[0;34m"
    MANGENTA="\033[0;35m"
    CYAN="\033[1;36m"
    GREY="\033[0;37m"
    WHITE="\033[1;39m"
    NOCOL="\033[00m"


    TS=$(date "+$Y-$m-$d $T")

    case $TYPE in
        success)
            echo -e "[${GREEN}SUCCESS${NOCOL}] $MSG"
            echo "[$TS][SUCCESS] $MSG" >> $LOGFILENAME
        ;;
        info)
            echo -e "[${CYAN}INFO${NOCOL}] $MSG"
            echo "[$TS][INFO] $MSG" >> $LOGFILENAME
        ;;
        warn)
            echo -e "[${YELLOW}WARN${NOCOL}] $MSG"
            echo "[$TS][WARN] $MSG" >> $LOGFILENAME
        ;;
        error)
            echo -e "[${RED}ERROR${NOCOL}] $MSG"
            echo "[$TS][ERROR] $MSG" >> $LOGFILENAME
        ;;
        fatal)
            echo -e "[${MAGENTA}FATAL${NOCOL}] $MSG"
            echo "[$TS][FATAL] $MSG" >> $LOGFILENAME
        ;;
        debug)
            echo -e "[${GREY}DEBUG${NOCOL}] $MSG"
            echo "[$TS][DEBUG] $MSG" >> $LOGFILENAME
        ;;
        file)
            echo "[$TS] $MSG" >> $LOGFILENAME
        ;;
        *)
            echo -e "$MSG"
            echo "[$TS] $MSG" >> $LOGFILENAME
        ;;
    esac
}