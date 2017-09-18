
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

    Mallory is a spiteful and bitter woman. Her singular goal in life is to trip up others. Once, she put a rock on Bob's front doorstep to trip over.

    Bob, Alice, Eve, and Mallory, are all next door neighbors. One day, Bob decides to hang out with Alice, so he gives her a phone call. When she picks up, he asks her if she wants to go for a walk with him. Beaming, Alice agrees, and quickly runs to his front doorstep, where she finds none other than the libelous Eve. Mallory spies at all of them from behind a bush.

    "My goodness!" Alice exclaims. "What on earth are you doing here, Eve?"

    "I simply want to watch you and Bob go for a walk," replies Eve, breathing heavily.

    When Bob opens the door to find not one, but two people on his front doorstep, he faints from pure shock. He remains in a state of catatonic sleep for several hours, though Alice manages to nurse him back to health. Needless to say, their pleasant afternoon stroll does not happen.

    "Golly Alice, I'd sure like to hang out with you, but I can't bear the thought of being surprised like that again!" Bob tells her.

    "Not to fret Bob, I have a plan. We'll use Gnu Privacy Guard, or GPG, to make plans that even Eve won't be able to listen in on! Then, it will be just us, since she'll have no idea when to go to your front porch."

    Alice walks Bob through basic encryption concepts. "Symmetric encryption is where you take a message, and you use a key to encode that data. Using GPG, the data cannot easily be decrypted without the key. As long as the key is something we know that Eve doesn't, we should be able to communicate without her snooping on us!" Alice then glares at Eve through the window, where Eve is unabashedly peering in. "The passphrase we'll use is the thing you tripped over at your doorstep, when I took you to the hospital!" Alice tells Bob. After a few minutes scratching his head, Bob realizes the word Alice is describing is "rock", and gives her a great beaming smile. Eve, hearing the question and not able to figure out the answer, is unable to figure out what they're talking about.

    Wandering away dejectedly, Eve bumps into a rather surly looking Mallory. Giving into her only instinct, Eve tells her exactly what happened, including the question, in excrutiating detail. "Rock!" Mallory cries out happily. "Bob tripped over a rock. I put it there."

    Smiling, the disastrous duo wander over to Eve's house to listen in on the next message. Alice, by now, has made it home, and decides to give Bob a call. On her computer, she uses GPG and the passphrase "rock" to encrypt the message "Meet me on your doorstep in 5 minutes!"

    Bob's phone rings, and he smiles as Alice begins saying a series of seemingly random letters. He types them into his computer, and uses GPG to decrypt them using the passphrase. "Ooh!" he chirps happily. "She'll be here in five minutes! I'd better put my shoes on!"

    Little do they know, Eve and Mallory have also decrypted the message, and with a few moments to spare, they burst from Eve's home and dash to Bob's front door. When Alice arrives, she is understandably shocked. But not nearly as shocked as Bob, who passes out with such force he needs to be hospitalized for three days to recover.

    "I never would have expected them to work together to overcome our symmetric key encryption!" Alice exclaims loudly, just as Bob wakes up. It appears she's been pacing back and forth in his hospital room for three days. "Looks like we'll have to take more drastic measures, and use public key encryption."

    "But Alice, I'm not sure I can take another shock. Just look at me! I've missed out on 3 whole days! I could have spent that time nervously shuffling around in my living room while Eve shamelessly watches me through the front window."

    "Not to worry Bob, this plan is foolproof." Alice explains public key encryption to Bob, in which public keys can be shared even with adversaries, because only private keys can be used to decrypt data. So, Bob and Alice will each have their own private keys, which they do not have to share with each other, and they'll use their private keys to decrypt messages sent from one to the other. With public key encryption, Alice and Bob are not able to decrypt messages they themselves encrypted for the other, so it should be safe from Mallory and Eve, who are crouched by the foot of the hospital bed.

    Mallory and Eve go home to brainstorm.

    "How can we foil their plans now, Eve?" Mallory asks brutishly. "They've surely beaten us! I never thought those simpletons would beat us so handsomely. Perhaps it's finally time to move on with our lives."

    "Not yet Mallory, I have an idea!" Eve screams at a feverish pitch, while brandishing some telephone cable. "Give me your best 'Bob' impression!"

    "Well golly gee howdy, all y'all better heckin git off my lown before I lose my marbles." Mallory says in a husky voice.

    "That'll do Mallory," says Eve. "Let's get this party started! You'll talk to Alice, and I'll talk to Bob. If we convince each of them that we're the other one, we'll be able to fool them into using our public keys instead of eachothers'."

    Eve and Mallory have just invented the first ever man in the middle attack. Nobody did it before them, certainly not the litany of spy agencies and various nefarious actors since the dawn of the internet.

How do we want to use it?
-------------------------

    In this instance, I wanted to use GPG to make an IoT cluster living in a network I have no control over be self-healing. My devices are similar to Bob and Alice in the story. They need to be able to communicate securely, even though there are untrusted actors 
