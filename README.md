[![build status](https://gitlab.com/fsteltenkamp/bashlibraries/badges/master/build.svg)](https://gitlab.com/fsteltenkamp/bashlibraries/commits/master)
# bashLibraries

Collection of bash libraries

# Usage

include this in your bash script and configure according to your liking:
This creates the config, and makes sure the downloader Lib exists.
```bash
#settings
# Setting: Loglevel:
# 0: everything
# 1: -debug
# 2: -fatal
# 3: -err
# 4: -warn
export LOGLEVEL=0
export LOGFILENAME="yourapp.log"
export BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export CONFIGFILE="config.json"
export CONFIGPATH="${BASEDIR}/.config/${CONFIGFILE}"
export RESTARTLOC
export DEBUG=false
RESTARTLOC=$(readlink -f "$0")

#libraries stuff
if [ ! -d ".libs" ]; then
    mkdir ".libs"
fi

if [ ! -f ".libs/downloaders.sh" ]; then
    wget -qO ".libs/downloaders.sh" https://git.steltenkamp.net/fsteltenkamp/bashLibraries/raw/branch/master/downloaders.sh
    # shellcheck disable=SC1091
    source ".libs/downloaders.sh"
else
    # shellcheck disable=SC1091
    source ".libs/downloaders.sh"
fi
```
  
Now, add this snippet to your file (after the previous snippet):
```bash
#libraries
getLib "output" "input"
```
this loads libraries that you want from this repository.  
Libraries are also automatically updated when the file in the repository changes.