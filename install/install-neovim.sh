#!/bin/bash


VERSION=v0.12.1
OLD_GLIBC_VERSION=v0.12.2
NVIM_RELEASE=https://github.com/neovim/neovim/releases/download/${VERSION}/nvim-linux-x86_64.tar.gz
OLD_GLIBC_NVIM_RELEASE=https://github.com/neovim/neovim-releases/releases/download/${OLD_GLIBC_VERSION}/nvim-linux-x86_64.tar.gz


cd ${TOOLS_DIR}

wget $NVIM_RELEASE
# use below instead if system has old glibc
# wget $OLD_GLIBC_NVIM_RELEASE

tar xzvf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

# Symlinks
ln -sn ${CONFIGS_DIR}/nvim ${USER_HOME_DIR}/.config/nvim
# TODO: @Kacper
# grant such access to this script so the sudo wouldn't ask for a password
sudo ln -s ${TOOLS_DIR}/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
