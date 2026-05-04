#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

#define here all paths to repo direcotires!


set_up() {
    echo "Setup..."
    source .scripts/export-envvar.sh
    echo "System is $SYSTEM"
    .scripts/create-dirs.sh

    # here we can run a script that will give a proper rights to install_scritps so they wont require password but still can
    # call sudo...
    # @TODO: Kacper
    # later
}

post_install() {
    echo "PostInstall... healthcheck?"
}

main() {

    set_up

    tools_to_install=$(find install/* -iname "install*")
    tools_to_install=$(echo $tools_to_install | xargs -n1 | sort | xargs)
    for script in $tools_to_install; do
        echo "Run ${script}..."
        ./$script
        # source ./install/$script
    done

    post_install
}

main "$@"
