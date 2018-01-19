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

![fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

# [fit] ExCrypto
# [fit] **__`https://github.com/ntrepid8/ex_crypto`__**

^
like ExCrypto which wraps around Erlang's :crypto module, or...

---
[.hide-footer]

![fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

# [fit] ExCrypto
# [fit] **__`https://github.com/ntrepid8/ex_crypto`__**
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
I will leave looking into the details of Elliptic Curves as an exercise for the listener cause its maths hurts my brain, suffice to say that a Bitcoin public key ends up being...

---
[.slidenumbers: false]

![right fit](https://www.dropbox.com/s/rrz6id0yedv044n/elliptic-curve-points.png?dl=1)

# [fit] **ECDSA**
# [fit] secp256k1
# [fit] **`{x,y}`**
# [fit] coordinate on the
# [fit] **Elliptic Curve**

^
...an {x,y} coordinate on the Elliptic Curve.<br />
This graph here depicts curve points possible if mapped over the prime number of 17. Imagine, if you can, what it would look like mapped over massive prime numbers.  

---

# [fit] **_Anyway..._**

^
Anyway...

---

![left fit](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)
![right fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

^
What we want is an Elixir library or libraries to get that job done, and surely there are Elixir libraries specifically for Bitcoin that can do this, right?<br />
Well, there are some, most being works in progress, but the most robust one that I have found so far is...

---

![left fit](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)
![right fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

# [fit] **bitcoin-elixir**
### **https://github.com/comboy/bitcoin-elixir**

^
Bitcoin-Elixir

---

**__```
defmodule Bitcoin.Key.Public do
  def to_address(pk) do
    pk
    |> Crypto.sha256()
    |> Crypto.ripemd160()
    |> Binary.prepend(@address_prefix[:public])
    |> Base58Check.encode()
  end
end
```__**

^
Now Bitcoin-Elixir does have a function that can turn a Bitcoin public key into a Bitcoin address that looks like this, which is great!<br />
It hashes the public key a couple of times, adds a prefix and then encodes it in Base58, which is like Base64 but uses a few less characters due to their ambiguity when reading them, like capital O and zero.

---

# [fit] ![inline](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)ut

^
But!

---

# [fit] **Checklist**

# *- Private Key* :white_check_mark:
# *- Bitcoin Public Key* :x:
# *- Bitcoin Address* :question:

^
Bitcoin-Elixir does not have a function for our middle step to convert a private key to a Bitcoin public key!<br />

---

# [fit] **NOW**
# [fit] WHAT?

^
So now what? Are we stuck? Nope, but we will have to look outside the Elixir Ecosystem for help.

---

![left 50%](https://www.dropbox.com/s/8q03qum3zzursmm/python-logo-no-text.png?dl=1)
![right 50%](https://www.dropbox.com/s/9sg30zgqr7dbuz8/cpp_logo.png?dl=1)

^
The most fully-featured Bitcoin libraries are written in Python and C++, or at
least I'm assuming they are...

---
[.hide-footer]

![fit](https://www.dropbox.com/s/1ra32v79pa943jy/andreas-antonopoulos.jpg?dl=1)

^
...since Andreas Antonopoulos, the author of the book...

---

![fit](https://www.dropbox.com/s/ykcfun5zlcu7aw1/masteringbitcoin_cover.jpg?dl=1)

^
...Mastering Bitcoin, used those languages in all its code examples, which I then attempted to port to Elixir.<br />
I got some of the way through porting the code, and for functionality where I did not have Elixir equivalents, I would ask libraries in Python and C++ to do the work for me by calling out to them via Elixir ports.

---

![left 50%](https://www.dropbox.com/s/8q03qum3zzursmm/python-logo-no-text.png?dl=1)
![right 50%](https://www.dropbox.com/s/9sg30zgqr7dbuz8/cpp_logo.png?dl=1)

^
So, we're going to have a look at solving the Bitcoin address generation problem in two different ways...

---

![fit](https://www.dropbox.com/s/c61ctinlmkjyjmd/in-it-for-the-technology.jpg?dl=1)

^
cause we are in it for the technology and the learning, as well as the lambos.

---

# [fit] **New project!**
# `$ mix new bitcoin_address`
# `$ cd bitcoin_address`
# `$ mix deps.get`

^
Let's kick it off with a new mix project we'll call `bitcoin_address`, and take a first look at Python offerings.

---

![fit](https://www.dropbox.com/s/8q03qum3zzursmm/python-logo-no-text.png?dl=1)

# [fit] Pybitcointools
# [fit] **https://github.com/vbuterin/pybitcointools**
<br />

# [fit] `$ pip install bitcoin`

^
Now, Python has a library of Bitcoin tools called pybitcointools
so the first thing you will need to do is install python via your method of choice if you don't have it
already, and then use Python's package manager pip to install pybitcointools.

---

# [fit] **Python Code**
# [fit] `priv/bitcoin_address.py`

^
In an Elixir project, the `priv` directory is reserved for artifacts that you
need alongside your Elixir code, so that's where we'll put the python code, which
we'll call `bitcoin_address.py`. First, we need a function that will create
a Bitcoin public key from a private key, so we'll write it like this:

---

# [fit] **Python Code**

```python
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key = bitcoin.decode_privkey(private_key, "hex")
  public_key = bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
So, here in our `create_bitcoin_public_key` function, we do the following:

---

# [fit] **Python Code**

```python, [.highlight: 4]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key = bitcoin.decode_privkey(private_key, "hex")
  public_key = bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
Use the `bitcoin` library to decode the private key from a hex string into an integer

---

# [fit] **Python Code**

```python, [.highlight: 5]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key = bitcoin.decode_privkey(private_key, "hex")
  public_key = bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
We then use the `bitcoin` library's `fast_multiply` function, which calculates a public key point on the Elliptic Curve with the help of a pre-determined generator point constant known as G...

---

# [fit] **Python Code**

```python, [.highlight: 6]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key = bitcoin.decode_privkey(private_key, "hex")
  public_key = bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
...which is de-structured on the next line here as a tuple containing and x and y coordinate, both x and y here are huge integers

---

# [fit] **Python Code**

```python, [.highlight: 7]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key = bitcoin.decode_privkey(private_key, "hex")
  public_key = bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
We then determine how the public key should be prefixed depending on whether the public key y value is even or odd, which is a specific Bitcoin

---

# [fit] **Python Code**

```python, [.highlight: 8]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key = bitcoin.decode_privkey(private_key, "hex")
  public_key = bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
...and then concatenate the prefix with the hex value of the public key x coordinate to get our return value.

---

# [fit] **Python Code**

```python
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key = bitcoin.decode_privkey(private_key, "hex")
  public_key = bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
And that gives us our Bitcoin public key, with us using 3 functions and 1 constant from the bitcoin library.
So, how do we talk to this file from Elixir?

---
