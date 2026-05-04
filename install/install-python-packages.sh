#!/bin/bash


set -xeu # debug info, exit on error, treat unset variables as errors

sudo $INSTALL_CMD $(grep -vE "^\s*#" "$ROOT_DIR/install/${packages_file}"  | tr "\n" " ")

