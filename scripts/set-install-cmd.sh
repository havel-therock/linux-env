#!/bin/bash

if [[ "$SYSTEM" == "ARCH" ]]; then
    INSTALL_CMD="pacman --noconfirm -S"
elif [[ "$SYSTEM" == "DEB" ]]; then
    INSTALL_CMD="apt-get -y install"
else
   echo "System not detected, no install happens"
   exit 0
fi

export INSTALL_CMD
