#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

set_up() {
    echo "Setup..."
    source ./scripts/export-envvar.sh
    echo "System is $SYSTEM"
    ${SCRIPTS_DIR}/create-dirs.sh

    # here we can run a script that will give a proper rights to install_scritps so they wont require password but still can
    # call sudo...
    # @TODO: Kacper
    # later
}

install_all() {
    local tools_to_install=$(find install/* -iname "install*")
    tools_to_install=$(echo $tools_to_install | xargs -n1 | sort)
    for script in $tools_to_install; do
        echo "Run ${script}..."
        ./$script
        # source ./install/$script
    done
}

install_selected() {
    SELECTED_TOOLS=$(echo $SELECTED_TOOLS | xargs -n1 | grep -vE "^\s*#" | xargs -n1 | sort)
    for script in $SELECTED_TOOLS; do
        echo "Run ${script}..."
        #./install/$script
        ${LENV_INSTALL_DIR}/$script
    done
}

post_install() {
    echo "PostInstall... healthcheck?"
}

main() {
    set_up
    install_selected
    # install_all
    post_install
}


SELECTED_TOOLS="
    #install-20-packages.sh
    #install-19-git.sh
    #install-cpp-packages.sh
    #install-i3.sh
    #install-impala.sh
    #install-neovim.sh
    #install-python-packages.sh
    #install-tmux.sh
    #install-zsh.sh
"

main "$@"
