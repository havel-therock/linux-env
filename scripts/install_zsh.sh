#!/bin/sh

set -xeu # debug info, exit on error, treat unset variables as errors

LINUX_ENV_SETTINGS=${1}/shell-settings

# set default shell to zsh
# Always ask about it!!!
echo "\n################################################################################"
echo "Do you want to set zsh as a default shell? (y/n)"

read input
case $input in
  y|Y)
      chsh -s /bin/zsh
      echo "Default shell set to zsh" ;;
  n|N)
      echo "'$(echo $SHELL)' remains the default shell" ;;
  *)
      echo "No action" ;;
esac
echo "################################################################################"



# install OhMyZsh

# set custom directory for OhMyZsh
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
export ZSH=$USER_HOME/.oh-my-zsh

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

sed -i "s|^.*ZSH_CUSTOM=.*$|ZSH_CUSTOM=${LINUX_ENV_SETTINGS}|" ${USER_HOME}/.zshrc
