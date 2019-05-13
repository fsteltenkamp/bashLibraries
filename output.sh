#!/bin/bash

function coloredEcho(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ ^[0-9]$ ]] ; then
       case $(echo "$color" | tr '[:upper:]' '[:lower:]') in
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
    echo "$exp";
    tput sgr0;
}

# - logging function -
# creates colorful log-messages in stdout, also writes to a logfile.
# prefix enables you to add a prefix to the log-line to differentiate different programs or hosts
# logfile enables you to add different logfiles for each log, if needed. set globally to use one custom logfile.
# ========== Supported global vars ==========
# - to use global vars, use export <varname>="<value>" before importing the lib.
# 1: PREFIX - sets the prefix for logs.
# 2: LOGFILE - sets the output logfile.
# ========== parameters ==========
# 1: string - Type - (success,info,warn,error,fatal,debug,file) -- type=file only writes to log, no stdout
# 2: string - message - what is set as a message
# 3: string - prefix - this can be used to set a prefix, useful if working with multiple programs or hosts from a central script
# 4: string - logfile - if needed this can be used to set a logfile
function log() {
    TYPE=$1
    MSG=$2
    PREFIXPARAM=$3
    LOGFILEPARAM=$4

    #colors
    RED="\033[1;31m"
    GREEN="\033[1;32m"
    YELLOW="\033[1;33m"
    BLUE="\033[0;34m"
    MAGENTA="\033[0;35m"
    CYAN="\033[1;36m"
    GREY="\033[0;37m"
    # shellcheck disable=SC2034
    WHITE="\033[1;39m"
    NOCOL="\033[00m"


    TS=$(date "+%Y-%m-%d %T")

    if [ -z "$PREFIXPARAM" ]; then
        PF=${PREFIX:=""}
        #shellcheck disable=SC2236
        if [ ! -z "$PF" ]; then
            PF="[${BLUE}$PF${NOCOL}]"
        fi
    fi

    if [ -z "$LOGFILEPARAM" ]; then
        LOGFILENAME="${LOGFILE:=out.log}"
    fi

    case $TYPE in
        success)
            echo -e "[${GREEN}SUCCESS${NOCOL}]${PF} $MSG"
            echo "[$TS][SUCCESS] $MSG" >> $LOGFILENAME
        ;;
        info)
            echo -e "[${CYAN}INFO${NOCOL}]${PF} $MSG"
            echo "[$TS][INFO] $MSG" >> $LOGFILENAME
        ;;
        warn)
            echo -e "[${YELLOW}WARN${NOCOL}]${PF} $MSG"
            echo "[$TS][WARN] $MSG" >> $LOGFILENAME
        ;;
        error)
            echo -e "[${RED}ERROR${NOCOL}]${PF} $MSG"
            echo "[$TS][ERROR] $MSG" >> $LOGFILENAME
        ;;
        fatal)
            echo -e "[${MAGENTA}FATAL${NOCOL}]${PF} $MSG"
            echo "[$TS][FATAL] $MSG" >> $LOGFILENAME
        ;;
        debug)
            echo -e "[${GREY}DEBUG${NOCOL}]${PF} $MSG"
            echo "[$TS][DEBUG] $MSG" >> $LOGFILENAME
        ;;
        file)
            echo "[$TS] $MSG" >> $LOGFILENAME
        ;;
        *)
            echo -e "${PF}$MSG"
            echo "[$TS] $MSG" >> $LOGFILENAME
        ;;
    esac
}