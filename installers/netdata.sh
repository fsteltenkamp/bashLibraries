#!/bin/bash
function netdataInstall() {
    bash <(curl -Ss https://my-netdata.io/kickstart.sh) all --dont-wait
}