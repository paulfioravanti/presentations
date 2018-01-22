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
Well, there are some, most being works in progress like...

---

![left fit](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)
![right fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

# [fit] **bitcoin-elixir**
- https://github.com/comboy/bitcoin-elixir

^
Bitcoin-Elixir...

---

![left fit](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)
![right fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

# [fit] **bitcoin-elixir**
- https://github.com/comboy/bitcoin-elixir

# [fit] **Bitcoin-Ex**
- https://github.com/justinlynn/bitcoin-ex

^
...and Bitcoin-Ex

---

# [fit] ![inline](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)ut

^
But!

---

# [fit] **Checklist**

# *- Private Key* :white_check_mark:
# *- Bitcoin Public Key* :x:
# *- Bitcoin Address* :hand:

^
Neither have a function for our middle step to convert a private key to a Bitcoin public key, so it would seem that we're pretty much stopped in our tracks<br />

---

# [fit] **NOW**
# [fit] WHAT?

^
So now what? Are we stuck? Nope, but we will have to look outside the Elixir Ecosystem for help.

---

# [fit] BUT
# [fit] **WHERE?**

^
But where?

---

![left 50%](https://www.dropbox.com/s/8q03qum3zzursmm/python-logo-no-text.png?dl=1)
![right 50%](https://www.dropbox.com/s/9sg30zgqr7dbuz8/cpp_logo.png?dl=1)

^
The most fully-featured Bitcoin libraries are written in Python and C++, or at least I'm assuming they are...

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

# [fit] **Pybitcointools**
- https://github.com/vbuterin/pybitcointools

# [fit] **`$ pip install bitcoin`**

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

```python, [.highlight: 1, 4]
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

```python, [.highlight: 1, 5]
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

```python, [.highlight: 1, 8]
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

![fit left](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

# [fit] **Export**

- https://github.com/fazibear/export

^
With Export, a hex package that wraps around...

---

![fit right](https://www.dropbox.com/s/lxj6zl1ah0n846k/erlang-logo-transparent.png?dl=1)

# [fit] **Erlport**

- https://github.com/hdima/erlport

^
Erlport, which is an Erlang library that enables you to talk to both...

---

![inline](https://www.dropbox.com/s/lxj6zl1ah0n846k/erlang-logo-transparent.png?dl=1)
![inline](https://www.dropbox.com/s/8q03qum3zzursmm/python-logo-no-text.png?dl=1) ![inline](https://www.dropbox.com/s/h70uzfm6j6qqhd9/ruby-logo.png?dl=1)

^
Python and Ruby code. So that looks exactly what we want.

---

# [fit] **Install**

```elixir
  defp deps do
    [
      # Erlport wrapper for Elixir to interface with Python code
      {:export, "~> 0.1.0"}
    ]
  end
```

^
To use Export, we'll first add it to our mix file and run `mix deps.get`.<br />
And now, let's make a module for the Python integration.

---

```elixir
defmodule BitcoinAddress.Python do
  use Export.Python

  @python_path :bitcoin_address |> :code.priv_dir() |> Path.basename()
  @python_file "bitcoin_address"

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <- create_bitcoin_public_key(pid, private_key) do
      IO.puts("Private key: #{inspect(private_key)}")
      IO.puts("Public key: #{inspect(bitcoin_public_key)}")
      Python.stop(pid)
    end
  end

  defp create_bitcoin_public_key(pid, private_key) do
    pid
    |> Python.call(@python_file, "create_bitcoin_public_key", [private_key])
    |> to_string()
  end
end
```

^
This is quite a lot of code for a single slide, so let's take a closer look
at each chunk.

---

```elixir
defmodule BitcoinAddress.Python do
  use Export.Python

  @python_path :bitcoin_address
               |> :code.priv_dir()
               |> Path.basename()
  @python_file "bitcoin_address"

  # ...
end
```

^
First thing that we need to do is...

---

```elixir, [.highlight: 4-6]
defmodule BitcoinAddress.Python do
  use Export.Python

  @python_path :bitcoin_address
               |> :code.priv_dir()
               |> Path.basename()
  @python_file "bitcoin_address"

  # ...
end
```

^
...tell export which directory to go and look for Python files (just as an aside, using the `:code.priv_dir()` was a TIL for me: it returns the path to your project `priv` directory)...

---

```elixir, [.highlight: 7]
defmodule BitcoinAddress.Python do
  use Export.Python

  @python_path :bitcoin_address
               |> :code.priv_dir()
               |> Path.basename()
  @python_file "bitcoin_address"

  # ...
end
```

^
...and we also need to specify the specifically what the file name is, without the .py extension

---

```elixir
defmodule BitcoinAddress.Python do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key) do
      # ...
      Python.stop(pid)
    end
  end

  # ...
end
```

^
From there, we'll add in a generate() function to kick off the bitcoin address generation, and in it, we'll do the following:

---

```elixir, [.highlight: 5]
defmodule BitcoinAddress.Python do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key) do
      # ...
      Python.stop(pid)
    end
  end

  # ...
end
```

^
We will call Python.start to spawn off a process to the Python directory that we specified, which gives us back its process ID

---

```elixir, [.highlight: 6-7]
defmodule BitcoinAddress.Python do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key) do
      # ...
      Python.stop(pid)
    end
  end

  # ...
end
```

^
...which we then pass to the create_bitcoin_public_key function, along with the
  private_key we want to create a Bitcoin public key for.

---

```elixir, [.highlight: 6-7, 12-17]
defmodule BitcoinAddress.Python do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key) do
      # ...
      Python.stop(pid)
    end
  end

  defp create_bitcoin_public_key(pid, priv_key) do
    pid
    |> Python.call(@python_file, "create_bitcoin_public_key", [priv_key])
    |> to_string()
  end
