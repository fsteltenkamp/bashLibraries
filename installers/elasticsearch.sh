#!/bin/bash
function elasticsearchInstall() {
    coloredEcho "Installing PGP Key..." yellow
    downloadFile "https://artifacts.elastic.co/GPG-KEY-elasticsearch" "-" | sudo apt-key add -
    coloredEcho "Installing Requirements..." yellow
    packageInstall apt-transport-https
    coloredEcho "Installing Repository..." yellow
    echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
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