theme: Next, 9

[.background-color: #FFFFFF]
[.header: #333333, Lato]

![inline 105%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)
![inline 140%](https://www.dropbox.com/s/o34cv6snr4ucfnx/exercism-title-logo.png?dl=1)

# [fit] **__Scrabble Score__**

---

![inline](https://www.dropbox.com/s/t0nmmytvoegdedz/elixir-logo.png?dl=1)

^
This month's lines of Elixir...

---

![79%](https://www.dropbox.com/s/cma9fhoebvwpgth/scrabble-pieces.png?dl=1)

^
...are in service of creating a...

---
[.background-color: #009CA8]
[.header: #FFFFFF, Lato]

![79% filtered](https://www.dropbox.com/s/cma9fhoebvwpgth/scrabble-pieces.png?dl=1)

# [fit] **Scrabble**
# [fit] **Scorer**

^
Scrabble scorer, where given a word, you need to compute the scrabble score for that word.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]

# [fit] **Scrabble Scorer**
<br />

^
The scorer itself has a few requirements in order to complete the exercise, so it must be able to do the following...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🔠), alignment(left)]
[.text: text-scale(1.6), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Scrabble Scorer**

- **Score a** **_letter_**

^
Score a single letter

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🔠), alignment(left)]
[.text: text-scale(1.6), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Scrabble Scorer**

- **Score a** **_letter_**
- **Score a** **_word_**

^
Score a word

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🔠), alignment(left)]
[.text: text-scale(1.6), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Scrabble Scorer**

- **Score a** **_letter_**
- **Score a** **_word_**
- **Score** **_case-insensitively_**

^
Score letters and words case-insensitively

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🔠), alignment(left)]
[.text: text-scale(1.6), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Scrabble Scorer**

- **Score a** **_letter_**
- **Score a** **_word_**
- **Score** **_case-insensitively_**
- **Score** **_non-words_**

^
Score non-words like an empty string and a string with space characters in it like tabs and new lines.

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), Lato]
[.text: alignment(center), text-scale(3.0)]

# :clapper:
## **Take 1**

^
So, here was my first take...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Create Score Mapping**

```elixir
defmodule Scrabble
  @scores %{
    "a" => 1, "b" => 3, "c" => 3,
    "d" => 2, "e" => 1, "f" => 4,
    # ...
    "x" => 8, "y" => 4, "z" => 10
  }
  # ...
end
```

^
A letter and its score sounds like a key/value pair to me<br />
So, we'll store them all in a map and keep it in a module attribute since for all intents and purposes this mapping should be constant and not change.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Create Score Function**

```elixir
defmodule Scrabble
  @scores %{...}

  def score(word) do
    # ...
  end
end
```

^
Next, we need a `score` function to do all the work.<br />
That word variable come in as a string...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Create Score Function**

```elixir
defmodule Scrabble
  @scores %{...}

  def score("elixir") do
    # ...
  end
end
```

^
...like this...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Create Score Function**

```elixir
defmodule Scrabble
  @scores %{...}

  def score(word) do
    # ...
  end
end
```

^
...so let's get started.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Create Score Function**

```elixir
defmodule Scrabble
  @scores %{...}

  def score(word) do
    word




  end
end
```

^
We'll take the word...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Case-Insensitive Scoring**

```elixir
defmodule Scrabble
  @scores %{...}

  def score(word) do
    word
    |> String.downcase()



  end
end
```

^
...downcase it so we fulfil the requirement of case-insensitive scoring...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Create List of Letters**

```elixir
defmodule Scrabble
  @scores %{...}

  def score(word) do
    word
    |> String.downcase()
    |> String.split("", trim: true)


  end
end
```

^
...split the string between each character, making sure that we pass the `trim` option so we don't end up with empty strings in the resulting list...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# [fit] **Score Letters with Fallback**

```elixir
defmodule Scrabble
  @scores %{...}

  def score(word) do
    word
    |> String.downcase()
    |> String.split("", trim: true)
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)

  end
end
```

^
...use `Enum.map` to transform the list from a list of characters to a list of integer scores.<br />
We do this by using the `Map.get` function to fetch the character's score from the `@scores` map, making sure to provide a default return value should we not find the character in the map.<br />
In this case, it's ultimately defensive programming for when the word contains a non-alphabetic character.<br />
Once we have our list of integers...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Sum all Scores**

```elixir
defmodule Scrabble
  @scores %{...}

  def score(word) do
    word
    |> String.downcase()
    |> String.split("", trim: true)
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
...we sum them all together, giving us our score.

---
[.background-color: #002734]

![fit](https://www.dropbox.com/s/0vjrlim733x4wsv/passing-tests.jpg?dl=1)

^
This solution passes all the tests, and even Credo can't find anything wrong it...

---
[.header: text-scale(6.0)]

# :+1:

^
...which means it *must* be perfect code...

---
[.header: #333333, alignment(center), text-scale(1.0)]

![inline 137%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)
![inline 160%](https://www.dropbox.com/s/o34cv6snr4ucfnx/exercism-title-logo.png?dl=1)

# [fit] **`exercism submit scrabble.exs`**

^
...so let's ship it off to Exercism while we're on our victory lap...

---
[.header: #009CA8, alignment(center), text-scale(3.0), Lato]

![inline 137%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)

# **Done!**

^
...and we're all done here. Thanks for coming to my TEDex talk.

---
[.header: #009CA8, alignment(center), text-scale(3.0), Lato]

![inline 137%](https://www.dropbox.com/s/rdgu1h8hs8nzch8/exercism-logo-mouth-sad.png?dl=1)

# **Done?**

^
Or *are* we actually done?

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), Lato]
[.text: alignment(center), text-scale(3.0)]

# :clapper:
## **Take 2**

^
You didn't think Elixir Scrabble would be conquered *that* quickly did you? Let's take another look.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Scrabble Scorer**

```elixir
defmodule Scrabble
  @scores %{...}

  def score(word) do
    word
    |> String.downcase()
    |> String.split("", trim: true)
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
So, we've got our score function. The downcasing looks fine, but that...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Better List Conversion?**

```elixir, [.highlight: 7]
defmodule Scrabble
  @scores %{...}

  def score(word) do
    word
    |> String.downcase()
    |> String.split("", trim: true)
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
...next line. Although it does the job, the String.split with empty string and trim API here doesn't quite feel right to me here.<br />
Surely Elixir has other ways of converting a string to a list of its characters. Well, wouldn't you know it...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Better List Conversion?**

```elixir, [.highlight: 7]
defmodule Scrabble
  @scores %{...}

  def score(word) do
    word
    |> String.downcase()
    |> String.codepoints()
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
...it does, using `String.codepoints()`, a codepoint here meaning a single Unicode character, which may be represented by one or more bytes.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Better List Conversion?**

```elixir, [.highlight: 7]
defmodule Scrabble
  @scores %{...}

  def score(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
We could also use the `String.graphemes()` function, a grapheme here meaning multiple codepoints that may be perceived as a single character, like, say...

---
[.background-color: #FFFFFF]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

```elixir
iex> string = "\u0065\u0301"
"é"
```

^
...'e' with an acute accent, here represented as the letter 'e' (65) single codepoint, and the "combining acute accent" Unicode character (301), taking up two codepoints.<br />
What this means is that...

---
[.background-color: #FFFFFF]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

```elixir
iex> string = "\u0065\u0301"
"é"
iex> byte_size(string)
3
```

^
...so, this string has a byte size of three.

---
[.background-color: #FFFFFF]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

```elixir
iex> string = "\u0065\u0301"
"é"
iex> byte_size(string)
3
iex> String.length(string)
1
```

^
It is perceived as a single character by a user, though, so it's string length is one.

---
[.background-color: #FFFFFF]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

```elixir
iex> string = "\u0065\u0301"
"é"
```

^
Now, you'll see if we ask what the codepoints are for this string...

---
[.background-color: #FFFFFF]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

```elixir
iex> string = "\u0065\u0301"
"é"
iex> String.codepoints(string)
["e", "́"]
```

^
...we end up with two codepoints, one for the 'e', and one for the "combining acute accent" character.

---
[.background-color: #FFFFFF]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

```elixir
iex> string = "\u0065\u0301"
"é"
iex> String.codepoints(string)
["e", "́"]
iex> String.graphemes(string)
["é"]
```

^
But, if we ask for the grapheme, we get back its more human perception as a single character.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Better List Conversion?**

```elixir, [.highlight: 2,7]
defmodule Scrabble
  @scores %{"a" => 1, "b" => 3, "c" => 3}

  def score(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
So, it's probably *more* correct technically to use `String.graphemes()` here.<br />
To which you may rightly counter with "well, English Scrabble doesn't have accented characters, so we should be fine dealing just with codepoints as strings, so this is overkill".<br />
"Also, why are the keys in the `@scores` map strings when they could be simply integer codepoints?"

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Use Codepoints**

```elixir, [.highlight: 2,7]
defmodule Scrabble
  @scores %{?a => 1, ?b => 3, ?c => 3}

  def score(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
Oh alright, then, we'll peel off a layer towards the metal and change the keys to be integer codepoints and use `String.to_charlist()`.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Multiple Traversal**

```elixir, [.highlight: 8-9]
defmodule Scrabble
  @scores %{?a => 1, ?b => 3, ?c => 3}

  def score(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
Next, we have our map and sum functions. Two `Enum` passes over the same list, so surely we can make that one by...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Multiple Traversal**

```elixir, [.highlight: 8-9]
defmodule Scrabble
  @scores %{?a => 1, ?b => 3, ?c => 3}

  def score(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Stream.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
...using `Stream` to make the `map` function lazy and hence perform both the map and sum on the same pass of the list.<br />
But you know what? Every function in the `Enum` module is just syntax sugar for...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Multiple Traversal**

```elixir, [.highlight: 8-10]
defmodule Scrabble
  @scores %{?a => 1, ?b => 3, ?c => 3}

  def score(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce(0, fn char, acc ->
      acc + Map.get(@scores, char, 0)
    end)
  end
end
```

^
...`reduce` anyway, so let's just dispense with the ceremonies and use it directly.<br />
And because I don't like anonymous functions breaking up my nice pipelines...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Multiple Traversal**

```elixir, [.highlight: 8,11-13]
defmodule Scrabble
  @scores %{?a => 1, ?b => 3, ?c => 3}

  def score(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce(0, &add_score/2)
  end

  defp add_score(char, acc) do
    acc + Map.get(@scores, char, 0)
  end
end
```

^
...let's extract it out into its own `add_score` function.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Scrabble Scorer**

```elixir
defmodule Scrabble
  @scores %{?a => 1, ?b => 3, ?c => 3}

  def score(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce(0, &add_score/2)
  end

  defp add_score(char, acc) do
    acc + Map.get(@scores, char, 0)
  end
end
```

^
And we're now looking a bit better, at least on the slide here, but there is still one thing that's bothering me...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Scrabble Scorer**

```elixir, [.highlight: 2]
defmodule Scrabble
  @scores %{?a => 1, ?b => 3, ?c => 3}

  def score(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce(0, &add_score/2)
  end

  defp add_score(char, acc) do
    acc + Map.get(@scores, char, 0)
  end
end
```

^
...and that's the `@scores` map itself.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Huuuge Map**

```elixir
defmodule Scrabble
  @scores %{
    ?a => 1, ?b => 3, ?c => 3,
    ?d => 2, ?e => 1, ?f => 4,
    ?g => 2, ?h => 4, ?i => 1,
    ?j => 8, ?k => 5, ?l => 1,
    ?m => 3, ?n => 1, ?o => 1,
    ?p => 3, ?q => 10, ?r => 1,
    ?s => 1, ?t => 1, ?u => 1,
    ?v => 4, ?w => 4, ?x => 8,
    ?y => 4, ?z => 10
  }
end
```

^
It is pretty huge, and I don't like the way that there are multiple keys pointing to the same value: a, e, i, o, u and others all point to 1, with b, c and others all pointing to 3 etc.<br />
What I would really like is a map where multiple keys all point to the same value...

---

![inline 200%](https://www.dropbox.com/s/rdgu1h8hs8nzch8/exercism-logo-mouth-sad.png?dl=1)

^
...but we cannot do that with a map...

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), Lato]
[.text: alignment(center), text-scale(3.0)]

# :clapper:
## **Take 3**

^
...so it's time to have another re-think.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Huuuge Map**

```elixir
defmodule Scrabble
  @scores %{
    ?a => 1, ?b => 3, ?c => 3,
    ?d => 2, ?e => 1, ?f => 4,
    ?g => 2, ?h => 4, ?i => 1,
    ?j => 8, ?k => 5, ?l => 1,
    ?m => 3, ?n => 1, ?o => 1,
    ?p => 3, ?q => 10, ?r => 1,
    ?s => 1, ?t => 1, ?u => 1,
    ?v => 4, ?w => 4, ?x => 8,
    ?y => 4, ?z => 10
  }
end
```

^
How about we take this huge map...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Lists of Letter Types**

```elixir
defmodule Scrabble
  @one_point_letters [?a, ?e, ?i, ?o, ?u, ?l, ?n, ?r, ?s, ?t]
  @two_point_letters [?d, ?g]
  @three_point_letters [?b, ?c, ?m, ?p]
  @four_point_letters [?f, ?h, ?v, ?w, ?y]
  @five_point_letters [?k]
  @eight_point_letters [?j, ?x]
  @ten_point_letters [?q, ?z]
end
```

^
...and turn it into multiple lists of different types of characters, each list named after how many points their worth.

---
[.background-color: #FFFFFF]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

<br />
<br />
<br />

```elixir
iex> [?a, ?b, ?c, ?d] == 'abcd'
true
```

^
And since in Elixir the syntax for a list of codepoints is equivalent to the codepoints as a single-quoted literal...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.05)]

# **Lists of Letter Types**

```elixir
defmodule Scrabble
  @one_point_letters [?a, ?e, ?i, ?o, ?u, ?l, ?n, ?r, ?s, ?t]
  @two_point_letters [?d, ?g]
  @three_point_letters [?b, ?c, ?m, ?p]
  @four_point_letters [?f, ?h, ?v, ?w, ?y]
  @five_point_letters [?k]
  @eight_point_letters [?j, ?x]
  @ten_point_letters [?q, ?z]
end
```

^
...we can take these lists and...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.8)]

# **Lists of Letter Types**

```elixir
defmodule Scrabble
  @one_point_letters 'aeioulnrst'
  @two_point_letters 'dg'
  @three_point_letters 'bcmp'
  @four_point_letters 'fhvwy'
  @five_point_letters 'k'
  @eight_point_letters 'jx'
  @ten_point_letters 'qz'
end
```

^
...single-quotify them.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# **Fix `add_score/2`**

```elixir
defmodule Scrabble
  @one_point_letters 'aeioulnrst'
  # ...

  def score(word) do
    # ...
    |> Enum.reduce(0, &add_score/2)
  end

  defp add_score(char, acc) do
    acc + Map.get(@scores, char, 0)
  end
end
```

^
Next, we need to re-examine the add_score function.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# **Fix `add_score/2`**

```elixir, [.highlight: 10-12]
defmodule Scrabble
  @one_point_letters 'aeioulnrst'
  # ...

  def score(word) do
    # ...
    |> Enum.reduce(0, &add_score/2)
  end

  defp add_score(char, acc) do
    acc + Map.get(@scores, char, 0)
  end
end
```

^
It's trying get values from a map that doesn't exist any more, which is no good.<br />
So, we can switch that out for a shiny new...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# **Switch on `char`**

```elixir
defmodule Scrabble
  defp add_score(char, acc) do
    case char do
      char when char in @one_point_letters ->
        acc + 1
      char when char in @two_point_letters ->
        acc + 2
      # ...
      char when char in @ten_point_letters ->
        acc + 10
      _ ->
        acc
    end
  end
end
```

^
...case control structure, that examines the character for its inclusion in the letter lists, and determines how many points to add to the reduce accumulator.<br />
Now this case block is quite long, so I have had to abbreviate it for this slide, but one thing we can do when we have a case block that is too long, is to convert it to...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# [fit] **Convert to Function Heads**

```elixir
defmodule Scrabble
  def score(word) do
    # ...
    |> Enum.reduce(0, &add_score/2)
  end

  defp add_score(char, acc) when char in @one_point_letters, do: acc + 1
  defp add_score(char, acc) when char in @two_point_letters, do: acc + 2
  defp add_score(char, acc) when char in @three_point_letters, do: acc + 3
  defp add_score(char, acc) when char in @four_point_letters, do: acc + 4
  defp add_score(char, acc) when char in @five_point_letters, do: acc + 5
  defp add_score(char, acc) when char in @eight_point_letters, do: acc + 8
  defp add_score(char, acc) when char in @ten_point_letters, do: acc + 10
  defp add_score(_char, acc), do: acc
end
```

^
...function heads, so that's pretty cool. But I'm not the biggest fan of all these inline `when char in list` guards, so let's refactor that logic out into...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# [fit] **Add Readable Guards**

```elixir
defmodule Scrabble
  defguardp one_point(char) when char in @one_point_letters
  # ...
  defguardp ten_points(char) when char in @ten_point_letters

  def score(word) do
    # ...
    |> Enum.reduce(0, &add_score/2)
  end

  defp add_score(char, acc) when one_point(char), do: acc + 1
  # ...
  defp add_score(char, acc) when ten_points(char), do: acc + 10
  defp add_score(_char, acc), do: acc
end
```

^
...their own named guards to help with readability. 

---
[.header: #009CA8, alignment(center), text-scale(3.0), Lato]

![inline 137%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)

# **Done!**

^
And so now we can probably say that we're done.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

```elixir
defmodule Scrabble do
  @scores %{
    "a" => 1, "b" => 3, "c" => 3, "d" => 2, "e" => 1, "f" => 4,
    "g" => 2, "h" => 4, "i" => 1, "j" => 8, "k" => 5, "l" => 1,
    "m" => 3, "n" => 1, "o" => 1, "p" => 3, "q" => 10, "r" => 1,
    "s" => 1, "t" => 1, "u" => 1, "v" => 4, "w" => 4, "x" => 8,
    "y" => 4, "z" => 10
  }

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> String.split("", trim: true)
    |> Enum.map(fn char -> Map.get(@scores, char, 0) end)
    |> Enum.sum()
  end
end
```

^
We've gone from a code shape that looks like this...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

```elixir
defmodule Scrabble do
  @one_point_letters 'aeioulnrst'
  @two_point_letters 'dg'
  @three_point_letters 'bcmp'
  @four_point_letters 'fhvwy'
  @five_point_letters 'k'
  @eight_point_letters 'jx'
  @ten_point_letters 'qz'

  defguardp one_point(letter) when letter in @one_point_letters
  defguardp two_points(letter) when letter in @two_point_letters
  defguardp three_points(letter) when letter in @three_point_letters
  defguardp four_points(letter) when letter in @four_point_letters
  defguardp five_points(letter) when letter in @five_point_letters
  defguardp eight_points(letter) when letter in @eight_point_letters
  defguardp ten_points(letter) when letter in @ten_point_letters

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.reduce(0, &add_score_for_letter/2)
  end

  defp add_score_for_letter(letter, acc) when one_point(letter), do: acc + 1
  defp add_score_for_letter(letter, acc) when two_points(letter), do: acc + 2
  defp add_score_for_letter(letter, acc) when three_points(letter), do: acc + 3
  defp add_score_for_letter(letter, acc) when four_points(letter), do: acc + 4
  defp add_score_for_letter(letter, acc) when five_points(letter), do: acc + 5
  defp add_score_for_letter(letter, acc) when eight_points(letter), do: acc + 8
  defp add_score_for_letter(letter, acc) when ten_points(letter), do: acc + 10
  defp add_score_for_letter(_letter, acc), do: acc
end
```

^
...to a code shape that looks like this, where all the bits of logic live in their right places.

---
[.header: #009CA8, alignment(center), text-scale(3.0), Lato]

![inline 137%](https://www.dropbox.com/s/a1bofvyav7hfctu/exercism-logo-mouth-open.png?dl=1)

# **Great!**

^
Which is great!

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), text-scale(3.0), Lato]

![inline 137%](https://www.dropbox.com/s/rdgu1h8hs8nzch8/exercism-logo-mouth-sad.png?dl=1)

# **But...?**

^
But now that I take another squint, there's something that worries me a bit. It might be nothing, but I'm now concerned with...

---
[.header: #333333, alignment(center), text-scale(3.0), Lato Bold]
[.header-emphasis: #009CA8]

# [fit] **_Map_** **vs** **_List_**
# [fit] **Lookup Time**

^
...map versus list lookup times

---
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.29)]

# **From**

```elixir
@scores %{?a => 1, ?b => 3}
Map.get(@scores, char, 0)
```

^
The initial solution used a map, and performed a single key lookup to get a score for a letter.<br />
We did one operation and knew whether there was a score for a letter.

---
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.5)]

# **From**

```elixir
@scores %{?a => 1, ?b => 3}
Map.get(@scores, char, 0)
```

# **To**

```elixir
@one_point_letters 'aeioulnrst'
char when char in @one_point_letters
```

^
But now, when looking up a character, in the worst case scenario, we have to examine each codepoint in each of the charlists to determine what the score for a letter should be.

---
[.header: #009CA8, alignment(center), text-scale(3.0), Lato]

![inline 137%](https://www.dropbox.com/s/rdgu1h8hs8nzch8/exercism-logo-mouth-sad.png?dl=1)

# **Slower..?**

^
So, has the performance of this solution dropped? Well, let's ask...

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), text-scale(2.7), Lato]

# :microscope: ![inline 137%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)

# **Benchee!**

^
...Benchee, a library for benchmarking in Elixir! I ran some ultra-scientific benchmarks against each of the Scrabble Score iterations we've gone through, using input that the exercise tests use, so I'll share just a sample of them here.

---
[.background-color: #002734]

![fit](https://www.dropbox.com/s/1kkcc9xc72stf1z/benchee-empty-input.jpg?dl=1)

^
The first benchmark here is for an empty input.

---
[.background-color: #002734]

![fit](https://www.dropbox.com/s/letkm2jgovxsvrg/benchee-empty-input-green.jpg?dl=1)

^
Here, we can see that the function's best performance and memory usage started when we did the refactor that introduced `reduce`, and stayed consistent as we introduced the case statement, function heads, and named guards.<br />
The reduce function was still using a codepoint map to determine the score, while all the rest used a codepoint list, so it seems like my worries about lookup times were unfounded thanks likely to optimisations in the Elixir compiler.

---
[.background-color: #002734]

![fit](https://www.dropbox.com/s/jxh29xni0bz3ymd/benchee-empty-input-orange.jpg?dl=1)

^
The first attempt solution we had is, as probably expected, not as performant as our refactors, but what really surprised me was...

---
[.background-color: #002734]

![fit](https://www.dropbox.com/s/dgwkzojt9im88iy/benchee-empty-input-red.jpg?dl=1)

^
...the Stream refactor seems to have blown out performance and memory usage, which makes me think that perhaps the benefits of streams are seen in functions where there is some very heavy lifting involved, either complex calculations or big data set crunching.

---
[.background-color: #002734]

![fit](https://www.dropbox.com/s/2ifd6hjwyq7hnlo/benchee-entire-alphbet.jpg?dl=1)

^
Just briefly, for a string input consisting of the entire alphabet...

---
[.background-color: #002734]

![fit](https://www.dropbox.com/s/lexe33i8bbut53a/benchee-entire-alphbet-green.jpg?dl=1)

^
...we can see similar result patterns as with the empty string. For the most part things got better at the point of the reduce refactor...

---
[.background-color: #002734]

![fit](https://www.dropbox.com/s/3bspjcovohf16qo/benchee-entire-alphbet-orange.jpg?dl=1)

^
...save the slight performance hit...

---
[.background-color: #002734]

![fit](https://www.dropbox.com/s/2zicqssq6tem19v/benchee-entire-alphbet-red.jpg?dl=1)

^
...but like before the first attempt and stream refactor performed comparatively poor.

---
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]

# [fit] **Possible Conclusions?**
<br />

^
So, what can we draw from these benchmarks?

---
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.list: #333333, bullet-character(🔠), alignment(left)]
[.text: text-scale(1.35), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Possible Conclusions?**

- **Map lookup** **_not necessarily_** **more** **_performant_**

^
Maybe that map lookups are not necessarily more performant than list lookups. I was expecting Big Oh 1 performance, but apparently small maps under 32 entries are implemented as ordered lists under the hood anyway, so that probably contributes to the lack of result difference in this case.

---
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.list: #333333, bullet-character(🔠), alignment(left)]
[.text: text-scale(1.35), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Possible Conclusions?**

- **Map lookup** **_not necessarily_** **more** **_performant_**
- **Compiler** **_optimises_** **O(n) actions in** **_case/function heads/guards_**

^
The compiler optimises Big Oh n match complexity in case statements, function heads, and guards, which is pretty cool.

---
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.list: #333333, bullet-character(🔠), alignment(left)]
[.text: text-scale(1.35), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Possible Conclusions?**

- **Map lookup** **_not necessarily_** **more** **_performant_**
- **Compiler** **_optimises_** **O(n) actions in** **_case/function heads/guards_**
- **Refactor was** **_justified_** **by** **_science_**

^
And most importantly, science says that all this refactoring was totally worth it.

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), Source Code Pro Medium]
[.text: #FFFFFF, Helvetica Neue Medium]

![inline 105%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)

# **`github.com/paulfioravanti/exercism_scrabble_benchmark`**

^
If you're interested in having a look at all the benchmarks or even running them yourselves, then you can go and do so in the exercism_scrabble_benchmark repo on my Github.<br />
Anyway, what this whole process has taught me about Exercism exercises is that...

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), text-scale(1.25), Lato]

# **You'll rarely get it**
# **right the first time**

^
You'll rarely get your solution right the first time you attempt it, and that's totally okay.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(center), text-scale(1.5), Lato]

# **Submit often,**
# **get feedback**

^
I'd recommend submitting your solutions often to the site to have a record of your progress, and don't hesitate to call on mentors if you want help.

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), text-scale(1.5), Lato]

# **Read other**
# **people's code**

^
There is a ton of knowledge to be gained from reading other people's code in their solutions, so definitely take the time to do so.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(center), text-scale(1.5), Lato]

# **Refactor until**
# **you're happy**

^
And finally, definitely keep refactoring until you are happy with your solution as you will learn a lot along the way.

---
[.background-color: #009CA8]
[.header: #FFFFFF, Source Code Pro Medium]
[.text: #FFFFFF, Helvetica Neue Medium]

![inline 105%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)

# [fit] **`github.com/paulfioravanti/exercism`**

^
I keep all my Exercism solutions on Github, so they are there for your perusal and scrutiny should you be interested.<br />
But make sure you give the problems a try first, because I know I've learned a lot from going through them, and I'm sure that you will as well.

---
[.background-color: #009CA8]
[.header: #FFFFFF, Source Code Pro Medium]

![right](https://www.dropbox.com/s/5w770gu31uw33l9/nekobus_headshot.jpeg?dl=1)

# [fit] **Thanks!**
# [fit] **`@paulfioravanti`**

^
Thanks very much.
