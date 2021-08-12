#!/bin/bash -eu

#apt mirror
sudo sed -i.bak -r 's!(deb|deb-src) \S+!\1 mirror+http://mirrors.ubuntu.com/mirrors.txt!' /etc/apt/sources.list
sudo apt update

#install packages
sudo apt -y install zsh git curl wget unzip make tmux vim
