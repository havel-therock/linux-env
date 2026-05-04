#!/bin/bash

# if moving this script elsewhere, modify LENV_ROOT_DIR manually to point to the ROOT of the project!
#


full_path=$(realpath $0)
dir_path=$(dirname $full_path)
export LENV_ROOT_DIR="${dir_path%/*}"

export CONFIGS_DIR=${LENV_ROOT_DIR}/utils-configs
export USER_HOME_DIR=${HOME}
export TOOLS_DIR=${USER_HOME_DIR}/tools
export SYSTEM=ARCH      # DEBIAN or else...

source ${LENV_ROOT_DIR}/scripts/set-install-cmd.sh
