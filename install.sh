#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

#export glob variables needed for installation script
# paths etc...
export USER_HOME_DIR=${HOME}
export TOOLS_DIR=${USER_HOME_DIR}/tools
export

set_up() {

}

post_install() {

}

main() {

    set_up()

    local tools_to_install=(
    install-packages.sh
    install-tmux.sh
    install-neovim.sh
    )

    for script in $tools_to_install; do
        source ./install/$script
    done

    post_install()
}

main "$@"
