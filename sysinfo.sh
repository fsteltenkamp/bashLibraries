#!/bin/bash

function sysinfo_general_sysinfo() {
    export SYSINFO_GEN_SY_PROVIDER SYSINFO_GEN_SY_TIME SYSINFO_GEN_SY_WEEK
    SYSINFO_GEN_SY_PROVIDER="$0"
    SYSINFO_GEN_SY_TIME=$(date)
    SYSINFO_GEN_SY_WEEK=$(date + "%V")
}

function sysinfo_general() {
    export SYSINFO_GEN_ARCH SYSINFO_GEN_KERN SYSINFO_GEN_DISTRO SYSINFO_GEN_DISTRO_VERSION SYSINFO_GEN_CODENAME SYSINFO_GEN_HOSTNAME
    export SYSINFO_GEN_CURUSER SYSINFO_GEN_USERCOUNT SYSINFO_GEN_LOGGEDINUSERS SYSINFO_GEN_UPTIME SYSINFO_GEN_RUNLEVEL SYSINFO_GEN_PROCCOUNT
    SYSINFO_GEN_ARCH=$(uname -m) 
    SYSINFO_GEN_KERN=$(uname -r)
    SYSINFO_GEN_DISTRO=$(head -n1 /etc/issue)
    SYSINFO_GEN_DISTRO_VERSION=$(head -n1 /etc/issue | awk '{ gsub(/,/, ""); print $3}')
    SYSINFO_GEN_CODENAME=$(lsb_release -cs)
    SYSINFO_GEN_HOSTNAME=$(hostname)
    SYSINFO_GEN_CURUSER=$(whoami)
    SYSINFO_GEN_USERCOUNT=$(users | wc -w)
    SYSINFO_GEN_LOGGEDINUSERS=$(w | cut -d " " -f 1 - | grep -v USER | sort -u)
    SYSINFO_GEN_UPTIME=$(uptime | awk '{ gsub(/,/, ""); print $3 }')
    SYSINFO_GEN_RUNLEVEL=$(runlevel)
    SYSINFO_GEN_PROCCOUNT=$(ps ax | wc -l)
}

function sysinfo_memory() {
    export SYSINFO_MEM_MEM SYSINFO_MEM_FREE
    SYSINFO_MEM_MEM=$(cat /proc/meminfo)
    SYSINFO_MEM_FREE=$(free -m)
}

function sysinfo_filesysteminfo() {
    export SYSINFO_FSI_FS
    SYSINFO_FSI_FS=$(df -h)
}

function sysinfo_net() {
    export SYSINFO_NET_IFINFO
    SYSINFO_NET_IFINFO=$(ifconfig)
}

function sysinfo_pci() {
    export SYSINFO_PCI_PCIINFO
    SYSINFO_PCI_PCIINFO=$(lspci -tv)
}

function sysinfo_ramusage() {
    export SYSINFO_RAM_TOTAL SYSINFO_RAM_USED SYSINFO_RAM_FREE SYSINFO_RAM_SHARED SYSINFO_RAM_BUFFERS SYSINFO_RAM_CACHED
    SYSINFO_RAM_TOTAL=$(free | awk '/^Mem:/ {print $2}')
    SYSINFO_RAM_USED=$(free | awk '/^Mem:/ {print $3}')
    SYSINFO_RAM_FREE=$(free | awk '/^Mem:/ {print $4}')
    SYSINFO_RAM_SHARED=$(free | awk '/^Mem:/ {print $5}')
    SYSINFO_RAM_BUFFERS=$(free | awk '/^Mem:/ {print $6}')
    SYSINFO_RAM_CACHED=$(free | awk '/^Mem:/ {print $7}')
}

function sysinfo_swapusage() {
    export SYSINFO_SWAP_TOTAL SYSINFO_SWAP_USED SYSINFO_SWAP_FREE
    SYSINFO_SWAP_TOTAL=$(free | awk '/^Swap:/ {print $2}')
    SYSINFO_SWAP_USED=$(free | awk '/^Swap:/ {print $3}')
    SYSINFO_SWAP_FREE=$(free | awk '/^Swap:/ {print $4}')
}

function sysinfo_cpuusage() {
    export SYSINFO_CPU_PROCESSUSAGE
    SYSINFO_CPU_PROCESSUSAGE=$(ps axch -o cmd:15,%cpu --sort=-%cpu)
}

#function sysinfo_memusage() {
    #useful? have memory already
    #memusage=$(ps axch -o cmd:15,%mem --sort=-%mem)
#}

function sysinfo_cpuhogs() {
    export SYSINFO_CPUHOGS_TOPTEN
    SYSINFO_CPUHOGS_TOPTEN=$(sysinfo_cpuusage raw | head)
}

function sysinfo_memhogs() {
    export SYSINFO_MEMHOGS_TOPTEN
    SYSINFO_MEMHOGS_TOPTEN=$(sysinfo_memusage raw | head)
}

function sysinfo_cpuinfo() {
    export SYSINFO_CPUINFO_CPU SYSINFO_CPUINFO_MODEL SYSINFO_CPUINFO_VENDOR SYSINFO_CPUINFO_SPEED SYSINFO_CPUINFO_CACHE
    SYSINFO_CPUINFO_CPU=$(grep -c 'processor' /proc/cpuinfo)
    SYSINFO_CPUINFO_MODEL=$(awk -F':' '/^model name/ { print $2 }' /proc/cpuinfo)
    SYSINFO_CPUINFO_VENDOR=$(awk -F':' '/^vendor_id/ { print $2 }' /proc/cpuinfo)
    SYSINFO_CPUINFO_SPEED=$(awk -F':' '/^cpu MHz/ { print $2 }' /proc/cpuinfo)
    SYSINFO_CPUINFO_CACHE=$(awk -F':' '/^cache size/ { print $2 }' /proc/cpuinfo)
}