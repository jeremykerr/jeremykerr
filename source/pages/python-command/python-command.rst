
Python Command
==============

    This shows you how to install a python application as a command in a Linux environment, so that you can call it directly from within a terminal. Note that the application is installed under your user account, so it will not be visible to other users. Additionally, it will not enable you to do anything you wouldn't normally be allowed to do, since it will be running with your user's permissions.
    
Install Dependencies
--------------------

First, install the dependencies needed to create a terminal command which executes arbitrary Python code: python3, python3-pip, and virtualenv.

.. code:: bash

    $ chmod u+x install-dependencies.sh
    $ sudo ./install-dependencies.sh

The file is `here </resources/code/python-command/install-dependencies.sh>`_.

Installation Script
-------------------

Next, download the installation script and the template script. Place them in the same directory as your project directory, so that your directory tree looks like the following:

.. parsed-literal::

    ./install-app.sh
    ./template.sh
    ./example
    ./example/main.py
    ./example/requirements.txt

You can download each file at the following links:

`install-app.sh </resources/code/python-command/install-app.sh>`_

`template.sh </resources/code/python-command/template.sh>`_

`main.py </resources/code/python-command/example/main.py>`_

`requirements.txt </resources/code/python-command/example/requirements.txt>`_

Now, to install, all you have to do is run the script. install-app.sh takes the following parameters:

+--------------+---------+-------------------------------+
| Status       | Flag    | Parameter                     |
+==============+=========+===============================+
| **Required** | -n      | <name-of-app>                 |
+--------------+---------+-------------------------------+
| *Optional*   | -v      | <name-of-virtual-environment> |
+--------------+---------+-------------------------------+
| *Optional*   | -r      | <name-of-requirements-file>   |
+--------------+---------+-------------------------------+
| *Optional*   | -s      | <name-of-script-to-install>   |
+--------------+---------+-------------------------------+


To install, you can call either of the following commands. They will result in the same installation.

.. code:: bash

    $ # First, you need to make the script callable
    $ chmod u+x install-app.sh

    $ ./install-app.sh -n example
    $ ./install-app.sh -n example -v example-venv -r requirements.txt -s example.sh
    
Calling the script
------------------

By now you should be able to call the script by simply opening a terminal anywhere and running the following command.

.. code:: bash

    $ example.sh


