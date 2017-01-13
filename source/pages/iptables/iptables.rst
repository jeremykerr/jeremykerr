
IP Tables
=========

	This is a decent firewall configuration for a home PC running Linux. It allows internal traffic (127.0.0.1) while blocking traffic from the local network, allows you to create outbound connections, but doesn't allow incoming traffic to establish traffic that you didn't initiate. In order to apply this firewall, follow the steps in order from beginning to end.

- `View rules`_
- `Create rules file`_
- `Load rules from file`_
- `Save rules to file`_
- `Automatically load rules on startup`_

View rules
----------

.. code:: bash

	$ sudo iptables --list
	$ sudo iptables  -S
	$ sudo iptables -L

Create rules file
-----------------

.. code:: bash

	$ sudo vi /etc/iptables.pc.rules

/etc/iptables.pc.rules:

..code:: bash

	*filter

	# Allow all loopback (lo0) traffic and drop all traffic to 127/8 that doesn't use lo0
	-A INPUT -i lo -j ACCEPT
	-A INPUT ! -i lo -d 127.0.0.0/8 -j REJECT

	# Accept all established inbound connections
	-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

	# Allow all outbound traffic
	-A OUTPUT -j ACCEPT

	# Allow icmp (ping, router error messages, similar traffic)
	-A INPUT -p icmp -j ACCEPT

	# Reject all other inbound - default deny unless allowed
	-A INPUT -j REJECT
	-A FORWARD -j REJECT

	COMMIT

Load rules from file
--------------------

.. code:: bash

	$ sudo iptables-restore < /etc/iptables.pc.rules

Save rules to file
------------------

.. code:: bash

	$ sudo iptables-save > ~/iptables.up.rules
	$ sudo mv ~/iptables.up.rules /etc/

Automatically load rules on startup
-----------------------------------

.. code:: bash

	$ sudo vi /etc/network/if-pre-up.d/iptables

/etc/network/if-pre-up.d/iptables:

.. code:: sh

	#!/bin/sh

	/sbin/iptables-restore < /etc/iptables.up.rules


