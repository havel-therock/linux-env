#!/bin/bash


set -xeu # debug info, exit on error, treat unset variables as errors

if [[ "$SYSTEM" == "ARCH" ]]; then
    packages_file=${LENV_PACKAGES_DIR}/cpp-utils-pacman.packages
elif [[ "$SYSTEM" == "DEB" ]]; then
    packages_file=${LENV_PACKAGES_DIR}/cpp-utils-apt.packages
else
   echo "System not detected, no install happens"
   exit 0
fi


sudo $INSTALL_CMD $(grep -vE "^\s*#" "${packages_file}"  | tr "\n" " ")

# Symlink for clang-format
ln -sn ${CONFIGS_DIR}/llvm/clang-format ${USER_HOME_DIR}/.clang-format

