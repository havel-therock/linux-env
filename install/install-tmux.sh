#!/bin/bash

set -xeu # debug info, exit on error, treat unset variables as errors

sudo $INSTALL_CMD tmux

ABSOLUTE_PATH_TO_TPM=${CONFIGS_DIR}/tmux/plugins/tpm
TPM_SUBMODULE_LOCATION="${ABSOLUTE_PATH_TO_TPM#$LENV_ROOT_DIR/}"

cd $LENV_ROOT_DIR
if [ -z "$( ls -A '.' )" ]; then
    git submodule update --init --remote --merge ${TPM_SUBMODULE_LOCATION}
else
    git submodule update --remote --merge ${TPM_SUBMODULE_LOCATION}
fi

cd $ABSOLUTE_PATH_TO_TPM

git checkout master

ln -sn ${CONFIGS_DIR}/tmux ${USER_HOME_DIR}/.config/tmux

