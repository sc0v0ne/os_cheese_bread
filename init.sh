#!/usr/bin/bash

echo "Initializar Pipeline OS"

function init_update {
    sudo apt update -y
    sudo apt upgrade -y
}

init_update



source packages.sh