end
```

^
There, we run Python.call send to the Python file the name of the function we want to call, (in this case the function in Python that we also called "create_bitcoin_public_key"), and a list of parameters<br />
Since the response that we get back from Python will be a binary, we cast it back into a string.

---

```elixir, [.highlight: 8-10]
defmodule BitcoinAddress.Python do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key) do
      IO.puts("Private key: #{inspect(private_key)}")
      IO.puts("Public key: #{inspect(bitcoin_public_key)}")
      Python.stop(pid)
    end
  end

  defp create_bitcoin_public_key(pid, priv_key) do
    # ...
  end
end
```

^
And from there, we just print out the private key and bitcoin public key to standard output, and stop the Python process.

---

# [fit] Bitcoin Public key :white_check_mark:

```elixir
defmodule BitcoinAddress.Python do
  use Export.Python

  @python_path :bitcoin_address |> :code.priv_dir() |> Path.basename()
  @python_file "bitcoin_address"

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <- create_bitcoin_public_key(pid, private_key) do
      IO.puts("Private key: #{inspect(private_key)}")
      IO.puts("Public key: #{inspect(bitcoin_public_key)}")
      Python.stop(pid)
    end
  end

  defp create_bitcoin_public_key(pid, priv_key) do
    pid
    |> Python.call(@python_file, "create_bitcoin_public_key", [priv_key])
    |> to_string()
  end
end
```

^
So, that takes care of bitcoin public key, but what about the bitcoin address?<br />

---

<br />
# [fit] `bitcoin.pubkey_to_address`

^
pybitcointools has a function called `bitcoin.pubkey_to_address`, that we can call directly through Export, without having to write any more Python code...

---

```elixir
defmodule BitcoinAddress.Python do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key),
         bitcoin_address <-
           create_bitcoin_address(pid, bitcoin_public_key) do
      # ...
    end
  end

  defp create_bitcoin_address(pid, pub_key) do
    pid
    |> Python.call(@python_file, "bitcoin.pubkey_to_address", [pub_key])
    |> to_string()
  end
end
```

^
...so let's add in a new Elixir function that will wrap around that.

---

```elixir, [.highlight: 8-9, 14-18]
defmodule BitcoinAddress.Python do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key),
         bitcoin_address <-
           create_bitcoin_address(pid, bitcoin_public_key) do
      # ...
    end
  end

  defp create_bitcoin_address(pid, pub_key) do
    pid
    |> Python.call(@python_file, "bitcoin.pubkey_to_address", [pub_key])
    |> to_string()
  end
end
```

^
As you can see, after we get back the bitcoin public key, we pass it into the `create_bitcoin_address` function and send it off to Python again, but notice how we are not calling a function that we created on the Python side, but calling a function on the Bitcoin library directly. Let's compare the two functions briefly:

---

```elixir
  defp create_bitcoin_public_key(pid, priv_key) do
    pid
    |> Python.call(@python_file, "create_bitcoin_public_key", [priv_key])
    |> to_string()
  end

  defp create_bitcoin_address(pid, pub_key) do
    pid
    |> Python.call(@python_file, "bitcoin.pubkey_to_address", [pub_key])
    |> to_string()
  end
```

^
Here they both are, pretty much the same...

---

```elixir, [.highlight: 3, 9]
  defp create_bitcoin_public_key(pid, priv_key) do
    pid
    |> Python.call(@python_file, "create_bitcoin_public_key", [priv_key])
    |> to_string()
  end

  defp create_bitcoin_address(pid, pub_key) do
    pid
    |> Python.call(@python_file, "bitcoin.pubkey_to_address", [pub_key])
    |> to_string()
  end
```

^
...except that create_bitcoin_public_key is our wrapper function, and bitcoin.pubkey_to_address is the Bitcoin library's, and we have the flexibility in our message sending to Python to call either type of function.<br />

---

```elixir, [.highlight: 7-11, 16]
defmodule BitcoinAddress.Python do
  # ...
  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key),
         bitcoin_address <-
           create_bitcoin_address(pid, bitcoin_public_key) do
      IO.puts("Private key: #{inspect(private_key)}")
      IO.puts("Public key: #{inspect(bitcoin_public_key)}")
      IO.puts("Bitcoin address: #{inspect(bitcoin_address)}")
      Python.stop(pid)
    end
  end

  defp create_bitcoin_address(pid, pub_key) do
    pid
    |> Python.call(@python_file, "bitcoin.pubkey_to_address", [pub_key])
    |> to_string()
  end
