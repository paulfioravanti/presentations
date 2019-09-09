theme: Next, 9

[.background-color: #FFFFFF]
[.header: #333333, Lato]

![inline 105%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)
![inline 140%](https://www.dropbox.com/s/o34cv6snr4ucfnx/exercism-title-logo.png?dl=1)

# [fit] **__Armstrong Numbers__**

^
Hello everyone!

---

![inline](https://www.dropbox.com/s/3p14nspiym4rkdy/ruby-hex-turquoise.png?dl=1)

^
This month's lines of Ruby...

---

![](https://www.dropbox.com/s/e5uy809tzpn2kab/narcissist.jpg?dl=1)

^
...are in service of creating a program that can determine whether a number is a...

---
[.background-color: #009CA8]
[.header: #FFFFFF, Lato]

![](https://www.dropbox.com/s/e5uy809tzpn2kab/narcissist.jpg?dl=1)

# [fit] **Narcissist**
# [fit] **Number**

^
...narcissist number. Also known as an...

---
[.background-color: #009CA8]
[.header: #FFFFFF, Lato]

![](https://www.dropbox.com/s/e5uy809tzpn2kab/narcissist.jpg?dl=1)

# [fit] **Armstrong**
# [fit] **Number**

^
...Armstrong number. An Armstrong number is a number that is...

---
[.background-color: #FFFFFF]
[.header: #333333, alignment(middle), Lato Bold]
[.header-strong: #009CA8]

# [fit] **Sum** of its own **digits**

^
...the sum of its own digits, each...

---
[.background-color: #FFFFFF]
[.header: #333333, alignment(middle), Lato Bold]
[.header-strong: #009CA8]

# [fit] **Raised** to the **power** of
# [fit] the **number** of **digits**

^
...raised to the power of the number of its digits.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]

# [fit] **Armstrong Numbers**
<br />

^
For example...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, alignment(left)]
[.text: text-scale(2.0), Lato]
[.text-strong: #009CA8]

# [fit] **Armstrong Numbers**

✅ 9

^
9 is an Armstrong number because...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, alignment(left)]
[.text: text-scale(2.0), Lato]
[.text-strong: #009CA8]

# [fit] **Armstrong Numbers**

✅ 9 = 9**^1** = 9

^
...9 to the power of 1, the number of its digits, is also 9.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, alignment(left)]
[.text: text-scale(2.0), Lato]
[.text-strong: #009CA8]

# [fit] **Armstrong Numbers**

✅ 9 = 9**^1** = 9
❌ 10

^
10 is _not_ an Armstrong number, because...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, alignment(left)]
[.text: text-scale(2.0), Lato]
[.text-strong: #009CA8]

# [fit] **Armstrong Numbers**

✅ 9 = 9**^1** = 9
❌ 10 != 1**^2** + 0**^2** = 1

^
...10 has 2 digits, 1 and 0, and if we take each of those numbers and raise them to the power of 2, the number of digits, we get 1.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, alignment(left)]
[.text: text-scale(1.9), Lato]
[.text-strong: #009CA8]

# [fit] **Armstrong Numbers**

✅ 153 = 1**^3** + 5**^3** + 3**^3** = 153

^
Similarly, 153 is an Armstrong number...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, alignment(left)]
[.text: text-scale(1.9), Lato]
[.text-strong: #009CA8]

# [fit] **Armstrong Numbers**

✅ 153 = 1**^3** + 5**^3** + 3**^3** = 153
❌ 154 != 1**^3** + 5**^3** + 4**^3** = 190

^
...but applying the Armstrong formula to 154 equals 190, showing that 154 is _not_ an Armstrong number.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🔢), alignment(left)]
[.text: text-scale(1.8), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Armstrong Numbers**
<br />

^
So, for our code, what we need is a way to...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🔢), alignment(left)]
[.text: text-scale(1.8), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Armstrong Numbers**

- **Get the** **_number of digits_**

^
Get the number of digits in a number...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🔢), alignment(left)]
[.text: text-scale(1.8), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Armstrong Numbers**

- **Get the** **_number of digits_**
- **_Calculate the power_** **of each digit**

^
...calculate the power of each digit, so raise each digit to the power of the number of digits...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🔢), alignment(left)]
[.text: text-scale(1.8), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **Armstrong Numbers**

- **Get the** **_number of digits_**
- **_Calculate the power_** **of each digit**
- **_Sum_** **all the** **_powers_**

^
...and finally sum all the powers.

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

# **Get number of digits**

```ruby
```


^
The problem did not require any object oriented programming, so rather than a class...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Get number of digits**

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)






  end
end
```

^
...I chose to use a Ruby module.<br />
The `module_function` directive means that, in a similar way to using `private`, any method defined below it is a module function...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(center), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

<br />
<br />
<br />

```ruby
ArmstrongNumbers.include?(154)
```

^
...which means that we can just call `ArmstrongNumbers.include?(number)` like this.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Get number of digits**

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)






  end
end
```

^
So, for getting the individual digits of a number, Ruby has a method on the Integer class that allows us to simply...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Get number of digits**

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)
    number





  end
end
```

^
...take the number...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Get number of digits**

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)
    number
      .digits




  end
end
```

^
...and get its digits. Great! First bit done! Next thing I want to do is essentially sum all the powers.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Sum Powers**

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)
    number
      .digits
      .then(&method(:sum_powers))



  end
end
```

^
So, I'll pretend I have a `sum_powers` method that I can give the digits to...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Sum Powers**

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)
    sum =
      number
      .digits
      .then(&method(:sum_powers))


  end
end
```

^
...assign the result of the sum to a local variable...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Sum Powers**

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)
    sum =
      number
      .digits
      .then(&method(:sum_powers))

    sum == number
  end
end
```

^
...and then see if its equal to the number that we got as a parameter. We're still missing an implementation for the `sum_powers` method, so let's do that.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Sum Powers**

```ruby
module ArmstrongNumbers
  module_function
  # ...

  def sum_powers(digits)




  end
  private_class_method :sum_powers
end
```

^
`sum_powers` is internal implementation detail so we use the private class method directive to remove it from the module's public interface.<br />
Unfortunately, Ruby does not have a `private_module_method` directive, nor does just using a `private` directive work in making this method private, so we have to use `private_class_method` for all our private class methods. Anyway...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Sum Powers**

```ruby
module ArmstrongNumbers
  module_function
  # ...

  def sum_powers(digits)
    digits



  end
  private_class_method :sum_powers
end
```

^
...we take the digits of our number...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Sum Powers**

```ruby
module ArmstrongNumbers
  module_function
  # ...

  def sum_powers(digits)
    digits
      .each


  end
  private_class_method :sum_powers
end
```

^
...and for each of those digits...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Sum Powers**

```ruby
module ArmstrongNumbers
  module_function
  # ...

  def sum_powers(digits)
    digits
      .each
      .with_object(digits.length)

  end
  private_class_method :sum_powers
end
```

^
...we want to take it and the length of the digits...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# **Sum Powers**

```ruby
module ArmstrongNumbers
  module_function
  # ...

  def sum_powers(digits)
    digits
      .each
      .with_object(digits.length)
      .sum(&method(:power))
  end
  private_class_method :sum_powers
end
```

^
...and then sum all the results of the digits raised to the power of the digits.length.<br />
That `power` method you see should calculate the power of each digit...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# [fit] **Calculate Power of Each Digit**

```ruby
module ArmstrongNumbers
  module_function
  # ...

  def power((digit, length))
    digit**length
  end
  private_class_method :power
end
```

^
...and we implement it as another private class method, that takes in a digit and a length, and simply raises the digit to the power of the length.<br />
The parameter that this method takes actually ends up being an array with the two values in it, and you can see we've de-structured those elements in the parameter so we can access them easier.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(middle), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

```ruby
                                  module ArmstrongNumbers
                                    module_function

                                    def include?(number)
                                      sum =
                                        number
                                        .digits
                                        .then(&method(:sum_powers))

                                      sum == number
                                    end

                                    def sum_powers(digits)
                                      digits
                                        .each
                                        .with_object(digits.length)
                                        .sum(&method(:power))
                                    end
                                    private_class_method :sum_powers

                                    def power((digit, length))
                                      digit**length
                                    end
                                    private_class_method :power
                                  end
```

^
So, this is the entire solution on a slide...

---
[.background-color: #002B36]

![fit](https://www.dropbox.com/s/qq9bpn5yba7i9ta/passing-tests.png?dl=1)

^
...and it looks like all the tests pass, and even Rubocop gives it its blessing

---
[.header: text-scale(6.0)]

# :+1:

^
...which means it *must* be perfect code...

---
[.header: #333333, alignment(center), text-scale(1.0)]

![inline 137%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)
![inline 160%](https://www.dropbox.com/s/o34cv6snr4ucfnx/exercism-title-logo.png?dl=1)

# [fit] **`exercism submit armstrong_numbers.rb`**

^
...so let's ship it off to Exercism while we're on our victory lap...

---
[.header: #009CA8, alignment(center), text-scale(3.0), Lato]

![inline 137%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)

# **Done!**

^
...and we're all done here.

---
[.header: #009CA8, alignment(center), text-scale(3.0), Lato]

![inline 137%](https://www.dropbox.com/s/rdgu1h8hs8nzch8/exercism-logo-mouth-sad.png?dl=1)

# **Done?**

^
Or...*are* we actually done? If I was going to review anything, perhaps I could say that the solution was a bit...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

# [fit] **Complex...?**

^
...complex? Could we maybe make it a bit easier on the eyes...?

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), Lato]
[.text: alignment(center), text-scale(3.0)]

# :clapper:
## **Take 2**

^
Let's give it a try.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.981)]

<br />

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)



  end
end
```

^
How about we just go back to the module function and say...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.981)]

<br />

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)
    digits = number.digits


  end
end
```

^
...assign the digits to a local variable...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.981)]

<br />

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)
    digits = number.digits
    length = digits.length

  end
end
```

^
...assign the length of the digits to another local variable...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(2.0)]

<br />

```ruby
module ArmstrongNumbers
  module_function

  def include?(number)
    digits = number.digits
    length = digits.length
    number == digits.sum { |digit| digit**length }
  end
end
```

^
...and compare the number to sum of the digit powers, all using an inline block.

---
[.background-color: #002B36]

![fit](https://www.dropbox.com/s/qq9bpn5yba7i9ta/passing-tests.png?dl=1)

^
...boom, tests pass. So, whether you like simple or more complex solutions...

---
[.background-color: #FFFFFF]
[.header: #333333, alignment(center), text-scale(1.25), Lato]

# **Choose Your Own**
# **Adventure**

^
...feel free to choose your own adventure because...

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
[.background-color: #FFFFFF]
[.header: #333333, alignment(center), text-scale(1.5), Lato]

# **BONUS**
# **FACTOIDS!**

^
Before I finish up, aside from coding the solution, I also learned the following things about Armstrong numbers!

---
[.background-color: #FFFFFF]
[.header: #333333, alignment(center), text-scale(1.5), Lato]
[.list: #333333, bullet-character(🔢), alignment(left)]
[.text: text-scale(1.5), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **BONUS FACTOIDS!**

- Number of Armstrong numbers is *finite*


^
The number of Armstrong numbers is finite for a given base. I would have assumed they'd be infinite, but it would seem not.

---
[.background-color: #FFFFFF]
[.header: #333333, alignment(center), text-scale(1.5), Lato]
[.list: #333333, bullet-character(🔢), alignment(left)]
[.text: text-scale(1.5), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **BONUS FACTOIDS!**

- Number of Armstrong numbers is *finite*
- Only *88* Armstrong numbers in *Base 10*


^
There are only 88 Armstrong numbers in Base 10, with the largest one being...

---
[.background-color: #FFFFFF]
[.header: #333333, alignment(center), text-scale(1.5), Lato]
[.list: #333333, bullet-character(🔢), alignment(left)]
[.text: text-scale(1.5), Lato Bold]
[.text-emphasis: #009CA8]

# [fit] **115,132,219,018,**
# [fit] **763,992,565,095,**
# [fit] **597,973,971,522,401**


^
...this one, at 39 digits long.

---
[.background-color: #002B36]

![fit](https://www.dropbox.com/s/4e64tbx4mluz09f/big_armstrong_number.png?dl=1)

^
...which, of course, I had to try with the solution, and it works!

---
[.background-color: #009CA8]
[.header: #FFFFFF, text-scale(1.5), Lato]

![right](https://www.dropbox.com/s/5w770gu31uw33l9/nekobus_headshot.jpeg?dl=1)

# [fit] **Thanks!**
# [fit] **`@paulfioravanti`**

^
Thanks very much.
