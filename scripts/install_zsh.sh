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
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# set custom direcotry for OhMyZsh
sed -i 's|# ZSH_CUSTOM=/path/to/new-custom-folder|ZSH_CUSTOM=${LINUX_ENV_SETTINGS}|' ~/.zshrc
