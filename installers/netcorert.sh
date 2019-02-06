#!/bin/bash
function netcorertInstall() {
    coloredEcho "Installing .NET Core Runtime" cyan
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
    echo "deb [arch=amd64] https://packages.microsoft.com/$SYSINFO_GEN_CODENAME/$SYSINFO_GEN_DISTRO_VERSION/prod $SYSINFO_GEN_CODENAME main" > /etc/apt/sources.list.d/netcore.list
    chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
    chown root:root /etc/apt/sources.list.d/netcore.list
    packageUpdate
    packageInstall aspnetcore-runtime-2.2
}