end
```

^
So, once we've got the Bitcoin address back, along with the Bitcoin public key, we'll just print it to standard output as well.<br />

---

```elixir
defmodule BitcoinAddress.Python do
  use Export.Python

  @python_path :bitcoin_address |> :code.priv_dir() |> Path.basename()
  @python_file "bitcoin_address"

  def generate(private_key) do
    with {:ok, pid} <- Python.start(python_path: @python_path),
         bitcoin_public_key <- create_bitcoin_public_key(pid, private_key),
         bitcoin_address <- create_bitcoin_address(pid, bitcoin_public_key) do
      IO.puts("Private key: #{inspect(private_key)}")
      IO.puts("Public key: #{inspect(bitcoin_public_key)}")
      IO.puts("Bitcoin address: #{inspect(bitcoin_address)}")
      Python.stop(pid)
    end
  end

  defp create_bitcoin_public_key(pid, priv_key) do
    call_python(pid, "create_bitcoin_public_key", [priv_key])
  end

  defp create_bitcoin_address(pid, pub_key) do
    call_python(pid, "bitcoin.pubkey_to_address", [pub_key])
  end

  defp call_python(pid, function, args) do
    pid
    |> Python.call(@python_file, function, args)
    |> to_string()
  end
end
```

^
Awesome, that should give us what we need, and now with slight refactoring here, the only thing left would be to try it out in an iex terminal:

---

# [fit] **`iex -S mix`**

```elixir
iex(1)> private_key = :crypto.strong_rand_bytes(32) |> Base.encode16()
"1542BC5E590628E5C3A1C355869B1B773B055EDF57A633D58F9C0938BA2CDE0B"
```

^
We first generate a 256 bit (or 32 byte) private key using Erlang's crypto module and encode it into a hex string...

---

# [fit] **`iex -S mix`**

```elixir
iex(1)> private_key = :crypto.strong_rand_bytes(32) |> Base.encode16()
"1542BC5E590628E5C3A1C355869B1B773B055EDF57A633D58F9C0938BA2CDE0B"
iex(2)> BitcoinAddress.Python.generate(private_key)
Private key: "1542BC5E590628E5C3A1C355869B1B773B055EDF57A633D58F9C0938BA2CDE0B"
Public key: "022dc34a77f936876375190971e31f152a68d2ff7687985b33822f36a78b4eab15"
Bitcoin address: "1Amc3fz6ZmiwqEDbEZwm7eVJZH8ApXBAqY"
```

^
...then we pass it over to Python, and as you can see, we have our
Base58 Bitcoin address, ready to receive all the crypto!<br />
So, as far as we know, the address has been generated correctly. We're assuming that the pybitcointools generated it correctly. So, to sanity check...

---

![fit](https://www.dropbox.com/s/9sg30zgqr7dbuz8/cpp_logo.png?dl=1)

^
...let's get C++ to do the same thing and see if we get back the same result.<br />
As you would probably expect, doing this is quite a lot more involved, and we'll need a bit of guidance getting things set up...

---

![fit left](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

# [fit] **Cure**

- https://github.com/luc-tielen/Cure

^
so let's get the Cure hex package to help us out with talking to C from Elixir.

---

<br />
# [fit] `$ brew install libbitcoin`

^
First, though, we'll need to install the necessary C++ Bitcoin libraries we'll be calling, in this case libbitcoin, and we can do this simply with Homebrew.

---

# [fit] **Install**

```elixir
  defp deps do
    [
      # Interface C-code with Erlang/Elixir using Ports
      {:cure, "~> 0.4.0"},
      # Erlport wrapper for Elixir to interface with Python code
      {:export, "~> 0.1.0"}
    ]
  end
```

^
Then, add Cure to the mix file and run mix deps.get.

---

<br />
# [fit] `$ mix cure.bootstrap`

^
Once that's done, we need to get Cure to generate the necessary base files to communicate between C++ and Elixir.<br />

---

# [fit] **Cure Bootstrap**

```
c_src
├── Makefile
├── main.c
└── main.h
```

^
This command will add the following files to a top-level `c_src` directory which is Erlang convention for the location of C source code since compiled C executables will be what goes in the `priv` directory.<br />
So what we have here is:

---

# [fit] **Cure Bootstrap**

```, [.highlight: 2]
c_src
├── Makefile
├── main.c
└── main.h
```

^
`Makefile`: a template to automatically build a C++ executable including Cure's libraries. We'll leave this for now, but get back to it later on.

---

# [fit] **Cure Bootstrap**

```, [.highlight: 3]
c_src
├── Makefile
├── main.c
└── main.h
```

^
`main.c`: Cure's base C file to communicate between C/C++ and Elixir.

---

# [fit] **Cure Bootstrap**

```, [.highlight: 4]
c_src
├── Makefile
├── main.c
└── main.h
```

^
And `main.h`: The header file for `main.c`
