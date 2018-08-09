#!/bin/bash
function mysqlInstall() {
    coloredEcho "Installing MySQL Server" cyan
    packageInstall mysql-server mysql-client
}