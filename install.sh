#!/bin/sh
#
# This script installs all linux environment

# You should clone this into ${HOME}/.config dir.

sudo apt install git wget python3 zsh tmux clang g++ gcc clang-format cmake lldb clang-tidy ninja-build gettext unzip curl tree ripgrep python3-venv npm manpages

# create a link for .clang-format
ln -s -T  ${HOME}/.config/llvm/_clang-format ${HOME}/.clang-format

# set zsh as a default shell (sudo needed for not asking the password again)
sudo chsh -s /bin/zsh

# install OhMyZsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# set custom direcotry for OhMyZsh
sed -i 's|# ZSH_CUSTOM=/path/to/new-custom-folder|ZSH_CUSTOM=${HOME}/.config/shell-settings|' ~/.zshrc

# install neovim
mkdir -p ${HOME}/apps/
cd ${HOME}/apps/

wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

sudo ln -s -T ${HOME}/apps/nvim-linux64/bin/nvim /usr/local/bin/nvim

