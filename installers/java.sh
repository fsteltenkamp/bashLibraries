#!/bin/bash
function javaInstallMan() {
    coloredEcho "Making Java Path" cyan
    checkCreateDir /usr/lib/jvm
    coloredEcho "Downloading Java" cyan
    downloadFile "http://javadl.oracle.com/webapps/download/AutoDL?BundleId=233162_512cd62ec5174c3487ac17c61aaa89e8" "jvm.tar.gz"
    coloredEcho "Unpacking Java" cyan
    checkCreateDir jvm
    tar -xzf jvm.tar.gz -C ./jvm --strip-components=1
    coloredEcho "Moving Java to Install Folder" cyan
    mv ./jvm/ /usr/lib/jvm/jvm1.8.0
    coloredEcho "Updating..."
    update-alternatives --install /usr/bin/java java /usr/lib/jvm/jvm1.8.0/jre/bin/java 3
    coloredEcho "Installing Java Certificates..."
    apt-get install -y ca-certificates-java
    update-ca-certificates -f
    coloredEcho "Cleaning up..." cyan
    coloredEcho "Removing unpacked Java" cyan
    rm -r jvm
    coloredEcho "Removing Java Download" cyan
    rm jvm.tar.gz
    coloredEcho "Java Install complete." green
}

function javaInstallOpenJDK8() {
    coloredEcho "Installing OpenJDK 8"
    packageInstall openjdk-8-jre
}

function javaInstallOpenJDK7() {
    coloredEcho "Installing OpenJDK 7"
    packageInstall openjdk-7-jre
}