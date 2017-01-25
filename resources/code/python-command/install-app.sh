#!/bin/bash

function main {

    # Save current directory
    local CURRENT_DIR=$(pwd)
    # Create a variable to store application name in
    local APP_NAME=""
    local VENV_NAME=""
    local REQUIREMENTS_NAME=""
    local SCRIPT_NAME=""
    
    # Get arguments
    while getopts ":n:v:r:s:" opt; do
        case $opt in
            # -n: app_name
            n)
                APP_NAME=$OPTARG
                ;;
            v)
                VENV_NAME=$OPTARG
                ;;
            r)
                REQUIREMENTS_NAME=$OPTARG
                ;;
            s)
                SCRIPT_NAME=$OPTARG
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                exit 1
                ;;
            :)
                echo "Option -$OPTARG requires an argument" >&2
                exit 1
                ;;
            esac
    done

    # If app name was not set, fail and exit    
    if [[ -z $APP_NAME ]]; then
        echo "$APP_NAME is not a valid application name" >&2
        exit 1
    fi

    # If venv name was not set, use default    
    if [[ -z $VENV_NAME ]]; then
        VENV_NAME="${APP_NAME}-venv"
    fi

    # If venv requirements name was not set, use default    
    if [[ -z $REQUIREMENTS_NAME ]]; then
        REQUIREMENTS_NAME="requirements.txt"
    fi

    # If script name was not set, use default    
    if [[ -z $SCRIPT_NAME ]]; then
        SCRIPT_NAME="${APP_NAME}.sh"
    fi

    # Check if $HOME/bin exists, otherwise create it
    [ -d $HOME/bin ] || mkdir $HOME/bin

    # Copy the application to the calling user's bin
    mkdir $HOME/bin/${APP_NAME}
    cp -R ./${APP_NAME} $HOME/bin/$APPNAME/
    
    # Create the virtual environment and install the requirements
    cd $HOME/bin/${APP_NAME}
    virtualenv -p python3 ${VENV_NAME}
    source ${VENV_NAME}/bin/activate
    pip install -r ${REQUIREMENTS_NAME} --upgrade
    deactivate

    # Change back to the original directory
    cd $CURRENT_DIR
    
    # Check if $HOME/bin is in the bash profile, otherwise append it and reload the profile
    if ! grep -Fq "PATH=\"\$HOME/bin:\$PATH\"" $HOME/.profile ; then
        echo -e "\n# set PATH so it includes user's private bin if it exists\n" >> $HOME/.profile
        echo -e "if [ -d \"\$HOME/bin\" ]; then\n" >> $HOME/.profile
        echo -e "    PATH=\"\$HOME/bin:\$PATH\"\n" >> $HOME/.profile
        echo -e "fi\n" >> $HOME/.profile
        source $HOME/.profile
    fi
    
    # Write a callable script
    sed "s/<APP-NAME>/${APP_NAME}/g" template.sh >> ${SCRIPT_NAME}
    sed -i "s/<VENV-NAME>/${VENV_NAME}/g" ${SCRIPT_NAME}

    # Move the script to its final location and change its permissions
    echo "TEST"
    chmod u+x ${SCRIPT_NAME}
    ls
    echo ${HOME}/bin/
    mv ${SCRIPT_NAME} ${HOME}/bin/

}

if [ "${1}" != "--no-execute" ]; then
    main "${@}"
fi

