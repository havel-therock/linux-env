#!/bin/sh

set -xeu # debug info, exit on error, treat unset variables as errors

install_cmd=${1}
LINUX_ENV_ROOT_DIR=${2}

filename=${LINUX_ENV_ROOT_DIR}/packages/utils.txt
$install_cmd $(grep -vE "^\s*#" ${filename}  | tr "\n" " ")
