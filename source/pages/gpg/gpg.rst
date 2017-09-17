
GnuPG
=====

What is it?
-----------

    GPG, or the Gnu Privacy Guard, is a tool that can be used to encrypt and decrypt data.

How can it be used?
-------------------

    Bob is a simple man, with simple ideas. Once, he tripped over a rock.

    Alice is Bob's friend. She is helpful, and was able to get Bob to the hospital when he tripped.

    Eve is a bit of a gossip. She always knows what's going on, for better or worse. She suspects Bob and Alice might be more than friends. She thinks they are good friends! Eve is determined to prove it.

    Mallory is a spiteful and bitter woman. Her singular goal in life is to trip up others. Once, she put a rock on Bob's front doorstep.

    Bob, Alice, Eve, and Mallory, are all next door neighbors. One day, Bob decides to hang out with Alice, so he gives her a phone call. When she picks up, he asks her if she wants to go for a walk with him. Beaming, Alice agrees, and quickly runs to his front doorstep, where she finds none other than the libelous Eve. Mallory spies at all of them from behind a bush.

    "My goodness!" Alice exclaims. "What on earth are you doing here, Eve?"

    "I simply wanted to watch you and Bob go for a walk," replies Eve, breathing heavily.

    When Bob opens the door to find not one, but two people on his front doorstep, he faints from pure shock. He remains in a state of catatonic sleep for several hours, though Alice manages to nurse him back to health. Needless to say, their pleasant afternoon stroll does not happen.

    "Golly Alice, I'd sure like to hang out with you, but I can't bear the thought of being surprised like that again!" Bob tells her.

    "Not to fret Bob, I have a plan. We'll use Gnu Privacy Guard, or GPG, to make plans that even Eve won't be able to listen in on! Then, it will be just us, since she'll have no idea when to go to your front porch."

    Alice walks Bob through basic encryption concepts. "Symmetric encryption is where you take a message, and you use a key to encode that data. Using GPG, the data cannot easily be decrypted without the key. As long as the key is something we know that Eve doesn't, we should be able to communicate without her snooping on us!" Alice then glares at Eve through the window, where Eve is unabashedly peering in. "The passphrase we'll use is the thing you tripped over that one time, when I took you to the hospital!" Alice tells Bob. After a few minutes scratching his head, Bob realizes the word Alice is describing is "rock", and gives her a great beaming smile. Eve, hearing the question and not able to figure out the answer, is unable to figure out what they're talking about.

    Wandering away dejectedly, Eve bumps into a rather surly looking Mallory. Giving into her only instinct, Eve tells her exactly what happened, including the question, in excrutiating detail. "Rock!" Mallory cries out happily. "Bob tripped over a rock. I put it there."

    Smiling, the disastrous duo wander over to Eve's house to listen in on the next message. Alice, by now, has made it home, and decides to give Bob a call. On her computer, she uses GPG and the passphrase "rock" to encrypt the message "Meet me on your doorstep in 5 minutes!"

    Bob's phone rings, and he smiles as Alice begins saying a series of seemingly random letters. He types them into his computer, and uses GPG to decrypt them using the passphrase. "Ooh!" he chirps happily. "She'll be here in five minutes! I'd better put my shoes on!"

    Little do they know, Eve and Mallory have also decrypted the message, and with a few moments to spare, they burst from Eve's home and dash to Bob's front door. When Alice arrives, she is understandably shocked.

How do we want to use it?
-------------------------

    In this instance, I wanted to use GPG to make an IoT cluster living in a network I have no control over be self-healing. My devices are similar to Bob and Alice in the story. They need to be able to communicate securely, even though there are untrusted actors 
