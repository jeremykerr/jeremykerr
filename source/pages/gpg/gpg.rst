
Gnu Privacy Guard (GPG)
=======================

    These are some notes on how to effectively use GPG to protect data (communication, files, whatever you want) using GPG.

Concepts
--------

- Symmetric Encryption: Encrypting data with a passphrase, rather than a key. Anyone with the passphrase can decrypt the data.
- Shared Secret: Information known only to the parties who want to exchange information. This can take the form of a passphrase, in symmetric encryption.
- Keypair: A set of keys that can be used for encrypting and decrypting data. A keypair consists of a public and private key.
- Public key: The part of a keypair that can be freely shared, even with adversaries.
- Private key: The part of a keypair that must be kept secret, even from trusted parties.
- Key expiration: A time frame after which keys become untrusted, even to friends, unless action is taken to update the expiration time.
- Key encryption: Encrypting data using a public key. Data encrypted with a public key can only be decrypted by the individual in control of the private key (or anyone who has a copy of the private key, if it is compromised).
- Signing: Creating a hash of data with your private key, that can be verified with your public key, in order to prove that you are the one generating the message that you plan on encrypting using someone else's public key.
- Verifying: Ensuring that a message is signed by the person claiming to have sent it, by validating the signature against their public key.

How To
------

Symmetric Encryption
~~~~~~~~~~~~~~~~~~~~

    Symmetric encryption is encrypting data with a passphrase, rather than with a keypair. Anyone with the passphrase can decrypt the data. To encrypt without doing anything special, you can simply use the -c flag to specify symmetric encryption.

.. code:: bash

    gpg -c

If you want to save the encrypted message to a file, you can specify the output file using the -o flag.

.. code:: bash

    gpg -c -o /secret/message/file

If you want the output to be in ASCII rather than binary, you can use the -a flag. This is great for if you want to print the message and mail it, or if you just want to be able to copy and paste it more easily.

.. code:: bash

    gpg -c -a

Let's say that you want to encrypt an input file, maybe something you wouldn't want to enter manually, such as a PDF or a large file. In that case, you'd want to specify the input file as the last parameter.

.. code:: bash

    gpg -c /input/file

In every case, you will be prompted to enter a passphrase to protect your data with.

To decrypt a file, use the -d flag. Optionally, you can use the -i flag in order to interactively enter the GPG data to decrypt (like if it was saved as ASCII and you don't want a copy stored on the local filesystem). Otherwise, you can specify the input file as the last parameter, the same as when you're encrypting files.

.. code:: bash

    gpg -d -i
    gpg -d /encrypted/input/file

Shared Secret
~~~~~~~~~~~~~

