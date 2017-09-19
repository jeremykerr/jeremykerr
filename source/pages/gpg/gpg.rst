
GnuPG
=====

What is it?
-----------

    GPG, or the Gnu Privacy Guard, is a tool that can be used to encrypt and decrypt data.

How can it be used?
-------------------

    Once, in a neighborhood not so far away, there were four neighbors. Their names were Bob, Alice, Eve, and Mallory. Bob was a simple man, with simple ideas. Good natured yet unlucky, he often found himself the victim of seemingly bad luck. His most recent misfortune was tripping over a rock on his front doorstep as he walked outside in the morning, casually faceplanting the ground. Alice, a good friend of Bob's, was usually around to help him when he needed. She took him to the doctor to treat his injuries. Eve, the town's gossip, constantly sought after the slightest hints of news. Alice and Bob repeatedly had to explain concepts like privacy and personal space to her, though she belligerantly refused to accept their lessons. Mallory, however, was a different story. Piggybacking on Eve's expressiveness, Mallory would seek out opportunities to create catastrophies for poor Bob. She was the one who planted the rock Bob had tripped over recently.

    One soggy afternoon, Bob gave Alice a call. They laughed and chatted the day away, and agreed to meet the next morning for coffee. Unfortunately, Eve tapped the line, and heard every word. True to her nature, she quickly sought out Mallory to tell her the latest update on Bob and Alice.

    Knowing when and where Bob and Alice would meet, Mallory began brainstorming how to go about sabotaging their pleasant morning coffee. Finally, in a moment of inspired debauchery, Mallory decided to break into the coffee shop and replace all the coffee with mud.

    Alice and Bob met at the coffee shop the next morning, After ordering some nice coffee and stepping outside the coffee shop into the brisk, sunny day, they each took a sip and quickly began sputtering mud back out. Appalled at the coffee shop, they stormed back in to demand an explanation. After some investigation, they were able to identify Mallory on the security camera footage, and realized she must have learned they were meeting. Guessing Eve had listened in when they made their original plan, Bob and Alice realized that Eve must have found a way to tap into their conversations.

Temp
----

    "Not to fret Bob, I have a plan. We'll use Gnu Privacy Guard, or GPG, to make plans that even Eve won't be able to listen in on! Then, it will be just us, since she'll have no idea when to go to your front porch."

    Alice walks Bob through basic encryption concepts. "Symmetric encryption is where you take a message, and you use a key to encode that data. Using GPG, the data cannot easily be decrypted without the key. As long as the key is something we know that Eve doesn't, we should be able to communicate without her snooping on us!" Alice then glares at Eve through the window, where Eve is unabashedly peering in. "The passphrase we'll use is the thing you tripped over at your doorstep, when I took you to the hospital!" Alice tells Bob. After a few minutes scratching his head, Bob realizes the word Alice is describing is "rock", and gives her a great beaming smile. Eve, hearing the question and not able to figure out the answer, cannot figure out what they're talking about.

    Wandering away dejectedly, Eve bumps into a rather surly looking Mallory. Giving into her only instinct, Eve tells her exactly what happened, including the question, in excrutiating detail. "Rock!" Mallory cries out happily. "Bob tripped over a rock. I put it there."

    Smiling, the disastrous duo wander over to Eve's house to listen in on the next message. Alice, by now, has made it home, and decides to give Bob a call. On her computer, she uses GPG and the passphrase "rock" to encrypt the message "Meet me on your doorstep in 5 minutes!"

    Bob's phone rings, and he smiles as Alice begins saying a series of seemingly random letters. He types them into his computer, and uses GPG to decrypt them using the passphrase. "Ooh!" he chirps happily. "She'll be here in five minutes! I'd better put my shoes on!"

    Little do they know, Eve and Mallory have also decrypted the message, and with a few moments to spare, they burst from Eve's home and dash to Bob's front door. When Alice arrives, she is understandably shocked. But not nearly as shocked as Bob, who passes out once again.

    "I never would have expected them to work together to overcome our symmetric key encryption!" Alice exclaims loudly, just as Bob wakes up. It appears she's been pacing back and forth as he slept. "Looks like we'll have to take more drastic measures, and use public key encryption."

    "But Alice, I'm not sure I can take another shock. Maybe we should just give up!"

    "Not to worry Bob, this plan is foolproof." Alice explains public key encryption to Bob, in which public keys can be shared even with adversaries, because only private keys can be used to decrypt data. So, Bob and Alice will each have their own private keys, which they do not have to share with each other, and they'll use their private keys to decrypt messages sent from one to the other. With public key encryption, Alice and Bob are not able to decrypt messages they themselves encrypted for the other, so it should be safe from Mallory and Eve, who are crouched by the foot of the hospital bed.

    Mallory and Eve go home to brainstorm.

    "How can we foil their plans now, Eve?" Mallory asks brutishly. "They've surely beaten us! I never thought those simpletons would beat us so handsomely. Perhaps it's finally time to move on with our lives."

    "Not yet Mallory, I have an idea!" Eve screams at a feverish pitch, while brandishing some telephone cable. "Give me your best 'Bob' impression!"

    "Well golly gee howdy, all y'all better heckin git off my lown before I lose my marbles." Mallory says in a husky voice.

    "That'll do Mallory," says Eve. "Let's get this party started! You'll talk to Alice, and I'll talk to Bob. If we convince each of them that we're the other one, we'll be able to fool them into using our public keys instead of eachothers'."

    What Eve and Mallory are about to do is called a man in the middle attack. If they get in between the first connection Bob and Alice make, they can give them the wrong set of keys, enabling them to decrypt the messages sent by Alice, then reencrypt them and send them to Bob, who will send messages back that they are able to decrypt, before encrypting again and sending to Eve. If they want, they can even modify the contents of the messages, and Bob and Alice will have no way of knowing.

How do we want to use it?
-------------------------

    In this instance, I wanted to use GPG to make an IoT cluster living in a network I have no control over be self-healing. My devices are similar to Bob and Alice in the story. They need to be able to communicate securely, even though there are untrusted actors 
