#!/bin/bash
default_plugins = "git zsh-autosuggestions zsh-syntax-highlighting"
sudo apt-get install -y zsh
$shell_zsh $theme_zsh $install_ohmyzsh $install_zsh_plugins
if "$shell_zsh"=="y"; then
    chsh -s $(which zsh)
    echo "export CONFIG_FILE=$HOME/.johueshrc" >>$HOME/.zshrc
    echo "source $CONFIG_FILE" >>$HOME/.zshrc
fi

if "$install_ohmyzsh"=="y"; then
    sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
    echo "ZSH_THEME=$theme_zsh" >>$HOME/.zshrc
    if "$install_zsh_plugins"=="y"; then
        echo "plugins=($default_plugins)" >>$HOME/.zshrc
    fi
fi
