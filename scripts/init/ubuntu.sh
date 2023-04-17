#!/bin/bash -eu
whiptail --yesno "Setup dotfiles for Ubuntu\n\n Would you like to setup repository to use mirrors\n and install essential packages?" 0 0

if [ $? ]; then
	#apt mirror
	sudo sed -i.bak -r 's!(deb|deb-src) \S+!\1 mirror+http://mirrors.ubuntu.com/mirrors.txt!' /etc/apt/sources.list
	sudo apt update

	#install packages
	sudo apt -y install zsh wget unzip tmux libfuse2
fi
