#!/bin/sh

set -xeu # debug info, exit on error, treat unset variables as errors

sudo $INSTALL_CMD zsh


chsh -s /bin/zsh
echo "Default shell set to zsh"



# install OhMyZsh

# set custom directory for OhMyZsh
export ZSH=$USER_HOME_DIR/.oh-my-zsh

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

sed -i "s|^.*ZSH_CUSTOM=.*$|ZSH_CUSTOM=${CONFIGSDIR}/zsh|" ${USER_HOME_DIR}/.zshrc
