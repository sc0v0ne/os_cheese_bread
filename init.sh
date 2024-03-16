#!/usr/bin/bash

echo "Initialize Pipeline OS"

function init_update {
    sudo apt update -y
    sudo apt upgrade -y
}

init_update
source packages.sh
source terminal.sh


echo "Finish Pipeline OS"