theme: Plain Jane, 1
header: Hoefler Text Black
header-emphasis: Hoefler Text Black
header-strong: Hoefler Text Black

![115%](https://www.dropbox.com/s/0nh30ydsygp5cld/matthew-ansley-254316-unsplash.jpg?dl=1)

^
Everyone knows that coding in Ruby is full of sweetness and light.<br />
But where there is light, shadows are cast. And so it is into the shade we go...

---
[.background-color: #000000]

![115% filtered](https://www.dropbox.com/s/0nh30ydsygp5cld/matthew-ansley-254316-unsplash.jpg?dl=1)

^
...to investigate...

---
[.background-color: #000000]
[.header: #F0F0F0, alignment(left), text-scale(1.175)]

![115%](https://www.dropbox.com/s/0nh30ydsygp5cld/matthew-ansley-254316-unsplash.jpg?dl=1)

# The

^
The...

---
[.background-color: #000000]
[.header: #F0F0F0, alignment(left), text-scale(1.175)]

![115%](https://www.dropbox.com/s/0nh30ydsygp5cld/matthew-ansley-254316-unsplash.jpg?dl=1)

# The Curious

^
...curious...

---
[.background-color: #000000]
[.header: #F0F0F0, alignment(left), text-scale(1.175)]

![115%](https://www.dropbox.com/s/0nh30ydsygp5cld/matthew-ansley-254316-unsplash.jpg?dl=1)

# The Curious Incident

^
...incident...

---
[.background-color: #000000]
[.header: #F0F0F0, alignment(left), text-scale(1.175)]
[.header-emphasis: #777777, alignment(center), text-scale(3.0)]

![115%](https://www.dropbox.com/s/0nh30ydsygp5cld/matthew-ansley-254316-unsplash.jpg?dl=1)

# The Curious Incident of the
# [fit] **_SHADOW_**

^
...of the shadow...

---
[.background-color: #000000]
[.header: #F0F0F0, alignment(left), text-scale(1.175)]
[.header-emphasis: #777777, alignment(center), text-scale(3.0)]
[.header-strong: #F0F0F0, alignment(left), text-scale(2.0)]

![115%](https://www.dropbox.com/s/0nh30ydsygp5cld/matthew-ansley-254316-unsplash.jpg?dl=1)

# The Curious Incident of the
# **_SHADOW_**
# **in the Run-Time**

^
...in the run-time.

---
[.background-color: #000000]
[.header-emphasis: #777777, alignment(center), text-scale(3.0)]

![115%](https://www.dropbox.com/s/0nh30ydsygp5cld/matthew-ansley-254316-unsplash.jpg?dl=1)

# [fit] **_SHADOW_**

^
Now, you may have heard the word "shadow" used in the context of a programming language before. And it was probably in reference to the issue of...

---
[.background-color: #000000]
[.header: #F0F0F0, alignment(left), text-scale(1.175)]
[.header-emphasis: #777777, alignment(center), text-scale(3.1)]

![115%](https://www.dropbox.com/s/0nh30ydsygp5cld/matthew-ansley-254316-unsplash.jpg?dl=1)

# [fit] **VARIABLE**
# [fit] **_SHADOWING_**

^
...variable shadowing. A basic example of this in Ruby would be:

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]

# shadow.rb
<br />

^
Let's say we have a file called `shadow.rb`, and in it...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

# shadow.rb

```ruby
x = 42
```

^
...we assign a variable `x` with the value of `42`...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

# shadow.rb

```ruby
x = 42
3.times { |x| puts "x is #{x}" }
```

^
and then we add a loop that runs three times, printing out the value of `x` on each run of the loop.<br />
I'm sure that you have noticed that there are two variables named "`x`": the outer variable, and the block variable. But, is this an actual problem, though?<br />
Let's try running it.<br />

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

# shadow.rb

```ruby
x = 42
3.times { |x| puts "x is #{x}" }
```

```sh
$ ruby shadow.rb
x is 0
x is 1
x is 2
```

^
And the output looks reasonable. The call to `puts` is inside a block, and so it outputs the `x` value that is local to that block. It would definitely be surprising...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

# shadow.rb

```ruby
x = 42
3.times { |x| puts "x is #{x}" }
```

```sh
$ ruby shadow.rb
x is 42
x is 42
x is 42
```

^
...if `puts` prioritised values that are outside of its local scope, and output `"x is 42"` three times.

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

# shadow.rb

```ruby
x = 42
3.times { |x| puts "x is #{x}" }
```

```sh
$ ruby shadow.rb
x is 0
x is 1
x is 2
```

^
But since local variables are always prioritised in Ruby when there is a shadow, we get the output we expect.

---
[.background-color: #111111]
[.header: #F0F0F0, alignment(left), text-scale(1.175)]
[.header-strong: #BD0600]
[.header-emphasis: #777777, alignment(center), text-scale(3.1)]

# [fit] DOES **RUBY**
# [fit] CARE ABOUT
# [fit] **_SHADOWING?_**

^
So, does Ruby itself really care that we are writing our code like this as long as we are getting the correct output?

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.0)]

# shadow.rb

```ruby
x = 42
3.times { |x| puts "x is #{x}" }
```

^
To answer that, let's try running the program again...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.0)]

# shadow.rb

```ruby
x = 42
3.times { |x| puts "x is #{x}" }
```

```sh
$ ruby -w shadow.rb
```

^
...but this time using the "w" flag to enable warnings.

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.0)]

# shadow.rb

```ruby
x = 42
3.times { |x| puts "x is #{x}" }
```

```sh
$ ruby -w shadow.rb
shadow.rb:2: warning: shadowing outer local variable - x
shadow.rb:1: warning: assigned but unused variable - x
x is 0
x is 1
x is 2
```

^
It looks like Ruby does care: about both the shadowing, as well as declaring an unused variable, which in this case is the outer `x` variable.<br />
(Ruby doesn't care enough to raise an error, but enough to make you feel that perhaps...

---
[.background-color: #FCFCFC]

![fit](https://www.dropbox.com/s/w1q4s5smxjx2ehz/matz-full-bw.jpg?dl=1)

^
...Matz is very mildly frowning at you)

---
[.background-color: #FCFCFC]

![350%](https://www.dropbox.com/s/w1q4s5smxjx2ehz/matz-full-bw.jpg?dl=1)

---
[.background-color: #111111]
[.header: #F0F0F0, alignment(left), text-scale(1.175)]
[.header-emphasis: #C7B810, alignment(center)]

# [fit] BUT **_WHY_**
# [fit] THOUGH?

^
 But why, though? 

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

# shadow.rb

```ruby
x = 42
3.times { |x| puts "x is #{x}" }
```

^
Well, one reason could be that what if we wanted to change our program...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

# shadow.rb

```ruby
x = 42
3.times do |x|
  puts(
    "Local x is #{x} and "\
    "outer x is #{'What goes here??'}"
  )
end
```

^
...to have `puts` output both the block variable and the outer variable?<br />
Since we already have a local variable named `x`, there is no way to access some other variable, also called `x`, that is outside the local scope. In order to get this to work...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

# shadow.rb

```ruby
y = 42
3.times { |x| puts "x is #{x} and y is #{y}" }
```

^
...we would have to change the name of one of the variables.

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.3)]

# shadow.rb

```ruby
y = 42
3.times { |x| puts "x is #{x} and y is #{y}" }
```

```sh
$ ruby -w shadow.rb
x is 0 and y is 42
x is 1 and y is 42
x is 2 and y is 42
```

^
And when we run it, we get what we expect: `x` is our dynamic local variable, and `y` is always 42.

---

> "[Matz] thinks that shadowing by itself is a bad habit and should be discouraged."
-- Shouhei Urabe, quoting Matz

^
This is why variable shadowing in Ruby is generally considered "a bad habit and should be discouraged"

---

![inline](https://www.dropbox.com/s/n5jws5t28nuifdr/rubo-logo-horizontal.png?dl=1)

# [fit] `ShadowingOuterLocalVariable`

^
Aside from warnings from Ruby itself, if you use Rubocop, it has a ShadowingOuterLocalVariable cop (which mimics Ruby's warning), so there are ways to enable your tools to help you keep the shadows at bay.

---

![](https://www.dropbox.com/s/7eqxplfvcazahrh/rene-bohmer-6SFfFpHmVjI-unsplash.jpg?dl=1)

^
However, there is another kind of shadowy figure lurking at the peripheries of the Ruby language. One that is not variable-shaped, and one that Ruby tooling does not warn you about.<br />
You are probably unlikely to come across it in the wilds of production code...

---

![](https://www.dropbox.com/s/gwo3n23001qaayz/samuel-zeller-15925-unsplash.jpg?dl=1)

^
...but it is worth knowing about since it can make for some potentially confusing behaviour.<br />
So, let us venture deeper into the depths of the Ruby runtime, and discover a new shade of darkness called...

---
[.background-color: #000000]
[.header: #F0F0F0, alignment(left), text-scale(1.175)]
[.header-emphasis: #878787, alignment(center), text-scale(3.1)]

![](https://www.dropbox.com/s/gwo3n23001qaayz/samuel-zeller-15925-unsplash.jpg?dl=1)

# [fit] **INSTANCE METHOD**
# [fit] **_SHADOWING_**

^
...instance method shadowing.  In Ruby's syntax documentation, The Local Variables and Methods Assignment section says that...

---
[.text-strong: #11A4B8]

> "In Ruby, _local variable_ **names** and _method_ **names** are nearly identical."

^
"In Ruby, _local variable_ **names** and _method_ **names** are nearly identical."

---
[.text-strong: #11A4B8]

> "If you have not assigned to one of these ambiguous **names**, Ruby will _assume you wish to call a method_."

^
"If you have not assigned to one of these ambiguous **names**, Ruby will _assume you wish to call a method_."

---
[.text-strong: #11A4B8]

> "Once you have assigned to the **name**, Ruby will _assume_ you wish to reference a _local variable_."

^
"Once you have assigned to the **name**, Ruby will _assume_ you wish to reference a _local variable_."

---

> "The local variable is created _when the parser encounters the assignment_, not when the assignment occurs."
-- Local Variables and Methods Assignment section of Ruby's syntax documentation

^
"The local variable is created _when the parser encounters the assignment_, not when the assignment occurs."

---
[.background-color: #111111]
[.header: #F0F0F0, alignment(center), text-scale(1.175)]
[.header-emphasis: #777777, alignment(center), text-scale(3.1)]

# [fit] **_TOP_**
# [fit] **:arrow_down:**
# [fit] **_BOTTOM_**

^
Ruby parses code line by line from top to bottom during run time.

---
[.background-color: #111111]
[.header: #F0F0F0, alignment(center), text-scale(1.175)]
[.header-strong: #11A4B8]
[.header-emphasis: #C7B810, alignment(center), text-scale(3.1)]

# [fit] **NAMES**
# [fit] CAN
# [fit] **_CHANGE_**

^
So, the understood meaning of one of the "names" mentioned in the documentation can change as the parser moves down the file.

---
[.background-color: #111111]
[.header: #F0F0F0, alignment(center), text-scale(1.175)]
[.header-emphasis: #777777, alignment(center), text-scale(3.1)]

# [fit] **_METHOD_**
# [fit] **:arrow_down:**
# [fit] **_VARIABLE_**

^
What was originally considered a method call, can become a reference to a local variable.

---
[.background-color: #F0F0F0]

^
Let's illustrate this using a completely contrived example.
Let's say we have a file called...

---
[.background-color: #F0F0F0]

# [fit] `person.rb`

^
...`person.rb`, and in it...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby
class Person













end
```

^
...we create a class called Person...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby
class Person


  def initialize(name = nil)
    @name = name
  end







end
```

^
...and we'll give it an initializer that takes in a `name` parameter, and sets a `@name` instance variable with it, defaulting to `nil` if no value is given...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end







end
```

^
...we'll allow getting and setting of `@name` by adding an `attr_accessor` statement...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby
class Person
  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def initialize(name = nil)
    @name = name
  end

end
```

^
...which is shorthand for creating instance methods called `name` and `name=`, which get and set the `@name` instance variable...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end







end
```

^
...and finally...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
...we want to give the Person the ability to say their name, making sure that we handle the case when the Person is not given a name at initialization, by enabling them to say that their name is "Unknown".<br />
So, given what we now know of local variable and method assignment, I would expect the following to happen when we attempt to get a Person to say its name.

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 8-13]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
In the `#say_name` instance method...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 9]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
...the first occurrence of name, seen in the `if name.nil?` statement...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 2,9]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
...would refer to the `#name` instance method provided by `attr_accessor`

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 10]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
When the Ruby parser sees the `name = "Unknown"` assignment line, it will, from that point on, consider any reference to `name` after the assignment to refer to a local variable called `name`, and not the instance method `#name`

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 4-6]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
Therefore, even if an object of class `Person` had a `@name` assigned to it on initialisation...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 12]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
...the `name` referenced in the final line of the `#say_name` method (in `name.inspect`) would have a value of `nil`.

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 8-13]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
This is because at the point of `name.inspect`, even though `name.nil?` would have failed, and therefore the `name = "Unknown"` local variable assignment would not actually be made, the parser _still_ sees that `name` should now refer to a local variable, which has not been assigned to, and so is `nil`.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.25)]

```ruby
$ irb
irb(main):001:0> require "./person.rb"
true
irb(main):002:0>
```

^
So, let's open up an IRB console and test these assumptions.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.25)]

```ruby
$ irb
irb(main):001:0> require "./person.rb"
true
irb(main):002:0> Person.new("Paul").say_name
```

^
We'll create a new person, give them a name, and then get them to say their name. And when we run this...

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.25)]

```ruby
$ irb
irb(main):001:0> require "./person.rb"
true
irb(main):002:0> Person.new("Paul").say_name
My name is nil
nil
```

^
...it looks like our assumptions are confirmed, even though this is probably really counter-intuitive:

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
Going back to the Ruby file...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 9]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
...we can see that the instance method check of `name.nil?` fails because instance method call `name` is not `nil`...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 10]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
...and so a `name` local variable does not get assigned, but Ruby sees that from this point forward, `name` should refer to a local variable, and not a method call.

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 12]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
This means that in the last line, the `name.inspect` method call is attempting to call `inspect` on `nil`, since local variable `name` did not get assigned.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.25)]

```ruby
$ irb
irb(main):001:0> require "./person.rb"
true
irb(main):002:0> Person.new("Paul").say_name
My name is nil
nil
irb(main):003:0>
```

^
Going back to IRb...

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.25)]

```ruby
$ irb
irb(main):001:0> require "./person.rb"
true
irb(main):002:0> Person.new("Paul").say_name
My name is nil
nil
irb(main):003:0> Person.new.say_name
```

^
...what happens when we initialise a Person object without a name?

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.25)]

```ruby
$ irb
irb(main):001:0> require "./person.rb"
true
irb(main):002:0> Person.new("Paul").say_name
My name is nil
nil
irb(main):003:0> Person.new.say_name
My name is "Unknown"
nil
```

^
So this output is probably a bit more intuitive:

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
In the `say_name` method...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 9]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
Instance method call `name.nil?` succeeds since there is no name...

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 10]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
...and we actually enter the block here and assign the `name` local variable to `"Unknown"`, noting again that from here on, `name` refers to the local variable and not the instance method.

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby, [.highlight: 12]
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
...And then at the end, local variable `name`, with `"Unknown"` as its value, gets output.

---
[.background-color: #F0F0F0]
[.header: #171717, alignment(left), text-scale(1.0), Source Code Pro Bold]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.6)]

```ruby
class Person
  attr_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def say_name
    if name.nil?
      name = "Unknown"
    end
    puts "My name is #{name.inspect}"
  end
end
```

^
Great! I mean, all this is kind of weird, but okay!

---

![](https://www.dropbox.com/s/jvn1uzck2jem0cu/matthew-henry-Gyti0PhoQjY-unsplash.jpg?dl=1)

^
Now, how about we dive a bit deeper and see if we can observe how the referencing of `name` changes as the Ruby parser reads through the code.

---
[.background-color: #000000]

![1500%](https://www.dropbox.com/s/k13y8fr2jdlm9b0/pry-logo.png?dl=1)

^
To do this, let's use the Pry debugger to see if we can follow `name`'s journey from instance method to local variable.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
irb(main):002:0> Person.new("Paul").say_name
```

^
Back to our IRb console, let's run `say_name` with a named person and see what happens.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   if name.nil?
    14:     name = "Unknown"
    15:   end
    16:
    17:   puts "My name is #{name.inspect}"
    18: end

[1] pry(#<Person>)>
```

^
Right, we now have a breakpoint where `name.nil?` gets checked.<br />
At this point, we have not reached the `name` variable assignment, so name should refer to the instance method, and have a value of `"Paul"`. Let's check.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   if name.nil?
    14:     name = "Unknown"
    15:   end
    16:
    17:   puts "My name is #{name.inspect}"
    18: end

[1] pry(#<Person>)> name
nil
[2] pry(#<Person>)>
```

^
And...name is `nil`.

---
[.background-color: #111111]
[.header: #777777, alignment(center), text-scale(1.175)]
[.header-emphasis: #C7B810, alignment(center), text-scale(3.1)]

# [fit] **ERR...** **_WHAT?_**

^
Err...what?

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   if name.nil?
    14:     name = "Unknown"
    15:   end
    16:
    17:   puts "My name is #{name.inspect}"
    18: end

[1] pry(#<Person>)> name
nil
[2] pry(#<Person>)>
```

^
How does `name` have a value of `nil` if we have not reached the variable assignment statement yet? What is `name` referring to? Is this some weird Pry thing? So many questions...<br />
Well, regardless of having our expectations flipped, let's follow this through to the end.<br />
Since we now have `nil`, I would expect that our next stop will be at line 14, where `"Unknown"` does get assigned to `name`.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
[1] pry(#<Person>)> name
nil
[2] pry(#<Person>)> next
```

^
Let's get Pry go to the next execution statement.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
[1] pry(#<Person>)> name
nil
[2] pry(#<Person>)> next

From: /person.rb @ line 17 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
    13:   if name.nil?
    14:     name = "Unknown"
    15:   end
    16:
 => 17:   puts "My name is #{name.inspect}"
    18: end

[2] pry(#<Person>)>
```

^
It...skipped directly to the bottom, and it would seem that the assignment did not happen. Let's see if that actually is the case, and what gets output.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
[2] pry(#<Person>)> next

From: /person.rb @ line 17 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
    13:   if name.nil?
    14:     name = "Unknown"
    15:   end
    16:
 => 17:   puts "My name is #{name.inspect}"
    18: end

[2] pry(#<Person>)> name
nil
[3] pry(#<Person>)> exit
My name is nil
```

^
This is all quite confusing. We got the expected result from initializing a person with a name, but, on the way, did we encounter some kind of...

---
[.background-color: #111111]
[.header: #F0F0F0, alignment(center), text-scale(1.175)]

# [fit] SPOOKY

^
Spooky...

---
[.background-color: #111111]
[.header: #F0F0F0, alignment(center), text-scale(1.175)]
[.header-emphasis: #777777, alignment(center), text-scale(3.1)]

# [fit] SPOOKY
# [fit] **_QUANTUM_**

^
...Quantum...

---
[.background-color: #111111]
[.header: #F0F0F0, alignment(center), text-scale(1.175)]
[.header-strong: #BD0600]
[.header-emphasis: #777777, alignment(center), text-scale(3.1)]

# [fit] SPOOKY
# [fit] **_QUANTUM_**
# [fit] **RUBY**

^
...Ruby that ended up changing the value of `name`...

---
[.background-color: #111111]
[.header: #F0F0F0, alignment(center), text-scale(1.175)]
[.header-strong: #BD0600]
[.header-emphasis: #777777, alignment(center), text-scale(3.1)]

# [fit] SPOOKY
# [fit] **_QUANTUM_**
# [fit] **RUBY?**

^
...just because we observed it?

---

![](https://www.dropbox.com/s/0ki6ybose7437k5/hand-over-degree.jpg?dl=1)

^
Well, before we start handing ourselves honorary doctorates in quantum computing, let's call on the old traditional Ruby debugger, `puts`, to see if we can get an impartial view of what the value of `name` is before the `name.nil?` check.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts name.inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end

[1] pry(#<Person>)>
```

^
We've added a `puts name.inspect` in the code, so now, let's compare what value we get for `name` when using Pry, versus the value we get inside the code with `puts`.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts name.inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end

[1] pry(#<Person>)> name
nil
```

^
First up, Pry, which says `name` is `nil`, and now...

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
[1] pry(#<Person>)> name
nil
[2] pry(#<Person>)> next
"Paul"

From: /person.rb @ line 14 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
    13:   puts name.inspect
 => 14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end
```

^
...running next executes the `puts name.inspect` code, which gives us `"Paul"`, the value we expect, but Pry still says that `name` is `nil`.<br />
How can the same variable have two values? It can't, so there must be something else at play here. What version of `name` exactly are Pry and `puts` seeing when the code is being stepped through?

---
[.background-color: #F0F0F0]


^
Well, there is one more Ruby tool that can help us find that out...

---
[.background-color: #F0F0F0]
[.header: #11A4B8, alignment(center), text-scale(1.175)]

# [fit] `defined?`

^
...the defined? keyword, which returns a string describing its argument

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts defined?(name).inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end

[1] pry(#<Person>)>
```

^
Okay, back to IRb again, and we've added `defined?` to our `puts` calls. Let's first see what what the Ruby code considers `name` to be.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts defined?(name).inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end

[1] pry(#<Person>)> next
"method"
```

^
Ruby says `name` is a method! That gels with what we would expect. So what about Pry...?

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(0.8)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts defined?(name).inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end

[1] pry(#<Person>)> defined?(name)
"local-variable"
```

^
Pry sees name as a local variable! How can this be if we have not reached the assignment statement yet?

---
[.background-color: #000000]

![](https://www.dropbox.com/s/7haoo595fymatfh/hands-crystal-ball.jpg?dl=1)

^
Can Pry see into the future? Well, Pry itself can't, and what is happening is not _really_ seeing into the future.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.0)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts defined?(name).inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end
```

^
The key to this mystery is the...

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.0)]

```ruby, [.highlight: 6]
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts defined?(name).inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end
```

^
...`binding` part of the `binding.pry` statement.<br />
Ruby's Binding "encapsulates the execution context at some particular place in the code", which, in our case...

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.0)]

```ruby, [.highlight: 5-14]
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts defined?(name).inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end
```

^
...is the entirety of the #say_name method. When we step through the code with `binding.pry`...

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.0)]

```ruby, [.highlight: 9]
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts defined?(name).inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end
```

^
at the point of the `name.nil?` statement, the Ruby parser (Ruby itself) sees `name` as referring to a method, since it knows nothing about any assignment statements yet.<br />
Pry, on the other hand...

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.0)]

```ruby, [.highlight: 5-14]
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts defined?(name).inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end
```

^
...thanks to the `binding` effectively "rushing ahead to read the rest of the method" so it can create its execution context, knows all about the local variable assignments that could happen.

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.0)]

```ruby
irb(main):002:0> Person.new("Paul").say_name

From: /person.rb @ line 13 Person#say_name:

    10: def say_name
    11:   binding.pry
    12:
 => 13:   puts defined?(name).inspect
    14:   if name.nil?
    15:     name = "Unknown"
    16:   end
    17:
    18:   puts "My name is #{name.inspect}"
    19: end
```

^
Hence, we can now see the discrepancies in the results between running `puts` inline and using Pry in this case.

---
[.background-color: #F0F0F0]

^
So, how can you avoid falling into these kinds of pits of potential confusion? Well just...

---
[.background-color: #111111]
[.header-strong: #BD0600]

# [fit] **DON'T**

^
...don't...

---
[.background-color: #111111]
[.header-strong: #BD0600]
[.header-emphasis: #777777, alignment(center), text-scale(3.1)]

# [fit] **DON'T**
# [fit] **_SHADOW_**

^
...shadow.

---

![350%](https://www.dropbox.com/s/w1q4s5smxjx2ehz/matz-full-bw.jpg?dl=1)

[.background-color: #000000]
[.header-strong: #FF0700]
[.header-emphasis: #F0F0F0, alignment(center), text-scale(3.1)]

# [fit] **DON'T**
# [fit] **_SHADOW_**

^
Leaving aside the quality issues of the example code (since it is meant to illustrative of the problem and not exemplary Ruby code after all), to get expected results, there are enough ways it could be changed to fulfil different objectives like:

---

[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.5)]

<br />

```ruby
def say_name
  if name.nil?
    self.name = "Unknown"
  end
  puts "My name is #{name.inspect}"
end
```

^
Specifically assign to the person's `name` instance variable if they were not given one using `self.name = "Unknown"`, or...

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.5)]

```ruby
def say_name
  name = self.name || "Unknown"
  puts "My name is #{name.inspect}"
end
```

^
...output a display name without assigning a `name` instance variable if one was not originally given, here using `self.name` to refer explicitly to the `name` instance method

---
[.background-color: #F0F0F0]
[.code: auto(42), Source Code Pro Bold, line-height(1.0), text-scale(1.5)]

```ruby
def say_name
  name = self.name || "Unknown"
  puts "My name is #{name.inspect}"
end

def say_name
  name = name() || "Unknown"
  puts "My name is #{name.inspect}"
end
```

^
Or here using parentheses to explicitly say that you're calling a method.

---

![](https://www.dropbox.com/s/lxinkdyak2y3ebd/igor-lepilin-fjmPfKvayzA-unsplash.jpg?dl=1)

^
So, be kind to your future self and your team mates. Be the light against the shade, and re-consider shadowing in your code.

---
[.text-emphasis: #11A4B8]

![right](https://www.dropbox.com/s/7tndc4utrnr54pi/nekobus_headshot-black-and-white.jpeg?dl=1)

# [fit] **_THANKS!_**
# [fit] **`@paulfioravanti`**

^
Thanks very much.
