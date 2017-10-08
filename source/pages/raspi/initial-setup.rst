
Raspberry Pi Setup
==================

    This shows how to get a Raspberry Pi available on a local area network in a reasonably secure way. This does not involve configuring the Raspberry Pi in great depth, but merely making the minimum number of changes to ensure that it can be accessed via SSH, using an RSA key-pair, with password authentication disabled and a static IP address set.
    
Flash Image to Micro SD Card
----------------------------

First, download the image you want to use. I used the Jessie Lite image available from the official Raspberry Pi website (Raspian). After downloading the image, verify that the signature matches the signature displayed on the site in order to ensure that you haven't downloaded a modified image from a malicious entity.

.. code:: bash

    $ sha1sum 2017-01-11-raspbian-jessie-lite.zip

Next, check which devices are currently mounted on your machine.

.. code:: bash

    $ df -h

Plug your micro SD card into your computer and rerun the command. Find the new file system or systems that were mounted. Generally, if it's a blank SD card, you'll only see one new file system, but if you've flashed an image to it, you'll see two. In my case, I was reflashing an SD card, so I saw /dev/sdc1 and /dev/sdc2.

.. code:: bash

    $ df -h

Unmount the file systems that are associated to your SD card. Be careful not to unmount any of the original filesystems you saw - if you accidentally unmount your primary or any other filesystems, you may wind up overwriting them, losing any data that may have been stored.

.. code:: bash

    $ umount /dev/sdc1
    $ umount /dev/sdc2

Unzip the file image and flash it to the SD card. If the filesystems were called /dev/sdc1, /dev/sdc2, etc., the disk can be referenced as /dev/sdc. Basically take the basename, without the file system index (the integer at the end).

.. code:: bash

    $ unzip 2017-01-11-raspbian-jessie-lite.zip
    $ sudo dd bs=4M if=2017-01-11-raspbian-jessie-lite.img of=/dev/sdc
    $ sync

Unplug the SD card and plug it into the Raspberry Pi. Be sure to have a keyboard and monitor plugged into it before powering it on, otherwise they may not be recognized.

Enable SSH
----------

Log into the Raspberry Pi, using the default username "pi" and default password "raspberry". Once logged in, enter the config and use the Advanced Options to enable SSH.

.. code:: bash

    $ sudo raspi-config

.. image:: ../../resources/images/raspi/raspi-config-advanced-options.png
    :align: center
    :alt:   raspi config advanced options
    :class: img-fluid

.. image:: ../../resources/images/raspi/raspi-config-ssh.png
    :align: center
    :alt:   raspi config select ssh
    :class: img-fluid
    
.. image:: ../../resources/images/raspi/raspi-config-enable-ssh.png
    :align: center
    :alt:   raspi config enable ssh
    :class: img-fluid

.. image:: ../../resources/images/raspi/raspi-config-success.png
    :align: center
    :alt:   raspi config success
    :class: img-fluid

Finally, reboot the Raspberry Pi to ensure the updated settings take effect. After this, you can unplug the monitor and keyboard, as they are no longer needed.

.. code:: bash

    $ sudo shutdown -r now

Give Device a Static IP Address
-------------------------------

For many applications, such as running a local web server or API, it is important that the Raspberry Pi has a static internal IP address, so that you don't have to update port forwarding rules or connection details every time your router or Raspberry Pi is rebooted. The easiest way to ensure this is to use your router's administration panel to give your Raspberry Pi a reserved IP address.

The process for this is different for every router, but it should follow something along the lines of logging into your router's admin page, navigating to a network settings panel, and reserving the IP address that your Raspberry Pi is currently using. This ensures that the Raspberry Pi will always be given the same IP address. After reserving your IP address, you may need to reboot your router.

Additionally, you can update the setting in your Raspberry Pi to make sure it always starts with the same IP address. If you do this instead of the DHCP reservation, be sure to pick an IP address outside the DHCP range, so that DHCP doesn't also assign the IP address selected to another device on the network, creating a conflict.

Log into your Raspberry Pi - if you've enabled SSH, you can do this by IP address as follows:

.. code:: bash

    # Update the IP address to be the IP address of your Raspberry Pi
    # If you don't know the IP address of your Pi, you can use a 
    #     "sudo arp-scan --localnet" to find all IP addresses on your
    #     local network and try logging into each of them
    $ ssh pi@192.168.0.11
    # <Enter password>

Once you've logged in, edit the */etc/dhcpcd.conf* file to set the IP address you want your Raspberry Pi to have. These lines should be appended to the bottom of the file.

.. code:: bash

    # Set IP address to 192.168.0.11
    interface eth0
    static ip_address=192.168.0.11/32
    static routers=192.168.0.1

Note that your values for IP address and routers may be different. If you want the IP address to be in a range, modify the CIDR code associated with the IP address. /32 denotes that there are no bits in the bitmask, so the IP range only contains the one address specified.

After you've done this, reboot your Raspberry Pi, and ensure that it has the same address once it restarts that you specified.

.. code:: bash

    $ sudo shutdown -r now
    

Establish RSA Public Key Authentication
---------------------------------------

On your local machine, generate an RSA Key.

.. code:: bash

    $ cd ~/.ssh
    $ ssh-keygen -t rsa -b 4096

Assuming you named it *id_rsa* and the public key is *id_rsa.pub*, you need to copy id_rsa.pub over to the Raspberry Pi and append it to the authorized_keys file.

.. code:: bash

    $ cd ~/.ssh
    $ scp id_rsa.pub pi@192.168.0.11:/home/pi/.ssh/id_rsa.pub

    $ ssh pi@192.168.0.11
    $ cd .ssh
    $ cat id_rsa.pub >> authorized_keys

After this, you'll need to update the ssh settings on your Raspberry Pi.

.. code:: bash

    $ vi /etc/ssh/sshd_config

Here, you'll need to change these two lines

.. code:: bash

    # Uncomment the line setting the authorized keys file:
    AuthorizedKeysFile      %h/.ssh/authorized_keys

    # Disallow password login over ssh:
    PasswordAuthentication no

Finally, restart the Pi to make these changes take effect.

.. code:: bash

    $ sudo shutdown -r now

On your local development machine, create a .ssh/config file if none exists, and append the host information for your Raspberry Pi.

.. code:: bash

    $ vi ~/.ssh/config
    
    Host    rpi
        HostName        192.168.0.11
        User            pi
        Port            22
        IdentityFile    ~/.ssh/id_rsa

Now you should be able to log into the Raspberry Pi as follows:

.. code:: bash

    $ ssh rpi

Depending on the default settings, you may need to edit the permissions of your key files before you will be allowed to use them for SSH authentication. In particular, you'll need to remove any permissions held by "group" or "other".

Changing the Raspberry Pi Password
----------------------------------

This is a good policy - change the password from the default. Log into the Pi and run the "passwd" command to update the password. Follow the prompts.

.. code:: bash

    $ ssh rpi
    $ passwd


