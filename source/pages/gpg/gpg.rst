
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

    In order to perform symmetric encryption, a shared secret is required. A shared secret is something known to all friendly parties involved in the communication, but not known to any eavesdroppers or malicious third parties.

    Depending on your use case, you should have a healthy amount of paranoia surrounding your shared secret. If the data you want to protect is of little consequence, or you're just trying to hide communication from a relative or friend, you can probably share a secret over the phone or some other method. If you're worried about three letter agencies or international corporations, you may want to take greater precaution. In that case exchanging a shared secret in person is probably the only reliable method. Because this isn't always feasible, key based encryption may be more desirable.

Keypair
~~~~~~~

    A keypair is a set containing a public and private key. There's a little more to it than that, for example the key used to sign data may be different from either, so that as you rotate keypairs you can keep the same signing key and allow people to continue verifying messages you may have sent in the past, with different keypairs. The public key can be freely handed out and pushed to keyservers, but the private key should never be shared with anyone. Data can be encrypted with a public key, but it can only be decrypted with a private key, so anyone who wants to can send you a message using your public key, but only you can decrypt these messages (provided your private key hasn't been compromised).

To generate a keypair, you can use the --gen-key command. It is considered a best practice to create a revocation certificate at the same time you create a key, and back up the revocation certificate, so that if you ever lose control of the key or it is compromised by a third party, you can send the revocation certificate to any keyservers which have your public key, to let them know, and let anyone using your key know, that it can no longer be trusted.

.. code:: bash

    gpg --gen-key

