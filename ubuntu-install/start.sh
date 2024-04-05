#!/bin/bash
# create config file
cat "# @author: github.comziohhue" >~/.johueshrc
config_file="$HOME/.johueshrc"

# config email,username
if [ -z "$email" ]; then
    read -p "Please enter your email address: " email
fi
if [ -z "$username" ]; then
    read -p "Please enter your username address: " username
fi

echo "export email=$email" >>$config_file
echo "export username=$username" >>$config_file
source $config_file

# Check whether Git install or no
if ! command -v git &>/dev/null; then
    echo "Git is no install, install git..."
    sudo apt update
    sudo apt install git
    git -v
    echo "Git install success"
else
    echo "Git installed"
fi

if ! command -v svn &>/dev/null; then
    read -p "[Subversion] Install nvm?(y/n)(default: y): " install_svn
fi
# todo: pull repo

# query
read -p "[SSH and GPG] Init SSH key?(y/n)(default: y): " init_SSH
read -p "[SSH and GPG] Init GPG key?(y/n)(default: y): " init_GPG
if "$username" == "haiziohhue"; then
    read -p "[SSH and GPG] Import haiziohhue public key in authorized_keys?(y/n)(default: y): " init_public_github_key

if ! command -v nvm &>/dev/null; then
    read -p "[Node]install nvm?(y/n)(default: y): " install_nvm
    if [ "$install_nvm" == "y" ]; then
        read -p "[Node] Use node_version?(default:16): " version_node
        read -p "[Node] Install pnpm?(y/n)(default: y): " install_pnpm
        read -p "[Node] Install yarn?(y/n)(default: y): " install_yarn
        read -p "[Node] Use cn mirror repository?(y/n)(default:y): " mirror_npm
    fi
fi

if ! command -v go &>/dev/null; then
    read -p "[Golang] Install go?(y/n)(default: y): " install_go
    if [ "$install_go" == "y" ]; then
        read -p "[Golang] Use go version?(default:1.20): " version_go
        read -p "[Golang] Use cn proxy?(y/n)(default:y): " proxy_go
        read -p "[Golang] Install go tools?(y/n)(default: y): " install_gotools
    fi
fi

if ! command -v java &>/dev/null; then
    read -p "[Java] Install java?(y/n)(default: y): " install_java
    if [ "$install_java" == "y" ]; then
        read -p "[Java] Use java version?(default:17): " version_java
        read -p "[Java] Install maven?(y/n)(default: y): " install_maven
        if [ "$install_maven" == "y" ]; then
            read -p "[Java] Use maven cn mirror?(default:3.8.6): " mirror_maven
        fi
        read -p "[Java] Install gradle?(y/n)(default: y): " install_gradle
        if [ "$install_gradle" == "y" ]; then
            read -p "[Java] Use gradle cn mirror?(default:3.8.6): " mirror_maven
        fi
    fi
fi

if ! command -v docker &>/dev/null; then
    read -p "[Docker] Install docker?(y/n)(default: y): " install_docker
    if [ "$install_docker" == "y" ]; then
        read -p "[Docker] Use docker mirror?(y/n)(default: y): " version_docker
        read -p "[Docker] Init deploy sql docker-compose?(y/n)(default: y): " init_sql
        read -p "[Docker] Setting role no sudo run docker?(y/n)(default: y): " role_docker
    fifi

if ! command -v lua &>/dev/null; then
    read -p "[Lua] Install lua?(y/n)(default: y): " install_lua
fi

read -p "[Font] Install 'HamoryOS sans SC' and fira code font?(y/n)(default: y): " install_font

if ! command -v zsh &>/dev/null; then
    read -p "[ZSH] Install zsh?(y/n)(default: y): " install_zsh
    read -p "[ZSH] Set zsh default shell?(y/n)(default: y): " shell_zsh
    if [ "$install_zsh" == "y" ]; then
        read -p "[ZSH] Install oh-my-zsh?(y/n)(default: y): " install_ohmyzsh
        if [ "$install_ohmyzsh" == "y" ]; then
            read -p "[ZSH] Use zsh theme?(default: robbyrussell): " theme_zsh
            read -p "[ZSH] Use zsh plugins?(y/n)(default: y): " install_zsh_plugins
        fi
    fi
fi

# build
sudo apt-get update

if install_nvm == "y"; then
    chmod +x ~/myshell/install/node.sh
    ~/myshell/install/node.sh $version_node $install_pnpm $install_yarn $mirror_npm
fi
if install_go == "y"; then
    chmod +x ~/myshell/install/go.sh
    ~/myshell/install/go.sh $version_go $proxy_go $install_gotools
fi
if install_java == "y"; then
    chmod +x ~/myshell/install/java.sh
    ~/myshell/install/java.sh $version_java $install_maven $install_gradle $mirror_maven
fi
if install_docker == "y"; then
    chmod +x ~/myshell/install/docker.sh
    ~/myshell/install/docker.sh $version_docker $init_sql $role_docker
fi
if install_lua == "y"; then
    chmod +x ~/myshell/install/lua.sh
    ~/myshell/install/lua.sh
fi
if install_zsh == "y"; then
    chmod +x ~/myshell/install/zsh.sh
    ~/myshell/install/zsh.sh $shell_zsh $theme_zsh $install_ohmyzsh $install_zsh_plugins
fi
if install_font == "y"; then
    chmod +x ~/myshell/install/font.sh
    ~/myshell/install/font.sh
fi

if init_SSH == "y"; then
    chmod +x ~/myshell/install/ssh.sh
    ~/myshell/install/ssh.sh $email $username
fi
if init_GPG == "y"; then
    chmod +x ~/myshell/install/gpg.sh
    ~/myshell/install/gpg.sh $eamil $username
if