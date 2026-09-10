#!/bin/bash


user_input_system() {
    read -p "What type of Linux distro is this? (0. ARCH) / (1. DEBIAN)" system_answ
    if [[ "$system_answ" == "0" ]]; then
        SYSTEM="ARCH"
    elif [[ "$system_answ" == "1" ]]; then
        SYSTEM="DEB"
    else
        echo "System not detected, no install happens"
        exit -1
    fi
}


user_input_system

export USER_HOME_DIR=${HOME}
export TOOLS_DIR=${USER_HOME_DIR}/tools

full_path=$(realpath $0)
dir_path=$(dirname $full_path)
# export LENV_ROOT_DIR="${dir_path%/*}"
export LENV_ROOT_DIR=$dir_path
export CONFIGS_DIR=${LENV_ROOT_DIR}/utils-configs
export SCRIPTS_DIR=${LENV_ROOT_DIR}/scripts
export LENV_INSTALL_DIR=${LENV_ROOT_DIR}/install
export LENV_PACKAGES_DIR=${LENV_ROOT_DIR}/install/packages
export SYSTEM


source ${SCRIPTS_DIR}/set-install-cmd.sh
