theme: Next, 9

[.background-color: #FFFFFF]
[.header: #333333, alignment(center), text-scale(3.0), Lato]

![inline 105%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)
![inline 140%](https://www.dropbox.com/s/o34cv6snr4ucfnx/exercism-title-logo.png?dl=1)

# **__Bob__**

^
Hello everyone!

---

![inline](https://www.dropbox.com/s/vupcyjweccnjdoi/elm-hex-turquoise.png?dl=1)

^
This month's lines of Elm...

---

![](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

^
...are in service of talking to our new friend...

---
[.background-color: #009CA8]
[.header: #FFFFFF, Lato]

![](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

# [fit] **Bob**

^
...Bob.

---
[.background-color: #009CA8]
[.header: #FFFFFF, Lato]

![](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

^
Bob is a lackadaisical teenager. In conversation, his responses are very limited.

---
[.header: #FFFFFF, Lato]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

^
If you ask Bob a question...

---
[.list: #009CA8, bullet-character(🤘)]
[.text: text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

- "Sure."

^
...he replies "Sure".<br />
If you yell at him...

---
[.list: #009CA8, bullet-character(🤘)]
[.text: text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

- "Sure."
- "Whoa, chill out!"

^
...he answers "Whoa, chill out!"<br />
If you yell a question at him...

---
[.list: #009CA8, bullet-character(🤘)]
[.text: text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

- "Sure."
- "Whoa, chill out!"
- "Calm down, I know what I'm doing!"

^
...he answers "Calm down, I know what I'm doing!"<br />
If you address him without actually saying anything....

---
[.list: #009CA8, bullet-character(🤘)]
[.text: text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

- "Sure."
- "Whoa, chill out!"
- "Calm down, I know what I'm doing!"
- "Fine. Be that way!"

^
...he answers "Fine. Be that way!"<br />
And to anything else...

---
[.list: #009CA8, bullet-character(🤘)]
[.text: text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

- "Sure."
- "Whoa, chill out!"
- "Calm down, I know what I'm doing!"
- "Fine. Be that way!"
- "Whatever."

^
...he answers "Whatever."

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(center), text-scale(6.0), Lato]

<br />
# **Bob**

^
So, for our code, what we need is a way to help Bob...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.text: text-scale(1.5), Lato Bold]
[.text-emphasis: #009CA8]

# **Bob**
<br />

^
...do the following things...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🤘), alignment(left)]
[.text: text-scale(1.5), Lato Bold]
[.text-emphasis: #009CA8]

# **Bob**

- **Distinguish** **_questions_**

^
...distinguish questions...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🤘), alignment(left)]
[.text: text-scale(1.5), Lato Bold]
[.text-emphasis: #009CA8]

# **Bob**

- **Distinguish** **_questions_**
- **Distinguish** **_yelling_**

^
...distinguish yelling...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🤘), alignment(left)]
[.text: text-scale(1.5), Lato Bold]
[.text-emphasis: #009CA8]

# **Bob**

- **Distinguish** **_questions_**
- **Distinguish** **_yelling_**
- **Distinguish a** **_question yelled_**

^
...distinguish when a question is being yelled at him...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🤘), alignment(left)]
[.text: text-scale(1.5), Lato Bold]
[.text-emphasis: #009CA8]

# **Bob**

- **Distinguish** **_questions_**
- **Distinguish** **_yelling_**
- **Distinguish a** **_question yelled_**
- **Understand** **_silence_**

^
...understand what silence is...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), Lato]
[.list: #333333, bullet-character(🤘), alignment(left)]
[.text: text-scale(1.5), Lato Bold]
[.text-emphasis: #009CA8]

# **Bob**

- **Distinguish** **_questions_**
- **Distinguish** **_yelling_**
- **Distinguish a** **_question yelled_**
- **Understand** **_silence_**
- **Provide a** **_fallback_**

^
...and, finally, enable Bob to provide a fallback response for when anything is said that he doesn't understand (or care about).

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
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

```elm
module Bob exposing (hey)


hey : String -> String
hey message =
```

^
We start off with our Bob module and greeting function, called `hey` that takes a message string and returns another string, Bob's response.<br />
From here, I think the easiest use case to deal with is silence, so let's start there.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# **Distinguish Silence**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
```

^
So let's say we have a function called `isSilence`, that takes in the message, and let's us know if it is silent.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# **Distinguish Silence**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"

isSilence : String -> Bool
isSilence message =
    String.trim message == ""
```

^
And the implementation of that function would simply trim all the white space out of the message, see if it's equal to the empty string, and return a boolean for that result.<br />
Not a bad start. Next, we need to respond to questions, yelling, yelling questions, and a fallback. Since a yelling question is a combination of asking a question and yelling, let's attack that combination next...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# [fit] **Distinguish a Question Yelled**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
    else if isYelling message && isQuestion message then
        "Calm down, I know what I'm doing!"
```

^
...before dealing with them individually.<br />
So we have an `isYelling` function and an `isQuestion` function, which together distinguish a question yelled.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]
[.code-highlight: 5-10]

# [fit] **Distinguish a Question Yelled**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
    else if isYelling message && isQuestion message then
        "Calm down, I know what I'm doing!"

isYelling : String -> Bool
isYelling message =
    (String.toUpper message == message)
```

^
The definition for `isYelling` looks like this, where we uppercase the entire message to see if it matches the message we put in, since the exercise defines yelling as being a message in all uppercase letters...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]
[.code-highlight: 5-11]

# [fit] **Distinguish a Question Yelled**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
    else if isYelling message && isQuestion message then
        "Calm down, I know what I'm doing!"

isYelling : String -> Bool
isYelling message =
    (String.toUpper message == message)
        && not (onlyDigitsOrNonWords message)
```

^
...and we add in another condition to make sure that the message does not contain only digits or non word characters.<br />
This is to counter some of the tests in the suite that just throw numbers and symbols as the message, and as we all know, numbers and symbols output all the same when you attempt to upcase them.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]
[.code-highlight: 4-14]

# [fit] **Distinguish a Question Yelled**

```elm
isYelling : String -> Bool
isYelling message =
    (String.toUpper message == message)
        && not (onlyDigitsOrNonWords message)

onlyDigitsOrNonWords : String -> Bool
onlyDigitsOrNonWords message =
    let
        regex =
            "^([0-9]|[^a-zA-Z])+$"
                |> Regex.fromString
                |> Maybe.withDefault Regex.never
    in
    Regex.contains regex message
```

^
The implementation for the `onlyDigitsOrNonWords` function uses a regex string that checks for a string full of only numbers or non letters, does the Maybe regex dance of grabbing the string, creating an actual regex from it, and giving it a default value if that regex creation fails. Only then does it check the regex to see if the message matches it.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# [fit] **Distinguish a Question Yelled**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
    else if isYelling message && isQuestion message then
        "Calm down, I know what I'm doing!"
```

^
So that's the `isYelling` part, and for `isQuestion`...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]
[.code-highlight: 5-12]

# [fit] **Distinguish a Question Yelled**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
    else if isYelling message && isQuestion message then
        "Calm down, I know what I'm doing!"

isQuestion : String -> Bool
isQuestion message =
    message
        |> String.trim
        |> String.endsWith "?"
```

^
...the implementation is a bit more straightforward: we just trim white space from the message and see if it ends with a question mark.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.4), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.775)]

# **Distinguish Yelled Question**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
    else if isYelling message && isQuestion message then
        "Calm down, I know what I'm doing!"
```

^
That's all for the internal private functions. But, we now have all the essential building blocks to finish off for the rest of this exercise.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.775)]

# **Distinguish Yelling**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
    else if isYelling message && isQuestion message then
        "Calm down, I know what I'm doing!"
    else if isYelling message then
        "Whoa, chill out!"
```

^
In order for Bob to distinguish just straight yelling, we check the `isYelling` function just by itself...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.775)]

# **Distinguish Questions**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
    else if isYelling message && isQuestion message then
        "Calm down, I know what I'm doing!"
    else if isYelling message then
        "Whoa, chill out!"
    else if isQuestion message then
        "Sure."
```

^
...and in order to distinguish questions, we check the `isQuestion` by itself...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.775)]

# **Provide a Fallback**

```elm
hey : String -> String
hey message =
    if isSilence message then
        "Fine. Be that way!"
    else if isYelling message && isQuestion message then
        "Calm down, I know what I'm doing!"
    else if isYelling message then
        "Whoa, chill out!"
    else if isQuestion message then
        "Sure."
    else
        "Whatever."
```

^
...and finally, we provide a catch all response of "Whatever" to any message that Bob doesn't know how to deal with.

---
[.background-color: #002B36]

![131%](https://www.dropbox.com/s/tgl61e51m30zqts/passing-tests.jpg?dl=1)

^
...and it looks like all the tests pass...

---

![fit](https://www.dropbox.com/s/253m9k18zzbqglp/elm-analyse.jpg?dl=1)

^
...and Elm Analyse gives it a tick for code quality...

---
[.header: text-scale(6.0)]

# :+1:

^
...which means it *must* be perfect code...

---
[.header: #333333, alignment(center), text-scale(1.0)]

![inline 137%](https://www.dropbox.com/s/j4hvpnmihpizbqh/exercism-logo.png?dl=1)
![inline 160%](https://www.dropbox.com/s/o34cv6snr4ucfnx/exercism-title-logo.png?dl=1)

# [fit] **`exercism submit Bob.elm`**

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
Or...*are* we actually done? Looking back at the solution, there's a few things I didn't really like.

---
[.list: bullet-character(🤘)]
[.text: #333333, text-scale(1.815), Lato Bold]
[.text-strong: #009CA8, text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

^
And maybe Bob didn't like them either.

---
[.list: bullet-character(🤘)]
[.text: #333333, text-scale(1.815), Lato Bold]
[.text-strong: #009CA8, text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

- **Repetition** in condition checking

^
Anyway, we have repetition in the condition checking. We check `isYelling` and `isQuestion` twice each. Surely there's a way to avoid that.

---
[.list: bullet-character(🤘)]
[.text: #333333, text-scale(1.815), Lato Bold]
[.text-strong: #009CA8, text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

- **Repetition** in condition checking
- **Repetition** with `String.trim`

^
We're trimming the string twice: once in the `isSilence` function, and again in the `isQuestion` function.

---
[.list: bullet-character(🤘)]
[.text: #333333, text-scale(1.815), Lato Bold]
[.text-strong: #009CA8, text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

- **Repetition** in condition checking
- **Repetition** with `String.trim`
- Do we really **need** a **regex**?

^
We're using a regex to determine whether a message contains only digits or non words.<br />
Regexes are kind of out of favour in Elm, especially with the advent of the Elm parser module, but regardless, do we really need to use a regex and do the Maybe Regex.fromString dance or is there some other way?

---
[.list: bullet-character(🤘)]
[.text: #333333, text-scale(1.815), Lato Bold]
[.text-strong: #009CA8, text-scale(1.815), Lato Bold]

![left](https://www.dropbox.com/s/bmzh2swa9qp6879/emo-bob.jpg?dl=1)

- **Repetition** in condition checking
- **Repetition** with `String.trim`
- Do we really **need** a **regex**?
- **Big** `if` statements don't **feel right**

^
I don't know about you, but I'm happy to use if statements where needed, but in Elm, a big if statement like the one we have doesn't really feel right to me. So, is there a way to avoid this?

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), Lato]
[.text: alignment(center), text-scale(3.0)]

# :clapper:
## **Take 2**

^
Let's give this implementation another try.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.65)]

# **Distinguish Silence**

```elm
hey : String -> String
hey input =
```

^
We'll start again with attempting to distinguish silence, but in order to save on the string trimming...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.65)]

# **Distinguish Silence**

```elm
hey : String -> String
hey input =
    let
        message =
            String.trim input
```

^
...we'll do it only once, up front. And as for the `isSilence` function...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.65)]

# **Distinguish Silence**

```elm
hey : String -> String
hey input =
    let
        message =
            String.trim input

        isSilence =
            message == ""
```

^
...we'll pull it inline like this...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(1.0)]

# **Distinguish Silence**

```elm
hey : String -> String
hey input =
    let
        message =
            String.trim input

        isSilence =
            message == ""
    in
    if isSilence then
        "Fine. Be that way!"

    else
        respondToVerbalMessage message
```

^
...so we can then go and categorise the messages we cater to as being non-verbal or verbal messages.<br />
This also gets rid of that huge if/else statement, and makes this function a bit more compact overall.<br />
But how about that `respondToVerbalMessage` function?

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.825)]

# **Distinguish Question**

```elm
respondToVerbalRemark : String -> String
respondToVerbalRemark message =
```

^
Well, similar to the hey function...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.825)]

# **Distinguish Question**

```elm
respondToVerbalRemark : String -> String
respondToVerbalRemark message =
    let
        isQuestion =
            String.endsWith "?" message
```

^
...let's bring some more functions inline, starting with `isQuestion`.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.825)]

# **Distinguish Question**

```elm
respondToVerbalRemark : String -> String
respondToVerbalRemark message =
    let
        isQuestion =
            String.endsWith "?" message

        hasLetters =
            String.any Char.isAlpha message
```

^
Then, in order to get rid of that regex we had before, we'll create a `hasLetters` function that determines whether a string contains any alphabet characters...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.825)]

# **Distinguish Yelling**

```elm
respondToVerbalRemark : String -> String
respondToVerbalRemark message =
    let
        isQuestion =
            String.endsWith "?" message

        hasLetters =
            String.any Char.isAlpha message

        isYelling =
            hasLetters && String.toUpper message == message
```

^
...and use it in conjunction with part of the `isYelling` function we had in the previous solution.<br />
Now that we have all these functions inline, we're going to use them to reduce that repetition we had previously with `isQuestion` and `isYelling` by using a...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.825)]

# [fit] **Distinguish Question/Yelling Combos**

```elm
respondToVerbalRemark : String -> String
respondToVerbalRemark message =
    let
        -- ...
    in
    case ( isQuestion, isYelling ) of
```

^
...case statement, where we'll evaluate the results of `isQuestion` and `isYelling` at the same time using a tuple.

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.825)]

# [fit] **Distinguish Question/Yelling Combos**

```elm
respondToVerbalRemark : String -> String
respondToVerbalRemark message =
    case ( isQuestion, isYelling ) of
        ( True, True ) ->
            "Calm down, I know what I'm doing!"
```

^
And, now we go through our combinations for a question that is being yelled...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.825)]

# [fit] **Distinguish Question/Yelling Combos**

```elm
respondToVerbalRemark : String -> String
respondToVerbalRemark message =
    case ( isQuestion, isYelling ) of
        ( True, True ) ->
            "Calm down, I know what I'm doing!"
        ( True, False ) ->
            "Sure."
```

^
...a standard question...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.825)]

# [fit] **Distinguish Question/Yelling Combos**

```elm
respondToVerbalRemark : String -> String
respondToVerbalRemark message =
    case ( isQuestion, isYelling ) of
        ( True, True ) ->
            "Calm down, I know what I'm doing!"
        ( True, False ) ->
            "Sure."
        ( False, True ) ->
            "Whoa, chill out!"
```

^
...being yelled at...

---
[.background-color: #FFFFFF]
[.header: #009CA8, alignment(left), text-scale(1.5), Lato]
[.code: auto(42), Source Code Pro Medium, line-height(1.0), text-scale(0.825)]

# [fit] **Distinguish Question/Yelling Combos**

```elm
respondToVerbalRemark : String -> String
respondToVerbalRemark message =
    case ( isQuestion, isYelling ) of
        ( True, True ) ->
            "Calm down, I know what I'm doing!"
        ( True, False ) ->
            "Sure."
        ( False, True ) ->
            "Whoa, chill out!"
        ( False, False ) ->
            "Whatever."
```

^
...and the fallback.

---
[.background-color: #002B36]

![131%](https://www.dropbox.com/s/tgl61e51m30zqts/passing-tests.jpg?dl=1)

^
This new implementation also passes the tests, and I think I like it better than the first try, so I'll keep it. Anyway, what doing this taught me at least was that when doing these Exercism exercises...

---
[.background-color: #009CA8]
[.header: #FFFFFF, alignment(center), text-scale(1.25), Lato]

# **You'll rarely get it**
# **right the first time**

^
...you'll rarely get your solution right the first time you attempt it, and that's totally okay.

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
[.header: #FFFFFF, text-scale(1.5), Lato]

![right](https://www.dropbox.com/s/5w770gu31uw33l9/nekobus_headshot.jpeg?dl=1)

# [fit] **Thanks!**
# [fit] **`@paulfioravanti`**

^
Thanks very much.
