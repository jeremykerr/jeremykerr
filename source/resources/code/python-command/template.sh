#!/bin/bash

function main {

    # Save current directory so it can be restored later
    local CURRENT_DIR=$(pwd)
    
    # Change to the application directory
    cd $HOME/bin/<APP-NAME>
    
    # Activate the virtual environment
    source ./<VENV-NAME>/bin/activate
    
    python main.py
    
    # Deactivate the virtual environment
    deactivate
    
    # Go back to the caller directory
    cd $CURRENT_DIR

}

if [ "${1}" != "--no-execute" ]; then
    main "${@}"
fi


