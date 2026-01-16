#!/bin/sh

set -xeu # debug info, exit on error, treat unset variables as errors

# TODO: @Kacper
# add support for other packages than apt

packages_file="./packages/core-utils-apt.packages"

sudo apt-get install $(grep -vE "^\s*#" ${packages_file}  | tr "\n" " ")
