#!/bin/bash

set -xeu # debug info, exit on error, treat unset variables as errors


if [[ "$SYSTEM" == "ARCH" ]]; then
    packages_file=${LENV_PACKAGES_DIR}/python-utils-pacman.packages
elif [[ "$SYSTEM" == "DEB" ]]; then
    packages_file=${LENV_PACKAGES_DIR}/python-utils-apt.packages
else
   echo "System not detected, no install happens"
   exit 0
fi

sudo $INSTALL_CMD $(grep -vE "^\s*#" "${packages_file}"  | tr "\n" " ")

