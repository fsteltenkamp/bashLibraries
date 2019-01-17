#!/bin/bash
declare -A sysinfo

function sysinfo_general_sysinfo() {
    declare -A gensysinfo
    gensysinfo[provider]="$0"
    gensysinfo[time]=$(date)
    gensysinfo[week]=$(date + "%V")
    sysinfo[gensysinfo]=$gensysinfo
    echo $gensysinfo
}

function sysinfo_general() {
    ARCH=$(uname -m)
    KERN=$(uname -r)
    DISTRO=$(head -n1 /etc/issue)
    CODENAME=$(lsb_release -cs)
    HOSTNAME=$(hostname)
    CURUSER=$(whoami)
    USERCOUNT=$(users | wc -w)
    LOGGEDINUSERS=$(w | cut -d " " -f 1 - | grep -v USER | sort -u)
    UPTIME=$(uptime | awk '{ gsub(/,/, ""); print $3 }')
    RUNLEVEL=$(runlevel)
    PROCCOUNT=$(ps ax | wc -l)
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