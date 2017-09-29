
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
