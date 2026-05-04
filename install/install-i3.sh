#!/bin/bash

sudo $INSTALL_CMD i3 i3blocks

ln -s ${CONFIGS_DIR}/i3 ${USER_HOME_DIR}/.config/i3
ln -s ${CONFIGS_DIR}/i3blocks ${USER_HOME_DIR}/.config/i3blocks
