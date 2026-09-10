#!/bin/sh

set -xeu # debug info, exit on error, treat unset variables as errors

sudo $INSTALL_CMD zsh

# install OhMyZsh

# set custom directory for OhMyZsh
export ZSH=$USER_HOME_DIR/.oh-my-zsh

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

sed -i "s|^.*ZSH_CUSTOM=.*$|ZSH_CUSTOM=${CONFIGS_DIR}/zsh|" ${USER_HOME_DIR}/.zshrc
