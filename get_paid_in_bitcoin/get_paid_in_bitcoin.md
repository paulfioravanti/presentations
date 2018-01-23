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
But, these libraries do not know anything about Bitcoin, so they will not be able to help us in this case.

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
...and we will then need to generate a Bitcoin public key from that private key...

---

# [fit] **__We need:__**
# [fit] Bitcoin address
# [fit] **_\(from Bitcoin public key\)_**

^
...and then we will need to generate a Bitcoin address from that Bitcoin public key.

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
ECDSA, and Bitcoin uses a specific type of Elliptic Curve algorithm called...

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

<br />
<br />
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
So now what?

---
[.hide-footer]
[.slidenumbers: false]

![](https://www.dropbox.com/s/16n1vvscjxlczhg/thats-all-folks.png?dl=1)

^
Are we stuck now? Is that it?

---

<br />
# [fit] **NOPE!**

^
Nope...

---

# [fit] ![inline](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)ut

^
But, we will have to look outside the Elixir Ecosystem for help.

---

# [fit] ![inline](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)ut
# [fit] **WHERE?**

^
But where?

---

![left 50%](https://www.dropbox.com/s/8q03qum3zzursmm/python-logo-no-text.png?dl=1)
![right 50%](https://www.dropbox.com/s/9sg30zgqr7dbuz8/cpp_logo.png?dl=1)

^
Well, the most fully-featured Bitcoin libraries are written in Python and C++, or at least I'm assuming they are...

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
...cause we are in it for the technology and the learning, as well as the lambos.

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
Now, Python has a library of Bitcoin tools called pybitcointools.<br />
So, the first thing you will need to do if you haven't already is install python via your method of choice, and then use Python's package manager pip to install pybitcointools.

---

# [fit] **Python Code**
# [fit] `priv/bitcoin_address.py`

^
In an Elixir project, the `priv` directory is reserved for artifacts that you need alongside your Elixir code, so that's where we'll put the python code, which we'll call `bitcoin_address.py`.<br />
First, we need a function that will create a Bitcoin public key from a private key, so we'll write it like this:

---

# **bitcoin_address.py**

```python
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key =
    bitcoin.decode_privkey(private_key, "hex")
  public_key =
    bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
So, here in our `create_bitcoin_public_key` function, we do the following:

---

# **bitcoin_address.py**

```python, [.highlight: 1, 4-5]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key =
    bitcoin.decode_privkey(private_key, "hex")
  public_key =
    bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
Use the `bitcoin` library to decode a private key from a hex string into an integer.

---

# **bitcoin_address.py**

```python, [.highlight: 1, 6-7]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key =
    bitcoin.decode_privkey(private_key, "hex")
  public_key =
    bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
We then use the `bitcoin` library's `fast_multiply` function, which calculates a public key point on the Elliptic Curve with the help of a pre-determined generator point constant known as G...

---

# **bitcoin_address.py**

```python, [.highlight: 8]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key =
    bitcoin.decode_privkey(private_key, "hex")
  public_key =
    bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
...which is de-structured on the next line here as a tuple containing and x and y coordinate, both x and y here are huge integers

---

# **bitcoin_address.py**

```python, [.highlight: 9]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key =
    bitcoin.decode_privkey(private_key, "hex")
  public_key =
    bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
We then determine how the public key should be prefixed depending on whether the public key y value is even or odd, which is something specific to Bitcoin...

---

# **bitcoin_address.py**

```python, [.highlight: 1, 10]
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key =
    bitcoin.decode_privkey(private_key, "hex")
  public_key =
    bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
  (public_key_x, public_key_y) = public_key
  compressed_prefix = "02" if (public_key_y % 2) == 0 else "03"
  return compressed_prefix + bitcoin.encode(public_key_x, 16, 64)
```

^
...and then concatenate the prefix with the hex value of the public key x coordinate to get our return value.

---

# **bitcoin_address.py**

```python
import bitcoin

def create_bitcoin_public_key(private_key):
  decoded_private_key =
    bitcoin.decode_privkey(private_key, "hex")
  public_key =
    bitcoin.fast_multiply(bitcoin.G, decoded_private_key)
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
Python and Ruby code. So that looks like exactly what we want.

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
This is quite a lot of code for a single slide, so let's take a closer look at each chunk.

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
...tell export which directory to go and look for Python files (just as an aside, using the `:code.priv_dir()` was a TIL for me: it returns the path to your project's `priv` directory)...

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
...and we also need to specify the file name of the python file we're going to talk to, without the .py extension

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
From there, we'll add in a generate() function to do all the work, and in it, we'll do the following:

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
We will call Python.start to spawn off a process to the Python directory that we specified, which gives us back its process ID...

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
...which we then pass to a `create_bitcoin_public_key` function, along with the `private_key` we want to create a Bitcoin public key for.

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
There, we run Python.call to send the Python file the name of the function we want to call, (so, in this case it's the function in Python that we also called `create_bitcoin_public_key`), and a list of parameters<br />
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
<br />
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
As you can see, after we get the bitcoin public key back from Python, we pass it into the `create_bitcoin_address` function and send it off to Python again, but notice how we are not calling a function that we created on the Python side, but calling a function directly on the Bitcoin library. Let's compare the two functions briefly:

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
...except that `create_bitcoin_public_key` is our Python wrapper function, and `bitcoin.pubkey_to_address` belongs to the Python Bitcoin library.<br />
So, we have the flexibility in our message sending to Python to call either type of function.

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

---
[.hide-footer]

![fit](https://www.dropbox.com/s/71257p9phk3kx3g/explaining-bitcoin.jpg?dl=1)

^
Hopefully that makes sense. This is all quite new to me, too, but get ready to go deeper cause...

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
So, as far as we know, the address has been generated correctly. We're trusting that the pybitcointools library did it properly. So, to sanity check...

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
...so let's get the Cure hex package to help us out with talking to C from Elixir.

---

<br />
<br />
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
<br />
<br />
# [fit] `$ mix cure.bootstrap`

^
Once that's done, we need to get Cure to generate the necessary base files to communicate between C++ and Elixir.<br />
This command will add the following files...

---

# [fit] **Cure Bootstrap**

```
c_src
├── Makefile
├── main.c
└── main.h
```

^
...to a top-level `c_src` directory which is Erlang convention for the location of C source code since compiled C executables will be what goes in the `priv` directory.<br />
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
And `main.h`: The header file for `main.c`<br />
The first thing we'll do take a look inside the...

---

# **`main.c`**

```cpp
#include "main.h"
int main(void) {
  int bytes_read;
  byte buffer[MAX_BUFFER_SIZE];

  while((bytes_read = read_msg(buffer)) > 0) {
    // TODO put C-code here, right now it only echos data back
    // to Elixir.
    send_msg(buffer, bytes_read);
  }
  return 0;
}
```

^
...main.c file to see how Cure is expecting us to communicate with C.<br />
So, when Elixir spawns a Cure process, it will call this main function which will kick off the...

---

# **`main.c`**

```cpp, [.highlight: 6-10]
#include "main.h"
int main(void) {
  int bytes_read;
  byte buffer[MAX_BUFFER_SIZE];

  while((bytes_read = read_msg(buffer)) > 0) {
    // TODO put C-code here, right now it only echos data back
    // to Elixir.
    send_msg(buffer, bytes_read);
  }
  return 0;
}
```

^
...while loop, where messages will be explicitly read in from Elixir via the `read_msg` function, and we send messages back to Elixir via the `send_msg` function.<br />
And when we eventually terminate the Cure process from Elixir...

---

# **`main.c`**

```cpp, [.highlight: 11]
#include "main.h"
int main(void) {
  int bytes_read;
  byte buffer[MAX_BUFFER_SIZE];

  while((bytes_read = read_msg(buffer)) > 0) {
    // TODO put C-code here, right now it only echos data back
    // to Elixir.
    send_msg(buffer, bytes_read);
  }
  return 0;
}
```

^
...we break out of the while loop, and the C code finishes running.

---

# **`main.c`**

```cpp
#include "main.h"
int main(void) {
  int bytes_read;
  byte buffer[MAX_BUFFER_SIZE];

  while((bytes_read = read_msg(buffer)) > 0) {
    // TODO put C-code here, right now it only echos data back
    // to Elixir.
    send_msg(buffer, bytes_read);
  }
  return 0;
}
```

^
Okay, I think we got it.

---

# [fit] **Rename Files**

**```
$ mv c_src/main.h c_src/bitcoin_address.h
$ mv c_src/main.c c_src/bitcoin_address.cpp
```**

^
Before we start writing code, since we are dealing with C++ Bitcoin libraries, we will need to rename the files appropriately, which is something we can easily do since C++ files can also run C code.

---

# **`bitcoin_address.h`**

```cpp
#ifndef BITCOIN_ADDRESS_H
#define BITCOIN_ADDRESS_H
#include <elixir_comm.h>

std::string create_bitcoin_public_key(std::string priv_key);

#endif
```

^
Next, we'll get to implementing a `create_bitcoin_public_key` function, same name as the Python file for consistency, which will look something like this. First define the function in the header file...

---

# **`bitcoin_address.cpp`**

```cpp
#include <string>
#include "bitcoin_address.h"

int main(void) { ... }

std::string create_bitcoin_public_key(std::string priv_key) {
  bc::ec_secret decoded;
  bc::decode_base16(decoded, priv_key);
  bc::wallet::ec_private
    secret(decoded, bc::wallet::ec_private::mainnet_p2kh);
  bc::wallet::ec_public public_key(secret);
  return public_key.encoded();
}
```

^
...and then the implementation.  Similar to the Python code, this function...

---

# **`bitcoin_address.cpp`**

```cpp, [.highlight: 1]
std::string create_bitcoin_public_key(std::string priv_key) {
  bc::ec_secret decoded;
  bc::decode_base16(decoded, priv_key);
  bc::wallet::ec_private
    secret(decoded, bc::wallet::ec_private::mainnet_p2kh);
  bc::wallet::ec_public public_key(secret);
  return public_key.encoded();
}
```

^
...takes in a hex-encoded private key...

---

# **`bitcoin_address.cpp`**

```cpp, [.highlight: 2-3]
std::string create_bitcoin_public_key(std::string priv_key) {
  bc::ec_secret decoded;
  bc::decode_base16(decoded, priv_key);
  bc::wallet::ec_private
    secret(decoded, bc::wallet::ec_private::mainnet_p2kh);
  bc::wallet::ec_public public_key(secret);
  return public_key.encoded();
}
```

^
...Decodes it into an integer...

---

# **`bitcoin_address.cpp`**

```cpp, [.highlight: 4-5]
std::string create_bitcoin_public_key(std::string priv_key) {
  bc::ec_secret decoded;
  bc::decode_base16(decoded, priv_key);
  bc::wallet::ec_private
    secret(decoded, bc::wallet::ec_private::mainnet_p2kh);
  bc::wallet::ec_public public_key(secret);
  return public_key.encoded();
}
```

^
...Calculates a public key point on the Elliptic Curve...

---

# **`bitcoin_address.cpp`**

```cpp, [.highlight: 6]
std::string create_bitcoin_public_key(std::string priv_key) {
  bc::ec_secret decoded;
  bc::decode_base16(decoded, priv_key);
  bc::wallet::ec_private
    secret(decoded, bc::wallet::ec_private::mainnet_p2kh);
  bc::wallet::ec_public public_key(secret);
  return public_key.encoded();
}
```

^
...Generates a public key from that point...

---

# **`bitcoin_address.cpp`**

```cpp, [.highlight: 7]
std::string create_bitcoin_public_key(std::string priv_key) {
  bc::ec_secret decoded;
  bc::decode_base16(decoded, priv_key);
  bc::wallet::ec_private
    secret(decoded, bc::wallet::ec_private::mainnet_p2kh);
  bc::wallet::ec_public public_key(secret);
  return public_key.encoded();
}
```

^
...and returns it.

---

# **`bitcoin_address.cpp`**

```cpp
#include <string>
#include "bitcoin_address.h"

int main(void) { ... }

std::string create_bitcoin_public_key(std::string priv_key) {
  bc::ec_secret decoded;
  bc::decode_base16(decoded, priv_key);
  bc::wallet::ec_private
    secret(decoded, bc::wallet::ec_private::mainnet_p2kh);
  bc::wallet::ec_public public_key(secret);
  return public_key.encoded();
}
```

^
Okay, so, that's all well and good, but how can we use this function from Elixir?

---

# **`bitcoin_address.cpp`**

```cpp
int main(void) {
  int bytes_read;
  byte buffer[MAX_BUFFER_SIZE];

  while((bytes_read = read_msg(buffer)) > 0) {
    // TODO put C-code here, right now it only echos data back
    // to Elixir.
    send_msg(buffer, bytes_read);
  }
  return 0;
}
```

^
Unlike Export, where we are able to send messages to any Python library directly and get values returned, here, we're tied to the C++ `main` function, which brings in messages from Elixir in a buffer of bytes.

---

# [fit] Just send
# [fit] **private key?**

^
In order to call the `create_bitcoin_public_key` function...

---

# [fit] Just send
# [fit] **private key?** :x:

^
...we can't just send the private key from Elixir and expect that C++ will know what to do with it.

---

# [fit] Send **Flag** :checkered_flag:!

^
We'll need to send a flag along as well, that will allow the C++ program to determine what function is to be called, and the easiest type of flag in this case...

---

# [fit] Send **Flag** :checkered_flag:!
<br />
# [fit] `const int CREATE_BITCOIN_PUBLIC_KEY = 1;`

^
...is an integer, so, let's say that the integer 1 stands for creating a bitcoin public key, and we want to be able to extract that as the first byte of the message from Elixir.<br />
We will need a function that processes a message that includes information about what command is to be called...

---

# **`bitcoin_address.cpp`**

```cpp
const int CREATE_BITCOIN_PUBLIC_KEY = 1;

int main(void) {
  int bytes_read;
  byte buffer[MAX_BUFFER_SIZE];

  while((bytes_read = read_msg(buffer)) > 0) {
    process_command(buffer, bytes_read);
  }
  return 0;
}
```

^
...so let's call that `process_command`.<br />
After declaring the `process_command` in the header file, let's have a look at what its details could look like.

---

```cpp
void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
Something like this.

---

```cpp, [.highlight: 1]
void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
We take the buffer and number of bytes read as arguments to the function...

---

```cpp, [.highlight: 2]
void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
...and from the buffer we extract the first byte to determine which function to call.

---

```cpp, [.highlight: 3]
void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
...and then we declare the function argument `arg` to be a pointer at the second byte of the buffer and cast it to a string, which for our purposes is equivalent to assigning the contents of the buffer, minus the first function name byte to the `arg` variable (being able to do this is something that I learned about C++).

---

```cpp, [.highlight: 4-10]
void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
From there, we take the function integer, switch on it, call the function that maps to it, and assign it to a `result` string.

---

```cpp, [.highlight: 11]
void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
We then overwrite the contents of the current buffer with the result of calling the `create_bitcoin_public_key` function with this `memcpy` incantation...

---

```cpp, [.highlight: 12]
void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
and then send it back to Elixir via the `send_msg` function provided by Cure.

---

```cpp
void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
Quite a bit more involved than Python, right? 

---

![fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

^
So, how does this look on the Elixir side?

---

```elixir
defmodule BitcoinAddress.CPlusPlus do
  alias Cure.Server, as: Cure

  @cpp_executable "priv/bitcoin_address"
  # Integers representing C++ methods
  @create_bitcoin_public_key 1

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <- create_bitcoin_public_key(pid, private_key) do
      IO.puts("Private key: #{inspect(private_key)}")
      IO.puts("Bitcoin public key: #{inspect(bitcoin_public_key)}")
      :ok = Cure.stop(pid)
    end
  end

  defp create_bitcoin_public_key(pid, private_key) do
    Cure.send_data(pid, <<@generate_public_key, private_key::binary>>, :once)

    receive do
      {:cure_data, response} ->
        response
    end
  end
end
```

^
Kind of similar to what we did for Python as the actions we're performing from the Elixir point of view are similar.<br />
Let's do another deep dive cause this is a lot of code for a slide.

---

```elixir
defmodule BitcoinAddress.CPlusPlus do
  alias Cure.Server, as: Cure

  @cpp_executable "priv/bitcoin_address"
  # Integers representing C++ methods
  @create_bitcoin_public_key 1

  # ...
end
```

^
First...

---

```elixir, [.highlight: 4]
defmodule BitcoinAddress.CPlusPlus do
  alias Cure.Server, as: Cure

  @cpp_executable "priv/bitcoin_address"
  # Integers representing C++ methods
  @create_bitcoin_public_key 1

  # ...
end
```

^
we need to tell Cure where to look for the C++ executable file (generation of which we'll look at in just a moment, suffice to say that even though C code itself lives in the `c_src` directory, the executable will get compiled out to the priv directory where the Python code lives)

---

```elixir, [.highlight: 5-6]
defmodule BitcoinAddress.CPlusPlus do
  alias Cure.Server, as: Cure

  @cpp_executable "priv/bitcoin_address"
  # Integers representing C++ methods
  @create_bitcoin_public_key 1

  # ...
end
```

^
We then define mirroring integers that map to the C++ functions, so there's necessary tight coupling here.

---

```elixir
defmodule BitcoinAddress.CPlusPlus do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key) do
      # ...
      :ok = Cure.stop(pid)
    end
  end

  # ...
end
```

^
From there, we'll add in a generate() function to do all the work, and in it, we'll do the following:

---

```elixir, [.highlight: 5]
defmodule BitcoinAddress.CPlusPlus do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key) do
      # ...
      :ok = Cure.stop(pid)
    end
  end

  # ...
end
```

^
We call `Cure.start_link` to spawn off a process to the executable which gives us back its process ID

---

```elixir, [.highlight: 6-7]
defmodule BitcoinAddress.CPlusPlus do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key) do
      # ...
      :ok = Cure.stop(pid)
    end
  end

  # ...
end
```

^
Which we then pass to the `create_bitcoin_public_key` function, along with the `private_key` we want to create a Bitcoin public key for. This is probably starting to sound familiar by now.

---

```elixir, [.highlight: 6-7, 13-21]
defmodule BitcoinAddress.CPlusPlus do
  # ...

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key) do
      # ...
      :ok = Cure.stop(pid)
    end
  end

  defp create_bitcoin_public_key(pid, priv_key) do
    Cure.send_data(pid, <<@create_bitcoin_public_key, priv_key::binary>>, :once)
    receive do
      {:cure_data, response} ->
        response
    end
  end
end
```

^
There, using the power of Elixir binaries that allow us to tinker with the innards of a sequence of bytes, we use `Cure.send_data` to send a binary to the C++ executable consisting of the integer for the function we want to call, (`create_bitcoin_public_key`), and the rest of the message payload, in this case the private key, and the atom `:once` to indicate that we only want a single message back from Cure and we don't need to listen for any other returned messages.<br />
Cure returns the response from C++ to our process mailbox with the `:cure_data` atom, which we receive and simply return back...

---

# [fit] Bitcoin Public key :white_check_mark:

```elixir
defmodule BitcoinAddress.CPlusPlus do
  alias Cure.Server, as: Cure

  @cpp_executable "priv/bitcoin_address"
  # Integers representing C++ methods
  @create_bitcoin_public_key 1

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <- create_bitcoin_public_key(pid, private_key) do
      IO.puts("Private key: #{inspect(private_key)}")
      IO.puts("Bitcoin public key: #{inspect(bitcoin_public_key)}")
      :ok = Cure.stop(pid)
    end
  end

  defp create_bitcoin_public_key(pid, private_key) do
    Cure.send_data(pid, <<@create_bitcoin_public_key, priv_key::binary>>, :once)

    receive do
      {:cure_data, response} ->
        response
    end
  end
end
```

^
...and print to standard output.<br />
So now we have the Bitcoin public key, but what about the address? Let's add that in to the C++ file as a function called `create_bitcoin_address`, that takes in a Bitcoin public key, and returns a Base58 Bitcoin address.

---

# **`bitcoin_address.cpp`**

```cpp
std::string create_bitcoin_address(std::string pub_key) {
  bc::wallet::ec_public public_key = bc::wallet::ec_public::ec_public(pub_key);
  bc::data_chunk public_key_data;
  public_key.to_data(public_key_data);
  const auto hash = bc::bitcoin_short_hash(public_key_data);
  bc::data_chunk unencoded_address;
  unencoded_address.reserve(25);
  unencoded_address.push_back(0);
  bc::extend_data(unencoded_address, hash);
  bc::append_checksum(unencoded_address);
  const std::string address = bc::encode_base58(unencoded_address);
  return address;
}
```

^
Right, so most of the code for this function comes straight out of the Mastering Bitcoin book and I have it in a Github repo if you care to do more detailed analysis, but suffice to say it does the same thing as the Python function equivalent, giving us back a Bitcoin address.

---

```cpp
const int CREATE_BITCOIN_PUBLIC_KEY = 1;
const int CREATE_BITCOIN_ADDRESS = 2;

int main(void) { ... }

void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
    case CREATE_BITCOIN_ADDRESS:
      result = create_bitcoin_address(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
In order to be able to call this function...

---

```cpp, [.highlight: 1-2, 11-18]
const int CREATE_BITCOIN_PUBLIC_KEY = 1;
const int CREATE_BITCOIN_ADDRESS = 2;

int main(void) { ... }

void process_command(byte* buffer, int bytes_read) {
  int function = buffer[0];
  std::string arg = (char*) &buffer[1];
  std::string result;

  switch (function) {
    case CREATE_BITCOIN_PUBLIC_KEY:
      result = generate_bitcoin_public_key(arg);
      break;
    case CREATE_BITCOIN_ADDRESS:
      result = create_bitcoin_address(arg);
      break;
  }
  memcpy(buffer, result.data(), result.length());
  send_msg(buffer, result.size());
}
```

^
...we will also need to modify the process command function, mapping this function to the integer 2.<br />
So, you can see now why a switch statement was called for in the first place.

---

```elixir
defmodule BitcoinAddress.CPlusPlus do
  @create_bitcoin_public_key 1
  @create_bitcoin_address 2

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key),
         bitcoin_address <-
           create_bitcoin_address(pid, public_key) do
      # ...
    end
  end

  defp create_bitcoin_address(pid, pub_key) do
    Cure.send_data(pid, <<@create_bitcoin_address, pub_key::binary>>, :once)
    receive do
      {:cure_data, response} ->
        response
    end
  end
end
```

^
Back in Elixir, we perform a similar modification to wrap around that function call.

---

```elixir, [.highlight: 3]
defmodule BitcoinAddress.CPlusPlus do
  @create_bitcoin_public_key 1
  @create_bitcoin_address 2

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key),
         bitcoin_address <-
           create_bitcoin_address(pid, public_key) do
      # ...
    end
  end

  defp create_bitcoin_address(pid, pub_key) do
    Cure.send_data(pid, <<@create_bitcoin_address, pub_key::binary>>, :once)
    receive do
      {:cure_data, response} ->
        response
    end
  end
end
```

^
We create a new module attribute for the C++ `create_bitcoin_address` function.

---

```elixir, [.highlight: 9-10, 15-21]
defmodule BitcoinAddress.CPlusPlus do
  @create_bitcoin_public_key 1
  @create_bitcoin_address 2

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key),
         bitcoin_address <-
           create_bitcoin_address(pid, public_key) do
      # ...
    end
  end

  defp create_bitcoin_address(pid, pub_key) do
    Cure.send_data(pid, <<@create_bitcoin_address, pub_key::binary>>, :once)
    receive do
      {:cure_data, response} ->
        response
    end
  end
end
```

^
and add an Elixir `create_bitcoin_address` function that will send the function flag and `bitcoin_public_key` to C++ and return the response.

---

```elixir
defmodule BitcoinAddress.CPlusPlus do
  alias Cure.Server, as: Cure

  @cpp_executable "priv/bitcoin_address"
  # Integers representing C++ methods
  @create_bitcoin_public_key 1
  @create_bitcoin_address 2

  def generate(private_key) do
    with {:ok, pid} <- Cure.start_link(@cpp_executable),
         bitcoin_public_key <-
           create_bitcoin_public_key(pid, private_key),
         bitcoin_address <-
           create_bitcoin_address(pid, bitcoin_public_key) do
      IO.puts("Private key: #{inspect(private_key)}")
      IO.puts("Public key: #{inspect(bitcoin_public_key)}")
      IO.puts("Bitcoin address: #{inspect(bitcoin_address)}")
      :ok = Cure.stop(pid)
    end
  end

  defp create_bitcoin_public_key(pid, priv_key) do
    call_cpp(pid, <<@generate_public_key, priv_key::binary>>)
  end

  defp create_bitcoin_address(pid, pub_key) do
    call_cpp(pid, <<@create_bitcoin_address, pub_key::binary>>)
  end

  defp call_cpp(pid, data) do
    Cure.send_data(pid, data, :once)
    receive do
      {:cure_data, response} ->
        response
    end
  end
end
```

^
Now we have what we need, with slight refactoring here, the only thing left would be to try it out in an iex terminal and see if we get the same values back from both Python and C++.

---

# [fit] ![inline](https://www.dropbox.com/s/btoe37205iqvoun/bitcoin-logo-b.png?dl=1)ut

^
But, before we can attempt to run this, we still have the C++ executable compilation issue to deal with and that...

---

<br />
<br />
# [fit] **Makefile**

^
...Makefile from earlier on.<br />
Makefiles are not something that I write at all, and the Makefile that comes out of the box with Cure didn't work at all with any of my code, so I had to create my own incantations from scratch, and this is what I came up with.

---

# **Makefile** :scream:

```
CC = g++ -std=c++11
APP_DIR = $(shell dirname $(shell pwd))
CURE_DEPS_DIR = $(APP_DIR)/deps/cure/c_src
CURE_DEPS = -I$(CURE_DEPS_DIR) -L$(CURE_DEPS_DIR)
ELIXIR_COMM_C = -x c++ $(CURE_DEPS_DIR)/elixir_comm.c
LIBBITCOIN_DEPS = $(shell pkg-config --cflags --libs libbitcoin)
C_FLAGS = $(CURE_DEPS) $(ELIXIR_COMM_C) $(LIBBITCOIN_DEPS) -O3
PRIV_DIR = $(APP_DIR)/priv
C_SRC_DIR = $(APP_DIR)/c_src
EXECUTABLES = bitcoin_address

all: $(EXECUTABLES)
# * $< - prerequisite file
# * $@ - executable file
$(EXECUTABLES): %: %.cpp
	$(CC) $(C_FLAGS) $(C_SRC_DIR)/$< -o $(PRIV_DIR)/$@
```

^
I'm going to spare you the very dry details of this, cause this is enough to make anyone's eyes bleed, suffice to say that the last lines...

---

# [fit] **Compile from** `c_src/` **to** `priv/`

```
all: $(EXECUTABLES)
# * $< - prerequisite file
# * $@ - executable file
$(EXECUTABLES): %: %.cpp
	$(CC) $(C_FLAGS) $(C_SRC_DIR)/$< -o $(PRIV_DIR)/$@
```

^
...takes any .cpp files that are in the project c_src/ directory, and compiles executables for them into the project priv/ directory.<br />
But, the killer feature of having this is that it enables you to be able to run compilation via `mix`. So, you can do things like...

---

# [fit] **Compile C++ with Elixir**

```elixir
defmodule BitcoinAddress.Mixfile do
  use Mix.Project

  def project do
    [
      # ...
      compilers: Mix.compilers ++ [:cure, :"cure.deps"]
    ]
  end

  # ...
end
```

^
Have the C++ files also compile whenever you run `mix compile`, or...

---

# [fit] **Compile during TDD**

```elixir
if Mix.env() == :dev do
  config :mix_test_watch,
    clear: true,
    tasks: [
      "compile.cure",
      "format",
      "test",
      "credo --strict"
    ]
end
```

^
perhaps independently add their compilation to your mix test.watch pipeline via the `mix compile.cure` command.

---

<br />
<br />
# [fit] **_Anyway..._**

^
Anyway...how about that testing to see if it works thing...?

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
Okay, so we've got our private key and Python solution, so let's test C++...

---

# [fit] **`iex -S mix`**

```elixir
iex(1)> private_key = :crypto.strong_rand_bytes(32) |> Base.encode16()
"1542BC5E590628E5C3A1C355869B1B773B055EDF57A633D58F9C0938BA2CDE0B"
iex(2)> BitcoinAddress.Python.generate(private_key)
Private key: "1542BC5E590628E5C3A1C355869B1B773B055EDF57A633D58F9C0938BA2CDE0B"
Public key: "022dc34a77f936876375190971e31f152a68d2ff7687985b33822f36a78b4eab15"
Bitcoin address: "1Amc3fz6ZmiwqEDbEZwm7eVJZH8ApXBAqY"
iex(3)> BitcoinAddress.CPlusPlus.generate(private_key)
Private key: "1542BC5E590628E5C3A1C355869B1B773B055EDF57A633D58F9C0938BA2CDE0B"
Public key: "022dc34a77f936876375190971e31f152a68d2ff7687985b33822f36a78b4eab15"
Bitcoin address: "1Amc3fz6ZmiwqEDbEZwm7eVJZH8ApXBAqY"
```

^
And, it's the same, so it works! I'll actually bring this up in a console and run it for real in a bit, but for now...

---
[.hide-footer]
[.slidenumbers: false]

![](https://www.dropbox.com/s/tmb0ep4uu3b4w9n/bitcoin-lamborghini.jpg?dl=1)

^
Lambos for all!

---

![left 50%](https://www.dropbox.com/s/8q03qum3zzursmm/python-logo-no-text.png?dl=1)
![right 50%](https://www.dropbox.com/s/9sg30zgqr7dbuz8/cpp_logo.png?dl=1)

^
So, what we've learned here is if you find that Elixir does not yet have the libraries to handle the problems that you want to solve, there are other options available to you using both compiled and runtime languages.

---

# [fit] **Self-Promotion**

- https://paulfioravanti.com/blog/2017/12/04/using-pythons-bitcoin-libraries-in-elixir/
- https://paulfioravanti.com/blog/2017/12/13/using-c-plus-plus-bitcoin-libraries-in-elixir/

^
So, I've written up two blog posts about using Python and C++ Bitcoin libraries in Elixir that should hopefully give you all the details that were potentially absent from this presentation.<br />
Both got picked up by Elixir Weekly so that means they're totally worth reading.

---

# [fit] **Github Repos**
- https://github.com/paulfioravanti/bitcoin_address
- https://github.com/paulfioravanti/mastering_bitcoin

^
The code used in this presentation is contained in its own bitcoin_address repo listed here, and it was based on the repo that I made to port the code examples from Mastering Bitcoin over to Elixir.

---

<br />
<br />
<br />
# [fit] *Ironically enough...*

^
Ironically enough, while preparing this presentation, I actually figured out how to generate Bitcoin public keys directly in Elixir...

---

![right fit](https://www.dropbox.com/s/j5wvcl4knahsbmj/elixir-drop.png?dl=1)

<br />
# [fit] :muscle:

^
(which you can find in the bitcoin_address repo), so there's no need to call out to any other language's library for this particular use case, but hopefully if you're ever called upon to integrate with libraries from other languages, you're now armed with enough information about your options to know how to start, but more importantly...

---
[.hide-footer]
[.slidenumbers: false]

![fit](https://www.dropbox.com/s/d1ama4a83avuq63/my-bitcoin-address.png?dl=1)

^
with more knowledge about Bitcoin addresses, you are now one step closer to your own lambo, so make sure you give me a ride in it sometime when you get it.

---
[.slidenumbers: false]

![right](https://www.dropbox.com/s/5w770gu31uw33l9/nekobus_headshot.jpeg?dl=1)

# [fit] Thanks!
# [fit] __`@paulfioravanti`__
![inline fit](https://www.dropbox.com/s/d1ama4a83avuq63/my-bitcoin-address.png?dl=1)

^
