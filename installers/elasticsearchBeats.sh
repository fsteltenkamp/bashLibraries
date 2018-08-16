#!/bin/bash
function installFilebeat() {
    installAptKey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    coloredEcho "Installing Requirements..." yellow
    packageInstall "apt-transport-https"
    addAptSource "deb https://artifacts.elastic.co/packages/6.x/apt stable main"
    coloredEcho "Refreshing Lists..." yellow
    packageUpdate
    coloredEcho "Installing Filebeat..."
    packageInstall filebeat
    if prompt_confirm "Enable Filebeat at Bootup?"; then
        coloredEcho "Enabling Filebeat at Bootup!"
        update-rc.d filebeat defaults 95 10
    fi
}

function installPacketbeat() {
    installAptKey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    coloredEcho "Installing Requirements..." yellow
    packageInstall "apt-transport-https"
    addAptSource "deb https://artifacts.elastic.co/packages/6.x/apt stable main"
    coloredEcho "Refreshing Lists..." yellow
    packageUpdate
    coloredEcho "Installing PacketBeat..."
    packageInstall packetbeat
    if prompt_confirm "Enable Packetbeat at Bootup?"; then
        coloredEcho "Enabling Packetbeat at Bootup!"
        update-rc.d packetbeat defaults 95 10
    fi
}

function installMetricbeat() {
    installAptKey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    coloredEcho "Installing Requirements..." yellow
    packageInstall "apt-transport-https"
    addAptSource "deb https://artifacts.elastic.co/packages/6.x/apt stable main"
    coloredEcho "Refreshing Lists..." yellow
    packageUpdate
    coloredEcho "Installing MetricBeat..."
    packageInstall metricbeat
    if prompt_confirm "Enable Metricbeat at Bootup?"; then
        coloredEcho "Enabling Metricbeat at Bootup!"
        update-rc.d metricbeat defaults 95 10
    fi
}

function installHeartbeat() {
    installAptKey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    coloredEcho "Installing Requirements..." yellow
    packageInstall "apt-transport-https"
    addAptSource "deb https://artifacts.elastic.co/packages/6.x/apt stable main"
    coloredEcho "Refreshing Lists..." yellow
    packageUpdate
    coloredEcho "Installing Heartbeat..."
    packageInstall heartbeat-elastic
    if prompt_confirm "Enable Heartbeat at Bootup?"; then
        coloredEcho "Enabling Heartbeat at Bootup!"
        update-rc.d heartbeat-elastic defaults 95 10
    fi
}

function installAudirbeat() {
    installAptKey "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
    coloredEcho "Installing Requirements..." yellow
    packageInstall "apt-transport-https"
    addAptSource "deb https://artifacts.elastic.co/packages/6.x/apt stable main"
    coloredEcho "Refreshing Lists..." yellow
    packageUpdate
    coloredEcho "Installing Auditbeat..."
    packageInstall auditbeat
    if prompt_confirm "Enable Auditbeat at Bootup?"; then
        coloredEcho "Enabling Auditbeat at Bootup!"
        update-rc.d auditbeat defaults 95 10
    fi
}