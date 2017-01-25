
Python Command
==============

    This shows you how to install a python application as a command in a Linux environment, so that you can call it directly from within a terminal. Note that the application is installed under your user account, so it will not be visible to other users. Additionally, it will not enable you to do anything you wouldn't normally be allowed to do, since it will be running with your user's permissions.
    
Install Dependencies
--------------------

    In order to do this, there are several dependencies you'll need to have installed: python3, python3-pip, and virtualenv.
    
.. code:: bash

    $ sudo apt-get install python3 python3-pip 

After this, you should be able to install virtualenv

.. code:: bash

    $ pip3 install virtualenv --upgrade

You may want to also upgrade pip3.

.. code:: bash

    $ pip3 install --upgrade pip

Installation Script
-------------------

Let's assume your Python application is in a directory called "example", the Python 3 library requirements are in a file called "requirements.txt", and the main callable script is "main.py". Therefore your directory structure is as follows:

.. parsed-literal::

    .
    ./example/
    ./example/main.py
    ./example/requirements.txt
    ./example/<supporting files and resources>

For the script to be installed on the system, we'll want a virtual environment for it to run in, and we'll want it stored under **$HOME/bin/example**. Furthermore, we'll want a Bash script that will activate the virtual environment and run the application. Therefore, the directory structure will look like the following:

.. parsed-literal::

    $HOME/bin/example.sh
    $HOME/bin/example-venv
    $HOME/bin/example/
    $HOME/bin/example/main.py
    $HOME/bin/example/requirements.txt
    $HOME/bin/example/<supporting files and resources>

Therefore, the installation script has to complete a number of tasks in order to install the example application.

1. Shebang! The script shouldn't assume the correct shell will be used without explicitly specifying.

.. code:: bash

    #!/bin/bash

2. Save the current directory to a variable, so it can be restored after the installation.

.. code:: bash

    CURRENT_DIR=$(pwd)

3. Ensure that the $HOME/bin directory exists, otherwise create it.

.. code:: bash

    [ -d $HOME/bin ] || mkdir $HOME/bin
    
4. Copy the example directory contents to $HOME/bin/example.

.. code:: bash

    mkdir $HOME/bin/example
    cp -R ./example/* $HOME/bin/example/

5. Create a virtual environment and install the requirements.
    
.. code:: bash

    cd $HOME/bin/
    virtualenv -p python3 example-venv
    source example-venv/bin/activate
    pip install -r requirements.txt --upgrade
    deactivate

6. Change back to the original directory.

.. code:: bash

    cd $CURRENT_DIR

7. Check if **$HOME/bin** is in the bash profile, otherwise append it and reload the profile.

.. code:: bash

    if ! grep -Fq "PATH=\"\$HOME/bin:\$PATH\"" $HOME/.profile ; then
        echo -e "\n# set PATH so it includes user's private bin if it exists\n" >> $HOME/.profile
        echo -e "if [ -d \"\$HOME/bin\" ]; then\n" >> $HOME/.profile
        echo -e "    PATH=\"\$HOME/bin:\$PATH\"\n" >> $HOME/.profile
        echo -e "fi\n" >> $HOME/.profile
        source $HOME/.profile
    fi

8. Write the callable script and enable the user to execute it.

.. code:: bash

    touch $HOME/bin/example.sh
    echo -e "#!/bin/bash\n" >> $HOME/bin/example.sh
    echo -e "\n" >> $HOME/bin/example.sh
    echo -e "CURRENT_DIR=\$(pwd)\n" >> $HOME/bin/example.sh
    echo -e "\n" >> $HOME/bin/example.sh
    echo -e "cd \$HOME/bin/example\n" >> $HOME/bin/example.sh
    echo -e "\n" >> $HOME/bin/example.sh
    echo -e "source ./example-venv/bin/activate\n" >> $HOME/bin/example.sh
    echo -e "\n" >> $HOME/bin/example.sh
    echo -e "python example/main.py\n" >> $HOME/bin/example.sh
    echo -e "\n" >> $HOME/bin/example.sh
    echo -e "deactivate\n" >> $HOME/bin/example.sh
    echo -e "\n" >> $HOME/bin/example.sh
    echo -e "cd \$CURRENT_DIR/\n" >> $HOME/bin/example.sh
    echo -e "\n" >> $HOME/bin/example.sh

    chmod u+x $HOME/bin/example.sh
    
Calling the script
------------------

By now you should be able to call the script by simply opening a terminal and running it from anywhere.

.. code:: bash

    $ example.sh


