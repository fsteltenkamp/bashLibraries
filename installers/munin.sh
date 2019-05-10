#!/bin/bash
#include plugins
getInstaller "muninPlugins"

function muninMasterInstall() {
    coloredEcho "Installing munin..." cyan
    packageInstall munin munin-node
    coloredEcho "Munin installed!" green
}

function muninNodeInstall() {
    coloredEcho "Installing Munin-Node" cyan
    packageInstall munin-node
    coloredEcho "Munin-Node installed!" green
    coloredEcho "You will need to define a master-server yourself!" cyan
}

function muninNodeAddMaster() {
    #TODO: Get this working!
    coloredEcho "This feature is currently not working!" red
    return 0
    #MASTERADDRESS=$(user_input "Please Specify the IP-address of the Master-Node: ")
    #FORMATTED="allow ^"$(echo $MASTERADDRESS | sed -e 's/\./\\\./g')"$"
    #sed '/allow ^127\.0\.0\.1$/a $FORMATTED' /etc/munin/munin-node.conf
    #config=$(awk '1;/(allow \^127\\\.0\\\.0\\\.1\$)/{ print $FORMATTED; }' /etc/munin/munin-node.conf)
    #echo $config > test.txt
}

function muninPluginsInstall {
    coloredEcho "Installing Additional Plugins..." cyan
    COUNT=9 #adjust manually for now
    for ((i=0; i<COUNT; i++))
    do
        #shellcheck disable=SC2154
        pluginName=${muninPlugins[$i,1]}
        pluginFile=${muninPlugins[$i,2]}
        pluginUrl=${muninPlugins[$i,3]}
        pluginAuthor=${muninPlugins[$i,4]}

        coloredEcho "Installing $pluginName Plugin by $pluginAuthor" cyan
        downloadFile "$pluginUrl" "/usr/share/munin/plugins/$pluginFile"
        chown root:root "/usr/share/munin/plugins/$pluginFile"
        chmod 755 "/usr/share/munin/plugins/$pluginFile"
    done
}

function muninPluginsConfigure() {
    coloredEcho "Configuring Plugins" yellow
    PINGTARGETS=$( user_input "Specify Ping Targets (Separator: , ): " | tr "," "\n")
    for target in $PINGTARGETS; do
        coloredEcho "Setting $target up..." green
        ln -s "/usr/share/munin/plugins/ping_" "/etc/munin/plugins/ping_$target"
    done
    PORTLIST=$( user_input "Specify Ports to Scan (Separator: , ): " | tr "," "\n")
    for port in $PORTLIST; do
        coloredEcho "Setting $port up..." green
        ln -s "/usr/share/munin/plugins/port_" "/etc/munin/plugins/port_$port"
    done
}