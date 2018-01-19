theme: Work, 5
footer: **@paulfioravanti**
slidenumbers: true
slidecount: true

# [fit] Get P![inline](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)id in
![fit inline](https://www.dropbox.com/s/oqr9163tt621p5w/bitcoin-logo.png?dl=1)

^
Hi everyone, so I'm here today to talk about how to *literally* get paid in Bitcoin using Elixir.<br />
Now, in case you're not familiar with Bitcoin, I'll just give you a quick primer.

--- 
[.hide-footer]
[.slidenumbers: false]

![fit](https://www.dropbox.com/s/v95k1kgdcukr6u2/magical-internet-money.png?dl=1)

^
Bitcoin is magical internet money, which you should buy lots of...

---
[.hide-footer]
[.slidenumbers: false]

![fit](https://www.dropbox.com/s/uta0gl3yqtgw7ej/hodl.jpg?dl=1)

^
...and then keep holding on to it, because its value will always go up.

---
[.hide-footer]
[.slidenumbers: false]

![fit](https://www.dropbox.com/s/wlsiee5mwq8bxq8/bitcoin-lambo.jpg?dl=1)

^
And the only time you should ever spend Bitcoin is when you have enough to buy a Lamborghini.

---
[.hide-footer]
[.slidenumbers: false]

![](https://www.dropbox.com/s/v95k1kgdcukr6u2/magical-internet-money.png?dl=1)
![](https://www.dropbox.com/s/uta0gl3yqtgw7ej/hodl.jpg?dl=1)
![](https://www.dropbox.com/s/wlsiee5mwq8bxq8/bitcoin-lambo.jpg?dl=1)

^
I think that pretty much covers the fundamentals, so the question now is how can
you get some Bitcoin for your own lambo?

---
[.hide-footer]
[.slidenumbers: false]

![fit](https://www.dropbox.com/s/d1ama4a83avuq63/my-bitcoin-address.png?dl=1)

^
Well, you need a Bitcoin address, which looks something like this.<br />
Don't worry about the QR code (unless you want to point your phone wallet software camera at it to send me some Lambocoin), but notice the string of characters below it.<br />
That is a Bitcoin address, which represents a possible destination for a Bitcoin payment.<br />
It is a type of public key, so that's why I can freely share mine with you, and I can use my secret private key to prove or verify that I have the authority to spend any funds that are sent to this Bitcoin address.  

---

![fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

^
In Elixir, there are a few hex packages that can help you deal with generating
public and private keypairs...

---
[.hide-footer]

![left fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

# [fit] ExCrypto
# [fit] **__`https://github.com/ntrepid8/ex_crypto`__**

^
like ExCrypto which wraps around Erlang's :crypto module, or...

---
[.hide-footer]

![left fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

# [fit] ExCrypto
# [fit] **__`https://github.com/ntrepid8/ex_crypto`__**
<br />
# [fit] RSA Ex
# [fit] **__`https://github.com/anoskov/rsa-ex`__**

^
...rsa-ex, which focuses on key generation with RSA algorithms and delegates out to your system's OpenSSL libraries to generate keys<br />
So, these are the kinds of keys you would use to, say...

---

![fit](https://www.dropbox.com/s/li2g2xxuso4fs3v/verified-commit.png?dl=1)

^
...add to your Github account so you can verify your commits.

---

# [fit] ![inline](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)ut

^
But, these libraries do not know anything about Bitcoin, so they will not be
able to help us in this case.

---

# [fit] **Generate**
# [fit] Bitcoin
# [fit] Address

^
In order to generate a Bitcoin Address...

---
[.slidenumbers: false]

![right](https://www.dropbox.com/s/d1ama4a83avuq63/my-bitcoin-address.png?dl=1)
# [fit] **Generate**
# [fit] Bitcoin
# [fit] Address

^
...there are a couple of steps that we will need help with:

---

# [fit] **__We need:__**
# [fit] A private key

^
We will need a private key...

---

# [fit] **__We need:__**
# [fit] Bitcoin public key
# [fit] **_\(from private key\)_**

^
...we will need to generate a Bitcoin public key from that private key...

---

# [fit] **__We need:__**
# [fit] Bitcoin address
# [fit] **_\(from Bitcoin public key\)_**

^
...and we will need to generate a Bitcoin address from that Bitcoin public key.

---

# [fit] **Checklist**

# *- Private Key*
# *- Bitcoin Public Key*
# *- Bitcoin Address*

^
So, we need these three elements.

---

# [fit] Private Key

**__```
iex(1)> :crypto.strong_rand_bytes(32) \
...(1)> |> Base.encode16()
"A535467CE39477478845793EDDE8F27587686431DA7D36A0A3A9170F838CF18A"
```__**

^
For the private key, what we need is an unsigned 256 bit (or 32 byte) integer, which is typically encoded in hex.<br />
For this, Erlang's Crypto library has our back.

---

# [fit] **Checklist**

# *- Private Key* :white_check_mark:
# *- Bitcoin Public Key*
# *- Bitcoin Address*

^
Hey, wow, that was pretty straightforward. Hope that doesn't lull us into a false sense of security about how easy or difficult this will be...<br />
Let's move on to the next item, a Bitcoin Public Key.

---

# [fit] **Bitcoin**
# [fit] Public Key

^
What is a Bitcoin public key and what makes it different from other public keys that you may be used to using?<br />
Well, public keys used in Bitcoin are created not using an algorithm like RSA, but using a specific kind of algorithm called an...

---

![right](https://www.dropbox.com/s/56klq0w3a064egb/elliptic-curve.png?dl=1)

# [fit] Elliptic
# [fit] Curve
# [fit] Digital
# [fit] Signature
# [fit] Algorithm

^
Elliptic Curve Digital Signature Algorithm or...

---

![right](https://www.dropbox.com/s/56klq0w3a064egb/elliptic-curve.png?dl=1)

# [fit] **E**lliptic
# [fit] **C**urve
# [fit] **D**igital
# [fit] **S**ignature
# [fit] **A**lgorithm

^
ECDSA, and using a specific type of Elliptic Curve algorithm called...

---
[.slidenumbers: false]

![right fit](https://www.dropbox.com/s/rrz6id0yedv044n/elliptic-curve-points.png?dl=1)

# [fit] **ECDSA**
# [fit] secp256k1

^
secp256k1, I believe because it's easy to remember.
I will leave looking into the details of Elliptic Curves as an exercise for the listener cause its maths hurts my brain, suffice to say that a Bitcoin public key ends up being an {x,y} coordinate on the Elliptic Curve. This graph here depicts curve points possible if mapped over the prime number of 17. Imagine, if you can, what it would look like mapped over massive prime numbers.  
