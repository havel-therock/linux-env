#!/bin/sh

set -xeu # debug info, treat unset variables as errors

link_tools () {
for tool in $@
do
  link_path=${COMMON_LINK_PREFIX}/${tool}
  if [ ! -e $link_path ]; then
    ln -sn ${LINUX_ENV_ROOT_DIR}/${tool} $link_path
  else
    echo "A file, symlink, or directory with the name ${link_path} already exists."
  fi
done
}

################################################################################

LINUX_ENV_ROOT_DIR=${1}
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

mkdir -p ${USER_HOME}/.config

COMMON_LINK_PREFIX=${USER_HOME}/.config
COMMON_DESTINATION_PREFIX=${LINUX_ENV_ROOT_DIR}

link_tools "tmux" "nvim"

clang_format_link=${USER_HOME}/.clang-format
echo ${clang_format_link}
if [ ! -e $clang_format_link ]; then
  ln -sn ${LINUX_ENV_ROOT_DIR}/llvm/clang-format $clang_format_link
else
  echo "A file, symlink, or directory with the name ${clang_format_link} already exists."
fi

chown -R ${SUDO_USER}:${SUDO_USER} ${USER_HOME}/.config
