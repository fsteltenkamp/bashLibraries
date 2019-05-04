#!/bin/bash
#TODO: Export instead of declare -g ??
declare -A sysinfo

function sysinfo_general_sysinfo() {
    declare -g SYSINFO_GEN_SY_PROVIDER="$0"
    declare -g SYSINFO_GEN_SY_TIME=$(date)
    declare -g SYSINFO_GEN_SY_WEEK=$(date + "%V")
}

function sysinfo_general() {
    declare -g SYSINFO_GEN_ARCH=$(uname -m)
    declare -g SYSINFO_GEN_KERN=$(uname -r)
    declare -g SYSINFO_GEN_DISTRO=$(head -n1 /etc/issue)
    declare -g SYSINFO_GEN_DISTRO_VERSION=$(head -n1 /etc/issue | awk '{ gsub(/,/, ""); print $3}')
    declare -g SYSINFO_GEN_CODENAME=$(lsb_release -cs)
    declare -g SYSINFO_GEN_HOSTNAME=$(hostname)
    declare -g SYSINFO_GEN_CURUSER=$(whoami)
    declare -g SYSINFO_GEN_USERCOUNT=$(users | wc -w)
    declare -g SYSINFO_GEN_LOGGEDINUSERS=$(w | cut -d " " -f 1 - | grep -v USER | sort -u)
    declare -g SYSINFO_GEN_UPTIME=$(uptime | awk '{ gsub(/,/, ""); print $3 }')
    declare -g SYSINFO_GEN_RUNLEVEL=$(runlevel)
    declare -g SYSINFO_GEN_PROCCOUNT=$(ps ax | wc -l)
}

function sysinfo_memory() {
    local mem=$(cat /proc/meminfo)
    local free=$(free -m)
}

function sysinfo_filesysteminfo() {
    local fs=$(df -h)
}

function sysinfo_net() {
    IFINFO=$(ifconfig)
}

function sysinfo_pci() {
    PCIINFO=$(lspci -tv)
}

function sysinfo_ramusage() {
    local total=$(free | awk '/^Mem:/ {print $2}')
    local used=$(free | awk '/^Mem:/ {print $3}')
    local free=$(free | awk '/^Mem:/ {print $4}')
    local shared=$(free | awk '/^Mem:/ {print $5}')
    local buffers=$(free | awk '/^Mem:/ {print $6}')
    local cached=$(free | awk '/^Mem:/ {print $7}')
}

function sysinfo_swapusage() {
    local total=$(free | awk '/^Swap:/ {print $2}')
    local used=$(free | awk '/^Swap:/ {print $3}')
    local free=$(free | awk '/^Swap:/ {print $4}')
}

function sysinfo_cpuusage() {
    local processusage=$(ps axch -o cmd:15,%cpu --sort=-%cpu)
}

function sysinfo_memusage() {
    local memusage=$(ps axch -o cmd:15,%mem --sort=-%mem)
}

function sysinfo_cpuhogs() {
    local toptenhogs=$(sysinfo_cpuusage raw | head)
}

function sysinfo_memhogs() {
    local toptenhogs=$(sysinfo_memusage raw | head)
}

function sysinfo_cpuinfo() {
    local cpu=$(grep -c 'processor' /proc/cpuinfo)
    local model=$(awk -F':' '/^model name/ { print $2 }' /proc/cpuinfo)
    local vendor=$(awk -F':' '/^vendor_id/ { print $2 }' /proc/cpuinfo)
    local speed=$(awk -F':' '/^cpu MHz/ { print $2 }' /proc/cpuinfo)
    local cache=$(awk -F':' '/^cache size/ { print $2 }' /proc/cpuinfo)
}