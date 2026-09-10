#!/bin/bash


VERSION=v0.12.1
OLD_GLIBC_VERSION=v0.12.2
NVIM_RELEASE=https://github.com/neovim/neovim/releases/download/${VERSION}/nvim-linux-x86_64.tar.gz
OLD_GLIBC_NVIM_RELEASE=https://github.com/neovim/neovim-releases/releases/download/${OLD_GLIBC_VERSION}/nvim-linux-x86_64.tar.gz
TR_VERSION=v0.27.0
TREE_SITTER_RELEASE=https://github.com/tree-sitter/tree-sitter/releases/download/${TR_VERSION}/tree-sitter-cli-linux-x64.zip



cd ${TOOLS_DIR}

wget $NVIM_RELEASE
# use below instead if system has old glibc
# wget $OLD_GLIBC_NVIM_RELEASE
wget $TREE_SITTER_RELEASE

tar xzvf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz

unzip tree-sitter-cli-linux-x64.zip -d ${TOOLS_DIR}/tree-sitter-cli-linux-x64
rm tree-sitter-cli-linux-x64.zip

# Symlinks
ln -sn ${CONFIGS_DIR}/nvim ${USER_HOME_DIR}/.config/nvim

# TODO: @Kacper
# grant such access to this script so the sudo wouldn't ask for a password
sudo ln -s ${TOOLS_DIR}/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
sudo ln -s ${TOOLS_DIR}/tree-sitter-cli-linux-x64/tree-sitter /usr/local/bin/tree-sitter
