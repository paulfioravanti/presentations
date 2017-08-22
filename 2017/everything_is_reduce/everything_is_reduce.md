theme: Fira, 3
footer: @paulfioravanti
slidenumbers: true
slidecount: true

# [fit] **EVERYTHING IS**
# [fit] `reduce`

^
Hi everyone...

---

# [fit] THIS PRESENTATION IS ABOUT
# <br />
# <br />
# <br />
# <br />

^
This presentation is about a single little function in Elixir called...

---

# [fit] THIS PRESENTATION IS ABOUT
# [fit] _**`reduce`**_

^
...reduce.<br />
And by "reduce" I mean to change or...

---

# [fit] **TRANSFORM**
# [fit] SOMETHING

^
...transform something...

---

# [fit] **TRANSFORM**
# [fit] TO A _**DIFFERENT**_ FORM

^
...to a different form...

---

# [fit] **TRANSFORM**
# [fit] TO A MORE _**BASIC**_ FORM

^
...or to a more basic form...

---

# :tangerine: :arrow_right: :tropical_drink:

^
...like when an orange is reduced to a pulp<br />
It was a solid that you could eat, but now it's a liquid you can drink. It's been transformed.

---

![inline](https://www.dropbox.com/s/eaqfevyruo5g8h2/pulp_bigger.png?dl=1)

^
Not real code, but in Elixir, we could have a function like `pulp`, which takes in an orange, and returns you an orange juice.

---

![inline](https://www.dropbox.com/s/zwhjg197wruzij7/pulp_multiple_oranges.png?dl=1)

^
Though it usually takes more than one orange to make a glass of orange juice, so we'd better give it a collection of oranges<br />
Now someone could call this `pulp` function as part of their nutricious breakfast routine.

---

![inline](https://www.dropbox.com/s/fitj4xaktpmwtjo/reduce_multiple_oranges.png?dl=1)

^
And under the hood, a `reduce` function would be doing the bulk of the work squeezing those oranges.

---

# [fit] **`Enum`**

^
In Elixir this is what happens for pretty much every function in the `Enum` module, when dealing with a set of enumerables like...

---

# **Lists**
# `[1, 2, 3]`

^
...lists (kind of like arrays in other languages)...

---

# **Maps**
# [fit] `%{apple: "🍏", banana: "🍌"}`

^
...or maps (kind of like hashes or dictionaries in other languages)...

<!-- --- -->

<!-- # **Ranges** -->
<!-- # `1..10` -->

<!-- ^ -->
<!-- ...and ranges (a set of discrete numbers between a start and end point). -->

<!-- --- -->

<!-- # **Enumerables**<br /><br /> -->

<!-- ## `[1, 2, 3]` -->
<!-- ## [fit] `%{apple: "🍏", banana: "🍌"}` -->
<!-- ## `1..10` -->

<!-- ^ -->
<!-- These three are the backbone for holding state in Elixir. -->

---

# So...

^
So, reducing...

---

![inline](https://www.dropbox.com/s/zjwpvtr2nte539o/enum_sum.png?dl=1)

^
...let's take `Enum.sum` function for example. You're taking a list of three integers...

---

![inline](https://www.dropbox.com/s/xmrvaihawtxirrb/enum_sum_answer.png?dl=1)

^
...and reducing it to a single integer.<br />
On the surface it's summing the numbers cause that's what the function is telling you it's doing. But under the surface, it's reducing.

---

![inline](https://www.dropbox.com/s/bye51ad4t27yn9c/elixir_join.png?dl=1)

^
Or `Enum.join` where you're taking a list of three strings...

---

![inline](https://www.dropbox.com/s/ywrml4n3u37fpgo/elixir_join_answer.png?dl=1)

^
...and reducing it to a single string. Same kind of thing.

---

# `[1, 2, 3]`

^
When we have these collections of data, we typically want to use them as a basis to...

---

# [fit] **PERFORM**
# [fit] OPERATION

^
...perform some kind of operations or...

---

# [fit] **DERIVE**
# [fit] INFORMATION

^
...derive some information from them in order to...

---

# CREATE
# [fit] **NEW**
# INFORMATION

^
...create new pieces of information.

---

# :rabbit:

^
So, let's begin our journey down the `reduce` rabbit hole to some functions that iterate over collections that you may have seen in other languages.

---

# `[1, 2, 3]`

^
Using our previous list, what if we wanted to loop over it, and print out what the current number is on each iteration?

---

![inline](https://www.dropbox.com/s/1wu2mca6ky4vhgq/enum_each.png?dl=1)

^
Well, conveniently, we've got the `Enum.each` function to help us with that.<br />
The `each` function takes a collection of enumerables as its first parameter, and a function as its second parameter.<br />
In this case, it's a function that says to print out the current number using `IO.puts`.  When we run this function...

---

![inline](https://www.dropbox.com/s/db1m59izl4bdq1r/enum_each_answer.png?dl=1)

^
...it prints out the numbers, and returns the atom `:ok`.<br />
`:ok` is what the return value of `IO.puts` is, and in this case, it's the return value of the *final* time `IO.puts` gets called.
But, why didn't it return three `:ok` atoms, or at least print them out so we know that `IO.puts` returned correctly?  Keep that question in the back of your mind and let's move on to another example.

---

# `[1, 2, 3]`
# **:arrow_down:**
# `:ok`

^
Rather than just an :ok atom...

---

# `[1, 2, 3]`
# **:arrow_down:**
# ~~`:ok`~~

^
..let's get Elixir to give us back...

---

# `[1, 2, 3]`
# **:arrow_down:**
# `[2, 4, 6]`

^
...a list of doubled values from the first list.<br />
Since we specifically want the return value to be another list, we can use...

---

![inline](https://www.dropbox.com/s/ukfsftglclvgl6d/enum_map.png?dl=1)

^
...the `Enum.map` function<br />
Like `each`, the `map` function takes a collection of enumerables as its first parameter, and a function as its second parameter.<br />
But, here it's a function that determines what value should go into the new list for each iteration of the enumerable collection in the first parameter.  Here, we can see we're taking the number and multiplying it by two, and we return...

---

![inline](https://www.dropbox.com/s/59b9i24pu96lfza/enum_map_answer.png?dl=1)

^
...`[2, 4, 6]`, a new accumulated list of doubled numbers.<br />
If you've done any programming at all, `each` and `map` functions will probably be very familiar to you and an indispensable part of your toolbox.  I know I personally use them all the time.

---

# :rabbit2:

^
Okay, so let's go down the last leg of the rabbit hole...

---

# `[1, 2, 3]`

^
Let's change the values of our list to be, say...

---

# [fit] `["a","b","c"]`

^
...letters.  And let's expand it a bit...

---

# [fit] `["a","a","a","b","c","c"]`

^
...and make each letter appear multiple times in the list.<br />
And from this list, I want to find out how many times each letter appears.

---

# [fit] `["a","a","a","b","c","c"]`
# **:arrow_down:**
# [fit] `%{"a" => 3,"b" => 1,"c" => 2}`

^
So, rather than a list, I want a map that will have the letters as its keys, and the values as counts of how many times a letter appears in the list. In this case "a" appears 3 times in the list, "b" appears once, and "c" twice.

---

[.build-lists: true]

# **Requirements**

- Take in a list
- Return a map
- Loop over each element in list
- Add letter key to map if it doesn't exist
- If letter key exists, increment its value

^
* What I need from this function overall is for it to...
- take in a list
- return a map
* and then the work I'll need it to do is to
- Loop over each element in list
- Add a letter key to the map if it doesn't exist and start the letter count
- And if the letter key exists in the map, increment its value
* Those are the requirements for the function.


---

# [fit] `["a","a","a","b","c","c"]`
# **:arrow_down:**
# [fit] `%{"a" => 3,"b" => 1,"c" => 2}`

^
The `Enum.map` function returns a list, so I can't use that, and `Enum.each` just returns back whatever the function that it runs returns, so what are my options?

---

# [fit] **`reduce`**

^
If you guessed `reduce`...

---

# :star2:

^
...I'd give you a gold star.

---

# [fit] `Enum.reduce(enumerable, acc, fun)`

^
So let's take a look at what this `reduce` function is all about.<br />
The first argument is, no surprises the enumerable, which, like `each` and `map`, is our list, so let's put that in there...

---

```elixir
Enum.reduce(["a", "a", "a", "b", "c", "c"], acc, fun)
```

^
...and then maybe extract it out into its own variable cause it's a bit long.

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, acc, fun)
```

^
Next, is this "acc" value, which stands for accumulator...

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, accumulator, fun)
```

^
...though "acc" is its common shorthand and you'll see it everywhere.

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, acc, fun)
```

^
The accumulator is the value that will get returned every time the `fun` function in the next parameter runs, and it's here in this `acc` parameter that we give the accumulator its initial value.<br />
The `Enum.map` function we used previously implicitly initialised and returned us a list, but here what we want returned back...

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, acc, fun)

%{"a" => 3, "b" => 1, "c" => 2}
```

^
...is a map of those letter occurrences. So, what should we be giving the accumulator parameter for its initial value?<br />
In our case, we'll give it an empty map...

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{}, fun)

#=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
...because we want to populate a map from scratch to generate our result.  If we had an existing map...

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{"a" => 10}, fun)

#=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
...with figures we wanted to add to, we could put that in as the initial value instead.<br />
We're not limited to putting empty values in the `acc` parameter, but for this purpose, we're starting afresh.

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{}, fun)

#=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
Finally, we need to add in our `fun` or `function` that will enable the transformation of our empty map into a populated map.

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{}, fn(char, map) ->
end)

#=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
For every iteration of the list, the function needs to take in a character from the list, and the map to populate.<br />
On the first iteration, the value of the `map` variable will be the empty map that we passed in.

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{}, fn(char, map) ->
  Map.update(map, char, 1, fn(value) ->
    value + 1
  end)
end)

#=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
For our purposes, we'll get the function to call out to the `Map.update` function to do all of the work of populating the map. `Map.update` looks a bit cryptic, so to elaborate:

---

```elixir, [.highlight: 4]
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{}, fn(char, map) ->
  Map.update(map, char, 1, fn(value) ->
    value + 1
  end)
end)

#=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
Map.update takes in a map and a key, which in this case is the character from our list, assigned here as `char`.<br />
If it can't find the character key in the map, it will create it, and give it an initial value, which is the next parameter: 1.<br />
If it does find the key, then it runs the function in the next parameter, which takes the current value for that key...

---

```elixir, [.highlight: 5]
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{}, fn(char, map) ->
  Map.update(map, char, 1, fn(value) ->
    value + 1
  end)
end)

#=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
...and increments it by one.

---

```elixir, [.highlight: 4-6]
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{}, fn(char, map) ->
  Map.update(map, char, 1, fn(value) ->
    value + 1
  end)
end)

#=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
The return value from `Map.update` is a new map containing the updated values...

---

```elixir, [.highlight: 3]
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{}, fn(char, map) ->
  Map.update(map, char, 1, fn(value) ->
    value + 1
  end)
end)

#=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
...and that new map takes the place of the `map` variable for the next iteration of the `reduce` function, until we've gone through the whole list and get returned the map we expect.

---

```elixir
list = ["a", "a", "a", "b", "c", "c"]

Enum.reduce(list, %{}, fn(char, map) ->
  Map.update(map, char, 1, fn(value) ->
    value + 1
  end)
end)

=> %{"a" => 3, "b" => 1, "c" => 2}
```

^
Great, so, that was probably a not-so-gentle introduction to Enum.reduce, a function that takes enumerable input, and gives you back some kind of transformed output.<br />
But the reason I want to help you understand reduce is not just that it's some important computer science concept, but in Elixir...

---

# [fit] **_EVERY_**
# [fit] `Enum` FUNCTION IS
# [fit] **`reduce`**

^
every function in the `Enum` module can be expressed as, and ultimately is, a `reduce` function.<br />
Let's trace back and see our way out of the rabbit hole.

---

```elixir
Enum.map([1, 2, 3], fn(number) ->
  number * 2
end)
[2, 4, 6]
```

^
Remember our `map` function that returned another list of doubled values?

---

```elixir
Enum.reduce([1, 2, 3], [], fn(number, list) ->
  [number * 2 | list]
end)
```

^
It can also be written as `reduce`, where our starting accumulator value is a different empty list, and on each iteration of our list, we return a new list consisting of the doubled value and all the other values we've doubled so far.

---

```elixir
Enum.reduce([1, 2, 3], [], fn(number, list) ->
  [number * 2 | list]
end)
[6, 4, 2]
```

^
This reduce actually gets us the list backwards due to the nature of adding elements to Elixir lists from the front, but we can fix this...

---

```elixir
Enum.reduce([1, 2, 3], [], fn(number, list) ->
  [number * 2 | list]
end)
|> Enum.reverse()
[2, 4, 6]
```

^
...by piping the result into the `Enum.reverse/1` function to get the result that we expect.

---

```elixir
Enum.map([1, 2, 3], fn(number) ->
  number * 2
end)
[2, 4, 6]

---

Enum.reduce([1, 2, 3], [], fn(number, list) ->
  [number * 2 | list]
end)
|> Enum.reverse()
[2, 4, 6]
```

^
So what we've done here is reduced data from one list into another list. These two functions...

---

# [fit] **SAME**

^
...are the same.

---

```elixir
Enum.each([1, 2, 3], fn(number) ->
  IO.puts("Current number is #{number}")
end)
Current number is 1
Current number is 2
Current number is 3
:ok
```

^
Stepping back up the rabbit hole again, what about `Enum.each`?

---

```elixir
Enum.reduce([1, 2, 3], nil, fn(number, _acc) ->
  IO.puts("Current number is #{number}")
end)
Current number is 1
Current number is 2
Current number is 3
:ok
```

^
It's the same concept, but probably less straightforward, so let's have a slightly closer look.

---

```elixir, [.highlight: 1]
Enum.reduce([1, 2, 3], nil, fn(number, _acc) ->
  IO.puts("Current number is #{number}")
end)
Current number is 1
Current number is 2
Current number is 3
:ok
```

^
In this case, our initial value for `reduce` is `nil` cause we don't specifically have a data structure to populate nor return for each iteration.<br />
We only want to print the current number and that's it.

---

```elixir, [.highlight: 1-3]
Enum.reduce([1, 2, 3], nil, fn(number, _acc) ->
  IO.puts("Current number is #{number}")
end)
Current number is 1
Current number is 2
Current number is 3
:ok
```

^
So what happens here is the return value from `IO.puts` is the `:ok` atom, which gets passed back into the accumulator on every iteration and then promptly ignored until the very end...

---

```elixir
Enum.reduce([1, 2, 3], nil, fn(number, _acc) ->
  IO.puts("Current number is #{number}")
end)
Current number is 1
Current number is 2
Current number is 3
:ok
```

^
...when it's given as the return value for the final iteration of the list. The underscore on the `acc` variable in the function is Elixir's way of explicitly saying this value is not used in a function.

---

```elixir
Enum.each([1, 2, 3], fn(number) ->
  IO.puts("Current number is #{number}")
end)
Current number is 1
Current number is 2
Current number is 3
:ok

---

Enum.reduce([1, 2, 3], nil, fn(number, _acc) ->
  IO.puts("Current number is #{number}")
end)
Current number is 1
Current number is 2
Current number is 3
:ok
```

^
So once again, here we have two functions that are...

---

# [fit] **SAME**

^
...the same, emphasising once again that...

---

# [fit] ALL ARE :lollipop: FOR
# [fit] **`reduce`**

^
...every function in the `Enum` module is syntactic sugar for some kind of `reduce` function.<br />
And it's for this reason that I think it's really useful to understand how to confidently use `reduce` to your advantage...

---

# [fit] :muscle:

^
...as it is the single most powerful function in Elixir's `Enum` module, and I think the concepts underlying it are portable to any other language you may use.<br />
I know myself I've taken many things I've learned in Elixir back to my Ruby programming.

---

# [fit] :computer:

^
So, next time you have an IEX console open, give `Enum.reduce` a try, and I'm sure you'll have all manner of data structures in your Elixir and Phoenix apps doing your bidding in no time.

---
[.slidenumbers: false, .slidecount: false, .hide-footer]
[.hide-footer]

![right](https://www.dropbox.com/s/5w770gu31uw33l9/nekobus_headshot.jpeg?dl=1)
# [fit] Thanks!
# [fit] __`@paulfioravanti`__

^
Questions?
