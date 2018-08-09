#!/bin/bash
function installFilebeat() {
    coloredEcho "Installing PGP Key..." yellow
    downloadFile "https://artifacts.elastic.co/GPG-KEY-elasticsearch" "-" | apt-key add -
    coloredEcho "Installing Requirements..." yellow
    packageInstall apt-transport-https
    coloredEcho "Installing Repository..." yellow
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
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
    coloredEcho "Installing PGP Key..." yellow
    downloadFile "https://artifacts.elastic.co/GPG-KEY-elasticsearch" "-" | apt-key add -
    coloredEcho "Installing Requirements..." yellow
    packageInstall apt-transport-https
    coloredEcho "Installing Repository..." yellow
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
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
    coloredEcho "Installing PGP Key..." yellow
    downloadFile "https://artifacts.elastic.co/GPG-KEY-elasticsearch" "-" | apt-key add -
    coloredEcho "Installing Requirements..." yellow
    packageInstall apt-transport-https
    coloredEcho "Installing Repository..." yellow
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
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
    coloredEcho "Installing PGP Key..." yellow
    downloadFile "https://artifacts.elastic.co/GPG-KEY-elasticsearch" "-" | apt-key add -
    coloredEcho "Installing Requirements..." yellow
    packageInstall apt-transport-https
    coloredEcho "Installing Repository..." yellow
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
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
    coloredEcho "Installing PGP Key..." yellow
    downloadFile "https://artifacts.elastic.co/GPG-KEY-elasticsearch" "-" | apt-key add -
    coloredEcho "Installing Requirements..." yellow
    packageInstall apt-transport-https
    coloredEcho "Installing Repository..." yellow
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
    coloredEcho "Refreshing Lists..." yellow
    packageUpdate
    coloredEcho "Installing Auditbeat..."
    packageInstall auditbeat
    if prompt_confirm "Enable Auditbeat at Bootup?"; then
        coloredEcho "Enabling Auditbeat at Bootup!"
        update-rc.d auditbeat defaults 95 10
    fi
}