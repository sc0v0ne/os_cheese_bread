#!/usr/bin/bash

echo "Initialize installation packages"


function snap_install {
    sudo apt update
    sudo apt install snapd
}

function check_snap {
    sudo snap install hello-world
    output=$(hello-world)
    if [ output -eq 'Hello World!' ]; then
        echo "Check Ok Snap Packages !!!"
    else
        echo "Exception: was unable to install snap"
    fi
}


function packages_snap {
    sudo snap install cloudcompare
    sudo snap install spotify
    sudo snap install postman
    sudo snap install obsidian --classic
    sudo snap install todoist
    sudo snap install lsd
}

snap_install
check_snap
packages_snap

libs_ok=()
libs_fail=()
libs=(
    "build-essential"
    "python3-pip"
    "libssl-dev"
    "zlib1g-dev"
    "libbz2-dev"
    "libreadline-dev"
    "libsqlite3-dev"
    "curl"
    "libncursesw5-dev"
    "xz-utils"
    "tk-dev"
    "libxml2-dev"
    "libxmlsec1-dev"
    "libffi-dev"
    "liblzma-dev"
    "gcc"  
    )

for lib in "${libs[@]}"; do
    if apt-cache search "$lib" > /dev/null; then
        libs_ok+=("$lib")
    else
        libs_fail+=("$lib")
    fi
done

function install_classics (){
    local libs_ok=("$@")
    for lib in "${libs_ok[@]}"; do
        echo "Installing => $lib"
        sudo apt install "$lib" -y
    done
}

install_classics "${libs_ok[@]}"

function show_fails (){
    local libs_fails=("$@")
    echo "Libs Fail Installing !!!"
    for lib in "${libs_fails[@]}"; do
        echo "Fail Install => $lib"
    done
}

show_fails "${libs_fails[@]}"


function install_brew {
    sudo apt update
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install vim
    brew install pyenv
}

install_brew

echo "Finish install packages"