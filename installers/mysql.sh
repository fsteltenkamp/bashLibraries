#!/bin/bash
function mysqlInstall() {
    coloredEcho "Installing MySQL Server & Client" cyan
    packageInstall mysql-server mysql-client
}