#!/bin/bash

function main {

    # Install python3, pip, and python3-dev
    apt-get install python3 python3-pip python3-dev

    # Install virtualenv
    pip3 install virtualenv --upgrade

    # Upgrade pip
    pip3 install --upgrade pip

}

if [ "${1}" != "--no-execute" ]; then
    main "${@}"
fi


