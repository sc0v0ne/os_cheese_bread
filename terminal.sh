#!/usr/bin/bash

echo "Initialize installation terminal"


function check_update {
    sudo apt update
}

function install_zsh {
    sudo apt install zsh -y
    chsh -s /bin/zsh
}

function install_oh_my_zsh {
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    mkdir -p ~/.fonts
    git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf
    fc-cache -vf
}

# ⚠️ ⚠️ Restart the machine update all packages ⚠️ ⚠️ 

check_update
install_zsh
install_oh_my_zsh


echo "Finish installation terminal"