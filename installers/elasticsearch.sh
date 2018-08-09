#!/bin/bash
function elasticsearchInstall() {
    coloredEcho "Installing PGP Key..." yellow
    downloadFile "https://artifacts.elastic.co/GPG-KEY-elasticsearch" "-" | apt-key add -
    coloredEcho "Installing Requirements..." yellow
    packageInstall apt-transport-https
    coloredEcho "Installing Repository..." yellow
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
    coloredEcho "Refreshing Lists..." yellow
    packageUpdate
    coloredEcho "Installing Elasticsearch..."
    packageInstall elasticsearch
    if prompt_confirm "Enable Elasticsearch at Bootup?"; then
        coloredEcho "Enabling Elasticsearch at Bootup!"
        /bin/systemctl daemon-reload
        /bin/systemctl enable elasticsearch.service
    fi
}

function kibanaInstall() {
    coloredEcho "Installing PGP Key..." yellow
    downloadFile "https://artifacts.elastic.co/GPG-KEY-elasticsearch" "-" | apt-key add -
    coloredEcho "Installing Requirements..." yellow
    packageInstall apt-transport-https
    coloredEcho "Installing Repository..." yellow
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
    coloredEcho "Refreshing Lists..." yellow
    packageUpdate
    coloredEcho "Installing Kibana..."
    packageInstall kibana
    if prompt_confirm "Enable Kibana at Bootup?"; then
        coloredEcho "Enabling Kibana at Bootup!"
        /bin/systemctl daemon-reload
        /bin/systemctl enable kibana.service
    fi
}

function logstashInstall() {
    coloredEcho "Installing PGP Key..." yellow
    downloadFile "https://artifacts.elastic.co/GPG-KEY-elasticsearch" "-" | apt-key add -
    coloredEcho "Installing Requirements..." yellow
    packageInstall apt-transport-https
    coloredEcho "Installing Repository..." yellow
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
    coloredEcho "Refreshing Lists..." yellow
    packageUpdate
    coloredEcho "Installing Logstash..."
    packageInstall logstash
    if prompt_confirm "Enable Logstash at Bootup?"; then
        coloredEcho "Enabling Logstash at Bootup!"
        /bin/systemctl daemon-reload
        /bin/systemctl enable logstash.service
    fi
}