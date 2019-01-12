function installmotd() {
    coloredEcho "Downloading Simple Motd..." cyan
    downloadFile https://gitlab.com/snippets/1719592/raw /etc/motd
    coloredEcho "Motd has been updated..." green
    # collecting system info
    hostname=$(uname -n)
    kernver=$(uname -v)
    kernres=$(uname -r)
    cpuinfo=$(sudo lshw -short | grep processor)
    cpuname=$()
    # replace values
    coloredEcho "Replacing Detected Values..." cyan
}