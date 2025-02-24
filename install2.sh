#!/bin/sh
#
# install script 2.0
# gives options to:
#   * force reinstall
#   * soft force reinstall just update outdated stuff? with calling sudo apt install?
#   * install only selected stuff
#   * install only selected stuff interactively (passing y/n during installation itself)
#   * installing all stuff but not reinstalling already installed one
#   * detecting avalible package managers and installing packages correct for a distro

set -xeu # debug info, exit on error, treat unset variables as errors

LINUX_ENV_ROOT_DIR=$(dirname $(realpath "$0"))



# detect package avalible package manager
if command -v apt >/dev/null 2>&1; then
    echo "apt is available"
    install_cmd="apt install"
elif command -v yum >/dev/null 2>&1; then
    echo "yum is available"
elif command -v dnf >/dev/null 2>&1; then
    echo "dnf is available"
elif command -v zypper >/dev/null 2>&1; then
    echo "zypper is available"
elif command -v pacman >/dev/null 2>&1; then
    echo "pacman is available"
    install_cmd="pacman -S"
elif command -v brew >/dev/null 2>&1; then
    echo "brew is available"
elif command -v choco >/dev/null 2>&1; then
    echo "choco is available"
fi
if command -v pip >/dev/null 2>&1; then
    echo "pip is available"
else
    echo "No common package manager found"
fi



# utilities installations grouped in sensible packages

# what do you want to install?
#    --all --force --soft-force

# do you want usefull utilities?
# export this script to install_packages.sh
# and use it as a call from within other installation scripts

# Install packages. To adjust which packages are installed modify package/utils.txt
${LINUX_ENV_ROOT_DIR}/scripts/install_utils.sh "$install_cmd" "$LINUX_ENV_ROOT_DIR"
# ZSH
${LINUX_ENV_ROOT_DIR}/scripts/install_zsh.sh "$LINUX_ENV_ROOT_DIR"
# Create all symlinks
${LINUX_ENV_ROOT_DIR}/scripts/create_symlinks.sh "$LINUX_ENV_ROOT_DIR"

# # do you want nvim?
# ${LINUX_ENV_ROOT_DIR}/script/install_nvim.sh
# # do you want docker?
# ${LINUX_ENV_ROOT_DIR}/script/install_docker.sh
# # Do you want C++ env
# ${LINUX_ENV_ROOT_DIR}/script/install_cpp.sh
# # do you want Python env
# ${LINUX_ENV_ROOT_DIR}/script/install_python.sh
# # do you want usefull utilities?
# ${LINUX_ENV_ROOT_DIR}/script/install_utils.sh



# main with help window



