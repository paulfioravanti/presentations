theme: Sketchnote, 3
footer: *@paulfioravanti*
slidenumbers: true

[.slidenumbers: false]
[.hide-footer]

# [fit] **_Runtime I18n in_**
# [fit] Elm

^
Hi everyone, I'm here to talk about Runtime internationalisation in Elm because when it comes to creating multilingual web pages, internationalisation would seem to be a...

---
[.slidenumber-style: #FFFFFF]

# [fit] **_Deceptively_**
# [fit] COMPLEX

^
deceptively complex problem using Elm.<br />
I have never had to consider the choice of generating application translations as a...

---
[.slidenumber-style: #FFFFFF]
[.header: text-scale(1.5)]

# Pre-build Phase
# *`elm-i18n`*

^
...pre-build phase of an app (using a package like elm-i18n), or have them be...

---
[.slidenumber-style: #FFFFFF]
[.header: text-scale(1.4)]

# Dynamically Loaded
# *`elm-i18next`*

^
...dynamically loaded (eg elm-i18next), which is what I have been used to when working with i18n in Rails or Phoenix.

---
[.slidenumber-style: #FFFFFF]

![fit](https://www.dropbox.com/s/4vz9jg2wqy196jn/ms-paint-thinking-face-emoji.png?dl=1)

^
To be honest, I still do not know which way of doing things is "best" in an Elm context.<br />
But, I do know that what I want to have is runtime-switchable languages via a dropdown menu of some sort, which is something I have done when coding up applications in other languages.

---
[.slidenumbers: false]
[.hide-footer]
[.background-color: #FFFFFF]

![fit](https://www.dropbox.com/s/vkxqqvstoeztz8a/tachyons-logo.png?dl=1)

^
I have been using Tachyons, a CSS utilities framework, a lot lately for styling, and like how it plays with Elm, so for example purposes...

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/l2irsat3sbow78d/Tachyons-full-screen-component-documentation.png?dl=1)

^
...I'm going to use the Full Screen Centered Title component documentation page from Tachyons' website as a base and take it from this, to...

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/23gj539svzodezx/elm-i18n.gif?dl=1)

^
...this, where you can change the message on screen at runtime into Italian and Japanese via the dropdown menu in the top right corner.

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# Back End

- Provide translations in JSON

^
On the back end, we will provide some translations for the page in JSON format, and allow the dropdown menu to switch the current language of the app.

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# Back End

- Provide translations in JSON
- Store selected language in **_`localStorage`_**

^
We will then store the selected language in localStorage so that any selected language persists through page refreshes and different sessions.

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# Back End

- Provide translations in JSON
- Store selected language in **_`localStorage`_**
- Explore type safety options

^
And later on, we'll explore generating Elm modules from the JSON translation files in order to give the translations some type safety

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/l2irsat3sbow78d/Tachyons-full-screen-component-documentation.png?dl=1)

^
First up, we will start with the current state of play, which is a re-creation of the Tachyons page in Elm.

---

```elm
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ content ]


content : Html Msg
content =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading ]
        ]


heading : Html Msg
heading =
    h1 [ class Styles.heading ]
        [ text "Vertically centering things in css is easy!" ]
```

^
Behind the scenes...

---

```elm, [.highlight: 1-4]
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ content ]


content : Html Msg
content =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading ]
        ]


heading : Html Msg
heading =
    h1 [ class Styles.heading ]
        [ text "Vertically centering things in css is easy!" ]
```

^
...we have a view function that contains the page content, and the styles for each one of these functions come from a Styles module containing Tachyons classes, which look like...

---

```elm
module Styles exposing (..)

main_ : String
main_ =
    [ "bg-dark-pink"
    , "overflow-container"
    , "pt3"
    , "sans-serif"
    , "vh-100"
    , "white"
    ]
        |> String.join " "
```

^
...this. I think that putting Tachyons classes in lists like this makes them easier to scan and maintain, but it also has the side effect of making function definitions really long if you leave them inline with view code, so in order to spare room on these slides, all the styles are out in a Styles module.

---

```elm, [.highlight: 1-4]
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ content ]


content : Html Msg
content =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading ]
        ]


heading : Html Msg
heading =
    h1 [ class Styles.heading ]
        [ text "Vertically centering things in css is easy!" ]
```

^
So, you can assume that any time you see `class Styles.whatever`, there is a function that contains a list of Tachyons utility classes.

---

```elm, [.highlight: 7-12]
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ content ]


content : Html Msg
content =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading ]
        ]


heading : Html Msg
heading =
    h1 [ class Styles.heading ]
        [ text "Vertically centering things in css is easy!" ]
```

^
Anyway, the content wraps the heading in article and div tags...

---

```elm, [.highlight: 15-18]
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ content ]


content : Html Msg
content =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading ]
        ]


heading : Html Msg
heading =
    h1 [ class Styles.heading ]
        [ text "Vertically centering things in css is easy!" ]
```

^
...and the heading itself consists of just the `h1` tag letting you know that vertically centering things in CSS is easy with Tachyons.

---

```elm
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ content ]


content : Html Msg
content =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading ]
        ]


heading : Html Msg
heading =
    h1 [ class Styles.heading ]
        [ text "Vertically centering things in css is easy!" ]
```

^
So, from here, what we now want to add is the...

---
[.slidenumber-style: #FFFFFF]

# [fit] LANGUAGE
# [fit] *Dropdown*

^
Language dropdown, and what we want it to do is...

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Language Dropdown

- Show current language on menu

^
...show the current language on the menu by default

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Language Dropdown

- Show current language on menu
- Reveal available languages

^
When you click the menu, it should open, revealing any other available languages aside from the current language

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Language Dropdown

- Show current language on menu
- Reveal available languages
- Change language

^
And when you click on a menu item, it should change the current language of the application.

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Language Dropdown

- Show current language on menu
- Reveal available languages
- Change language
- Close on "blur"

^
We also want to make sure that if you open the menu and then click anywhere else on the page, the menu will consider itself "blurred", and will close<br />
Most of these requirements sound like they would be best served in their own module...

---

```elm
module LanguageDropdown exposing (view)


view : Html msg
view =
    div [ class Styles.dropdownContainer ]
        [ currentSelection ]


currentSelection : Html msg
currentSelection =
    p [ class Styles.currentSelection ]
        [ span [] [ text "English" ]
        , span [ Styles.caret ] [ text "▾" ]
        ]
```

^
...so let's create one called LanguageDropdown.elm, and start with rendering just the current language selection so we can get the menu positioning right. Nothing too surprising here...

---

```elm, [.highlight: 4-7]
module LanguageDropdown exposing (view)


view : Html msg
view =
    div [ class Styles.dropdownContainer ]
        [ currentSelection ]


currentSelection : Html msg
currentSelection =
    p [ class Styles.currentSelection ]
        [ span [] [ text "English" ]
        , span [ Styles.caret ] [ text "▾" ]
        ]
```

^
...we have a div dropdown container that wraps the currently selected language...

---

```elm, [.highlight: 10-15]
module LanguageDropdown exposing (view)


view : Html msg
view =
    div [ class Styles.dropdownContainer ]
        [ currentSelection ]


currentSelection : Html msg
currentSelection =
    p [ class Styles.currentSelection ]
        [ span [] [ text "English" ]
        , span [ Styles.caret ] [ text "▾" ]
        ]
```

^
...and the current selection, or what will look like the menu face on the browser, is a styled `p` tag with some text and a caret to encourage people to click on it.

---

```elm
module LanguageDropdown exposing (view)


view : Html msg
view =
    div [ class Styles.dropdownContainer ]
        [ currentSelection ]


currentSelection : Html msg
currentSelection =
    p [ class Styles.currentSelection ]
        [ span [] [ text "English" ]
        , span [ Styles.caret ] [ text "▾" ]
        ]
```

^
Next, we have to import the language dropdown code...

---

```elm
module Main exposing (main)

import LanguageDropdown


view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ LanguageDropdown.view
        , content
        ]
```

^
...into the Main module...

---

```elm, [.highlight: 9]
module Main exposing (main)

import LanguageDropdown


view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ LanguageDropdown.view
        , content
        ]
```

^
...and place it above the content.

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/x1p8k83m0fatv34/menu-with-current-selection.png?dl=1)

^
And this is what we get. The p-tag "menu" here currently does nothing, but we can at least confirm that it looks like it is in a good spot on the page.

---
[.slidenumber-style: #FFFFFF]

# [fit] *Language*
# [fit] DROPDOWN LIST

^
Now, let's actually give it a list of languages

---

```elm
view : Html msg
view =
    div [ class Styles.dropdownContainer ]
        [ currentSelection
        , dropdownList
        ]

dropdownList : Html msg
dropdownList =
    let
        selectableLanguages =
            [ "Italiano", "日本語" ]
    in
        ul [ class Styles.dropdownList ]
            (List.map dropdownListItem selectableLanguages)

dropdownListItem : String -> Html msg
dropdownListItem language =
    li [ class Styles.dropdownListItem ]
        [ span [] [ text language ] ]
```

^
First...

---

```elm, [.highlight: 1-6]
view : Html msg
view =
    div [ class Styles.dropdownContainer ]
        [ currentSelection
        , dropdownList
        ]

dropdownList : Html msg
dropdownList =
    let
        selectableLanguages =
            [ "Italiano", "日本語" ]
    in
        ul [ class Styles.dropdownList ]
            (List.map dropdownListItem selectableLanguages)

dropdownListItem : String -> Html msg
dropdownListItem language =
    li [ class Styles.dropdownListItem ]
        [ span [] [ text language ] ]
```

^
... we add the dropdownList under the currentSelection.

---

```elm, [.highlight: 8-15]
view : Html msg
view =
    div [ class Styles.dropdownContainer ]
        [ currentSelection
        , dropdownList
        ]

dropdownList : Html msg
dropdownList =
    let
        selectableLanguages =
            [ "Italiano", "日本語" ]
    in
        ul [ class Styles.dropdownList ]
            (List.map dropdownListItem selectableLanguages)

dropdownListItem : String -> Html msg
dropdownListItem language =
    li [ class Styles.dropdownListItem ]
        [ span [] [ text language ] ]
```

^
For the dropdown list itself, we are shoving a HTML unordered list (ul) right underneath the p tag, simulating a menu opening.<br />
For now, we're manually feeding the list of selectable languages, and we'll fix that later, but we take each selectable language and map it to...

---

```elm, [.highlight: 17-20]
view : Html msg
view =
    div [ class Styles.dropdownContainer ]
        [ currentSelection
        , dropdownList
        ]

dropdownList : Html msg
dropdownList =
    let
        selectableLanguages =
            [ "Italiano", "日本語" ]
    in
        ul [ class Styles.dropdownList ]
            (List.map dropdownListItem selectableLanguages)

dropdownListItem : String -> Html msg
dropdownListItem language =
    li [ class Styles.dropdownListItem ]
        [ span [] [ text language ] ]
```

^
...a dropdownListItem, that will display the language.

---

```elm
view : Html msg
view =
    div [ class Styles.dropdownContainer ]
        [ currentSelection
        , dropdownList
        ]

dropdownList : Html msg
dropdownList =
    let
        selectableLanguages =
            [ "Italiano", "日本語" ]
    in
        ul [ class Styles.dropdownList ]
            (List.map dropdownListItem selectableLanguages)

dropdownListItem : String -> Html msg
dropdownListItem language =
    li [ class Styles.dropdownListItem ]
        [ span [] [ text language ] ]
```

^
This results in...

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/egb6vlob8mxolx2/menu-with-open-selection.png?dl=1)

^
...a permanently open menu. So, what we want next is to be able to...

---
[.slidenumber-style: #FFFFFF]

# [fit] SHOW/HIDE
# [fit] *Available Languages*

^
Show and hide the available languages as the menu opens and closes. What that is going to entail is...

---
[.header: text-scale(1.5)]
[.text: text-scale(1.25)]

# [fit] Show/Hide Available Languages

- Flag to **_`showAvailableLanguages`_** in model

^
...a flag in the model to indicate whether the available languages should be shown or not...

---
[.header: text-scale(1.5)]
[.text: text-scale(1.25)]

# [fit] Show/Hide Available Languages

- Flag to **_`showAvailableLanguages`_** in model
- Toggle dropdown list visibility (**_`ShowAvailableLanguages`_**)

^
...an appropriate message that will enable toggling of that value...

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Show/Hide Available Languages

- Flag to **_`showAvailableLanguages`_** in model
- Toggle dropdown list visibility (**_`ShowAvailableLanguages`_**)
- Hide dropdown list on "blur" (**_`CloseAvailableLanguages`_**)

^
...and the ability to hide the dropdown list on "blur" if we click it open and then click anywhere aside from the dropdown menu.

---

```elm
type alias Model =
    { showAvailableLanguages : Bool }


init : ( Model, Cmd Msg )
init =
    ( { showAvailableLanguages = False }, Cmd.none )
```

^
So, first thing's first: we add the showAvailableLanguages boolean flag to the model and initialise it to false

---
[.code: text-scale(1.5)]

<br />

```elm
type Msg
    = CloseAvailableLanguages
    | ShowAvailableLanguages
```

^
We'll then add the CloseAvailableLanguages and ShowAvailableLanguages messages to our message union type...

---

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CloseAvailableLanguages ->
            ( { model | showAvailableLanguages = False }
            , Cmd.none
            )

        ShowAvailableLanguages ->
            ( { model
                | showAvailableLanguages =
                    not model.showAvailableLanguages
              }
            , Cmd.none
            )
```

^
...and add some handlers for those messages in our update function...

---

```elm, [.highlight: 4-7]
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CloseAvailableLanguages ->
            ( { model | showAvailableLanguages = False }
            , Cmd.none
            )

        ShowAvailableLanguages ->
            ( { model
                | showAvailableLanguages =
                    not model.showAvailableLanguages
              }
            , Cmd.none
            )
```

^
When we get the closeAvailableLanguages message, we simply set the showAvailableLanguages flag to false...

---

```elm, [.highlight: 9-15]
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CloseAvailableLanguages ->
            ( { model | showAvailableLanguages = False }
            , Cmd.none
            )

        ShowAvailableLanguages ->
            ( { model
                | showAvailableLanguages =
                    not model.showAvailableLanguages
              }
            , Cmd.none
            )
```

^
and when we get the showAvailableLanguages message, we toggle it.

---

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CloseAvailableLanguages ->
            ( { model | showAvailableLanguages = False }
            , Cmd.none
            )

        ShowAvailableLanguages ->
            ( { model
                | showAvailableLanguages =
                    not model.showAvailableLanguages
              }
            , Cmd.none
            )
```

^
Now, we have to send these messages from the view, so...

---

```elm
view : Model -> Html msg
view { showAvailableLanguages } =
    div [ class Styles.dropdownContainer ]
        [ currentSelection showAvailableLanguages
        , dropdownList showAvailableLanguages
        ]

currentSelection : Bool -> Html Msg
currentSelection showAvailableLanguages =
    p
        [ class (Styles.currentSelection showAvailableLanguages)
        , onClick ShowAvailableLanguages
        ]
        [ span [] [ text "English" ]
        , span [ class Styles.caret ] [ text "▾" ]
        ]
```

^
...in the view...

---

```elm, [.highlight: 1-6]
view : Model -> Html msg
view { showAvailableLanguages } =
    div [ class Styles.dropdownContainer ]
        [ currentSelection showAvailableLanguages
        , dropdownList showAvailableLanguages
        ]

currentSelection : Bool -> Html Msg
currentSelection showAvailableLanguages =
    p
        [ class (Styles.currentSelection showAvailableLanguages)
        , onClick ShowAvailableLanguages
        ]
        [ span [] [ text "English" ]
        , span [ class Styles.caret ] [ text "▾" ]
        ]
```

^
...we'll pass the value of the showAvailableLanguages flag into our other functions.

---

```elm, [.highlight: 8-16]
view : Model -> Html msg
view { showAvailableLanguages } =
    div [ class Styles.dropdownContainer ]
        [ currentSelection showAvailableLanguages
        , dropdownList showAvailableLanguages
        ]

currentSelection : Bool -> Html Msg
currentSelection showAvailableLanguages =
    p
        [ class (Styles.currentSelection showAvailableLanguages)
        , onClick ShowAvailableLanguages
        ]
        [ span [] [ text "English" ]
        , span [ class Styles.caret ] [ text "▾" ]
        ]
```

^
Clicking the currently selected language will toggle the menu's visibility (and as you can see we're also passing the flag into the Styles module so we can add or remove Tachyons classes as needed).

---

```elm, [.highlight: 8-15]
view : Model -> Html msg
view { showAvailableLanguages } =
    div [ class Styles.dropdownContainer ]
        [ currentSelection showAvailableLanguages
        , dropdownList showAvailableLanguages
        ]

dropdownList : Bool -> Html msg
dropdownList showAvailableLanguages =
    let
        selectableLanguages =
            [ "Italiano", "日本語" ]
    in
        ul [ class (Styles.dropdownList showAvailableLanguages) ]
            (List.map dropdownListItem selectableLanguages)
```

^
And in the dropdown list, not much has changed aside from passing the showAvailableLanguages flag off to its styling class, which just for clarity's sake, looks like this...

---

```elm
dropdownList : Bool -> String
dropdownList showAvailableLanguages =
    let
        displayClasses =
            if showAvailableLanguages then
                [ "flex", "flex-column" ]
            else
                [ "dn" ]
    in
        [ "absolute"
        , "b--white"
        , -- ...
        ]
            ++ displayClasses
            |> String.join " "
```

^
What we have here is...

---

```elm, [.highlight: 4-8]
dropdownList : Bool -> String
dropdownList showAvailableLanguages =
    let
        displayClasses =
            if showAvailableLanguages then
                [ "flex", "flex-column" ]
            else
                [ "dn" ]
    in
        [ "absolute"
        , "b--white"
        , -- ...
        ]
            ++ displayClasses
            |> String.join " "
```

^
...displayClasses being created as a separate list of either flex column display or "display none" ("dn")

---

```elm, [.highlight: 10-15]
dropdownList : Bool -> String
dropdownList showAvailableLanguages =
    let
        displayClasses =
            if showAvailableLanguages then
                [ "flex", "flex-column" ]
            else
                [ "dn" ]
    in
        [ "absolute"
        , "b--white"
        , -- ...
        ]
            ++ displayClasses
            |> String.join " "
```

^
...which then gets concatenated to the here-abbreviated list of tachyons classes, before being joined together to get the string needed for the classes.

---

```elm
dropdownList : Bool -> String
dropdownList showAvailableLanguages =
    let
        displayClasses =
            if showAvailableLanguages then
                [ "flex", "flex-column" ]
            else
                [ "dn" ]
    in
        [ "absolute"
        , "b--white"
        , -- ...
        ]
            ++ displayClasses
            |> String.join " "
```

^
Right, so now we have our menu display down, but in order to get some interactivity, we need to be able to...

---
[.slidenumber-style: #FFFFFF]

# [fit] *Subscribe to*
# [fit] MOUSE CLICKS

^
...subscribe to mouse clicks.

---
[.header: text-scale(2.0), alignment(center)]
[.code: alignment(center)]

# :mouse:
# [fit] `elm-package install -y elm-lang/mouse`

^
which, unsurprisingly enough, means we need to install Elm's mouse package...

---

```elm
import Mouse

subscriptions : Model -> Sub Msg
subscriptions model =
    if model.showAvailableLanguages then
        Mouse.clicks (\_ -> CloseAvailableLanguages)
    else
        Sub.none
```

^
...and write a subscriptions function that says if the language menu is open, whenever a mouse is clicked, send that `CloseAvailableLanguages` message to close the menu.

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/2hhdtblb3slepie/dropdown-open-close.gif?dl=1)

^
So, at this point, our menu would be functioning like this, with us being able to open and close the menu, as well as being able to click outside of it to close it.

---
[.slidenumber-style: #FFFFFF]

# [fit] *Language*
# [fit] SWITCHING

^
Right, now we finally come to the meat of our panino: Language Switching.

---

# `elm-i18next`

```sh
elm-package install -y ChristophP/elm-i18next
elm-package install -y elm-lang/http
```

^
We'll be using the `elm-i18next` package since it's the only package that we can do runtime switching with, so after getting that installed...

---
[.code: text-scale(1.5)]

# Translations

```sh
▾ public/                  
  ▾ locale/                
    translations.en.json
    translations.it.json
    translations.ja.json
```

^
...we need to create some JSON files that contain the translations for the app, in this case for English, Italian, and Japanese.

---

```js
{
  "verticallyCenteringInCssIsEasy": "Vertically centering things in css is easy!"
}
```

```js
{
  "verticallyCenteringInCssIsEasy": "Centrare verticalmente con css è facile!"
}
```

```js
{
  "verticallyCenteringInCssIsEasy": "CSSで垂直センタリングは簡単だよ！"
}
```

^
The content for each of the files will be just the one key and value for the CSS message.

---

```elm
module Translations exposing (Lang(..), getLnFromCode)


type Lang
    = En
    | It
    | Ja


getLnFromCode : String -> Lang
getLnFromCode code =
    case code of
        "en" ->
            En

        "it" ->
            It

        "ja" ->
            Ja

        _ ->
            En
```

^
Next, we'll create a Translations module where we will define...

---
[.code: text-scale(2.0)]

```elm
type Lang
    = En
    | It
    | Ja
```

^
...a union type for the set of available languages, and then...

---
[.code: text-scale(1.5)]

```elm
getLnFromCode : String -> Lang
getLnFromCode code =
    case code of
        "en" ->
            En

        "it" ->
            It

        "ja" ->
            Ja

        _ ->
            En
```

^
...provide a helper function to convert a string language code into a language type.

---
[.code: text-scale(1.5)]

```elm
import Http exposing (Error)
import I18Next exposing (Translations)
import Translations exposing (Lang)


type Msg
    = ChangeLanguage Lang
    | CloseAvailableLanguages
    | FetchTranslations (Result Error Translations)
    | ShowAvailableLanguages
```

^
We'll then add two new messages to our Message union type:

---
[.code: text-scale(1.5)]

```elm, [.highlight: 3, 7]
import Http exposing (Error)
import I18Next exposing (Translations)
import Translations exposing (Lang)


type Msg
    = ChangeLanguage Lang
    | CloseAvailableLanguages
    | FetchTranslations (Result Error Translations)
    | ShowAvailableLanguages
```

^
ChangeLanguage, that takes in one of our languages as its parameter...

---
[.code: text-scale(1.5)]

```elm, [.highlight: 1-2, 9]
import Http exposing (Error)
import I18Next exposing (Translations)
import Translations exposing (Lang)


type Msg
    = ChangeLanguage Lang
    | CloseAvailableLanguages
    | FetchTranslations (Result Error Translations)
    | ShowAvailableLanguages
```

^
...and FetchTranslations, which will hold the result type of attempting to read in the translations for a particular language.

---

```elm
fetchTranslations : Lang -> Cmd Msg
fetchTranslations language =
    language
        |> toTranslationsUrl
        |> I18Next.fetchTranslations FetchTranslations


toTranslationsUrl : Lang -> String
toTranslationsUrl language =
    let
        translationLanguage =
            language
                |> toString
                |> String.toLower
    in
        "/locale/translations." ++ translationLanguage ++ ".json"
```

^
That result is fetched via the fetchTranslations function, which first...

---

```elm, [.highlight: 8-16]
fetchTranslations : Lang -> Cmd Msg
fetchTranslations language =
    language
        |> toTranslationsUrl
        |> I18Next.fetchTranslations FetchTranslations


toTranslationsUrl : Lang -> String
toTranslationsUrl language =
    let
        translationLanguage =
            language
                |> toString
                |> String.toLower
    in
        "/locale/translations." ++ translationLanguage ++ ".json"
```

^
...interpolates the stringified language into the path for a JSON translation file...

---

```elm, [.highlight: 1-5]
fetchTranslations : Lang -> Cmd Msg
fetchTranslations language =
    language
        |> toTranslationsUrl
        |> I18Next.fetchTranslations FetchTranslations


toTranslationsUrl : Lang -> String
toTranslationsUrl language =
    let
        translationLanguage =
            language
                |> toString
                |> String.toLower
    in
        "/locale/translations." ++ translationLanguage ++ ".json"
```

^
...and then calls the I18Next's fetchTranslations function to do the actual fetching work.

---

```elm
fetchTranslations : Lang -> Cmd Msg
fetchTranslations language =
    language
        |> toTranslationsUrl
        |> I18Next.fetchTranslations FetchTranslations


toTranslationsUrl : Lang -> String
toTranslationsUrl language =
    let
        translationLanguage =
            language
                |> toString
                |> String.toLower
    in
        "/locale/translations." ++ translationLanguage ++ ".json"
```

^
Now that we have the ability to fetch translations, we need the app to provide a place to store them, so, back to the model...

---

```elm
import I18Next exposing (Translations)


type alias Model =
    { currentLanguage : Lang
    , showAvailableLanguages : Bool
    , translations : Translations
    }


init : ( Model, Cmd Msg )
init =
    ( { currentLanguage = En
      , showAvailableLanguages = False
      , translations = I18Next.initialTranslations
      }
    , fetchTranslations En
    )
```

^
Here, along with the showAvailableLanguages flag...

---

```elm, [.highlight: 4-8]
import I18Next exposing (Translations)


type alias Model =
    { currentLanguage : Lang
    , showAvailableLanguages : Bool
    , translations : Translations
    }


init : ( Model, Cmd Msg )
init =
    ( { currentLanguage = En
      , showAvailableLanguages = False
      , translations = I18Next.initialTranslations
      }
    , fetchTranslations En
    )
```

^
...we add in a new value to hold the currentLanguage, as well as the translations for that language.

---

```elm, [.highlight: 11-18]
import I18Next exposing (Translations)


type alias Model =
    { currentLanguage : Lang
    , showAvailableLanguages : Bool
    , translations : Translations
    }


init : ( Model, Cmd Msg )
init =
    ( { currentLanguage = En
      , showAvailableLanguages = False
      , translations = I18Next.initialTranslations
      }
    , fetchTranslations En
    )
```

^
...and we'll initialise those values with a default language of English, and a set of initial translations provided by I18Next, which under the hood is an empty dictionary.

---

```elm
import I18Next exposing (Translations)


type alias Model =
    { currentLanguage : Lang
    , showAvailableLanguages : Bool
    , translations : Translations
    }


init : ( Model, Cmd Msg )
init =
    ( { currentLanguage = En
      , showAvailableLanguages = False
      , translations = I18Next.initialTranslations
      }
    , fetchTranslations En
    )
```

^
Now that we have a place for those values, let's allow them to be updated...

---

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- ...
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , fetchTranslations language
            )

        FetchTranslations (Ok translations) ->
            ( { model | translations = translations }, Cmd.none )

        FetchTranslations (Err msg) ->
            ( model, Cmd.none )
```

^
When we change a language...

---

```elm, [.highlight: 5-8]
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- ...
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , fetchTranslations language
            )

        FetchTranslations (Ok translations) ->
            ( { model | translations = translations }, Cmd.none )

        FetchTranslations (Err msg) ->
            ( model, Cmd.none )
```

^
...we set the currentLanguage and fire off the command to fetch that language's translations.

---

```elm, [.highlight: 10-14]
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- ...
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , fetchTranslations language
            )

        FetchTranslations (Ok translations) ->
            ( { model | translations = translations }, Cmd.none )

        FetchTranslations (Err msg) ->
            ( model, Cmd.none )
```

^
Once the translations have been fetched, we store them if the fetch was successful, and for now we'll just hand-wave over any file reading failures.

---
[.slidenumber-style: #FFFFFF]

# [fit] DYNAMIC
# [fit] *Values*

^
At this stage, we're nearly at the expected functionality, but we're still using static values for the language display as well as the available languages list for the menu, so let's change that now.

---

```elm
module Language exposing (availableLanguages, langToString)

import Translations exposing (Lang(En, It, Ja))


availableLanguages : List Lang
availableLanguages =
    [ En, It, Ja ]


langToString : Lang -> String
langToString language =
    case language of
        En ->
            "English"

        It ->
            "Italiano"

        Ja ->
            "日本語"
```

^
First, we will create a Language module that will have some helper functions around generating the string value for a language...

---

```elm, [.highlight: 11-21]
module Language exposing (availableLanguages, langToString)

import Translations exposing (Lang(En, It, Ja))


availableLanguages : List Lang
availableLanguages =
    [ En, It, Ja ]


langToString : Lang -> String
langToString language =
    case language of
        En ->
            "English"

        It ->
            "Italiano"

        Ja ->
            "日本語"
```

^
For example "English" should always be displayed as "English", regardless of what the current language is...

---

```elm, [.highlight: 6-8]
module Language exposing (availableLanguages, langToString)

import Translations exposing (Lang(En, It, Ja))


availableLanguages : List Lang
availableLanguages =
    [ En, It, Ja ]


langToString : Lang -> String
langToString language =
    case language of
        En ->
            "English"

        It ->
            "Italiano"

        Ja ->
            "日本語"
```

^
...and we'll also keeping a static list of available languages in the app to use as a basis when we populate the dropdown menu.<br />
Unfortunately, there is no way to generate a list of type values from a union type (eg [En, It, Ja] from the Lang type), so this has to be a separate definition.

---

```elm
module Language exposing (availableLanguages, langToString)

import Translations exposing (Lang(En, It, Ja))


availableLanguages : List Lang
availableLanguages =
    [ En, It, Ja ]


langToString : Lang -> String
langToString language =
    case language of
        En ->
            "English"

        It ->
            "Italiano"

        Ja ->
            "日本語"
```

^
Now that we have our language data setup, let's go back to the view code and get the page to start displaying it.

---

```elm
module LanguageDropdown exposing (view)

view : Model -> Html Msg
view { currentLanguage, showAvailableLanguages } =
    let
        selectableLanguages =
            Language.availableLanguages
                |> List.filter (\language -> language /= currentLanguage)
    in
        div [ class Styles.dropdownContainer ]
            [ currentSelection currentLanguage showAvailableLanguages
            , dropdownList showAvailableLanguages selectableLanguages
            ]
```

^
First, in the LanguageDropdown module, we'll create a list of...

---

```elm, [.highlight: 6-8]
module LanguageDropdown exposing (view)

view : Model -> Html Msg
view { currentLanguage, showAvailableLanguages } =
    let
        selectableLanguages =
            Language.availableLanguages
                |> List.filter (\language -> language /= currentLanguage)
    in
        div [ class Styles.dropdownContainer ]
            [ currentSelection currentLanguage showAvailableLanguages
            , dropdownList showAvailableLanguages selectableLanguages
            ]
```

^
...selectable languages, which will be the list of availableLanguages that we just created in the Language module, minus the current language

---

```elm, [.highlight: 11-14]
module LanguageDropdown exposing (view)

view : Model -> Html Msg
view { currentLanguage, showAvailableLanguages } =
    let
        selectableLanguages =
            Language.availableLanguages
                |> List.filter (\language -> language /= currentLanguage)
    in
        div [ class Styles.dropdownContainer ]
            [ currentSelection currentLanguage showAvailableLanguages
            , dropdownList showAvailableLanguages selectableLanguages
            ]
```

^
...and we'll give that to the dropdown list function.

---

```elm
currentSelection : Lang -> Bool -> Html Msg
currentSelection currentLanguage showAvailableLanguages =
    p
        [ class (Styles.currentSelection showAvailableLanguages)
        , onClick ShowAvailableLanguages
        ]
        [ span []
            [ text (Language.langToString currentLanguage) ]
        , span [ class Styles.caret ]
            [ text "▾" ]
        ]
```

^
The currentSelection function looks pretty much the same as before except...

---

```elm, [.highlight: 2, 8]
currentSelection : Lang -> Bool -> Html Msg
currentSelection currentLanguage showAvailableLanguages =
    p
        [ class (Styles.currentSelection showAvailableLanguages)
        , onClick ShowAvailableLanguages
        ]
        [ span []
            [ text (Language.langToString currentLanguage) ]
        , span [ class Styles.caret ]
            [ text "▾" ]
        ]
```

^
...we're now receiving the current language as a parameter and displaying it next to the caret, rather than the hard-coded "English" string that we had before.

---

```elm
dropdownList : Bool -> List Lang -> Html Msg
dropdownList showAvailableLanguages selectableLanguages =
    ul [ class (Styles.dropdownList showAvailableLanguages) ]
        (List.map dropdownListItem selectableLanguages)


dropdownListItem : Lang -> Html Msg
dropdownListItem language =
    li
        [ class Styles.dropdownListItem
        , onClick (ChangeLanguage language)
        ]
        [ span []
            [ text (Language.langToString language) ]
        ]
```

^
Similarly, with the code for the dropdown list...

---

```elm, [.highlight: 1-2]
dropdownList : Bool -> List Lang -> Html Msg
dropdownList showAvailableLanguages selectableLanguages =
    ul [ class (Styles.dropdownList showAvailableLanguages) ]
        (List.map dropdownListItem selectableLanguages)


dropdownListItem : Lang -> Html Msg
dropdownListItem language =
    li
        [ class Styles.dropdownListItem
        , onClick (ChangeLanguage language)
        ]
        [ span []
            [ text (Language.langToString language) ]
        ]
```

^
We're now taking in the selectableLanguages as a parameter...

---

```elm, [.highlight: 14]
dropdownList : Bool -> List Lang -> Html Msg
dropdownList showAvailableLanguages selectableLanguages =
    ul [ class (Styles.dropdownList showAvailableLanguages) ]
        (List.map dropdownListItem selectableLanguages)


dropdownListItem : Lang -> Html Msg
dropdownListItem language =
    li
        [ class Styles.dropdownListItem
        , onClick (ChangeLanguage language)
        ]
        [ span []
            [ text (Language.langToString language) ]
        ]
```

^
...and displaying the stringified version of the language in the dropdown list item.


---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/lblajfbfphsq8vu/language-change-on-back-end.png?dl=1)

^
At this point, if you select a new language from the dropdown menu, you will see the current language display change on the menu, and if you open the Elm debugger, you will see that the language of the application is actually changing, and the translations for the language are being loaded into the application.<br />
So, that's all well and good, but now let's get that translated message showing on the page by letting the content know what translations it is supposed to be displaying

---

```elm
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ LanguageDropdown.view
        , content model.translations
        ]


content : Translations -> Html Msg
content translations =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading translations ]
        ]

heading : Translations -> Html Msg
heading translations =
    h1 [ class Styles.heading ]
        [ text (I18Next.t translations "verticallyCenteringInCssIsEasy")]
```

^
Back in the main view...

---

```elm, [.highlight: 5]
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ LanguageDropdown.view
        , content model.translations
        ]


content : Translations -> Html Msg
content translations =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading translations ]
        ]

heading : Translations -> Html Msg
heading translations =
    h1 [ class Styles.heading ]
        [ text (I18Next.t translations "verticallyCenteringInCssIsEasy")]
```

^
...we pass the model translations into the content function...

---

```elm, [.highlight: 5, 10, 13]
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ LanguageDropdown.view
        , content model.translations
        ]


content : Translations -> Html Msg
content translations =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading translations ]
        ]

heading : Translations -> Html Msg
heading translations =
    h1 [ class Styles.heading ]
        [ text (I18Next.t translations "verticallyCenteringInCssIsEasy")]
```

^
...which passes them straight to the heading function...

---

```elm, [.highlight: 5, 10, 13, 17, 19]
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ LanguageDropdown.view
        , content model.translations
        ]


content : Translations -> Html Msg
content translations =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading translations ]
        ]

heading : Translations -> Html Msg
heading translations =
    h1 [ class Styles.heading ]
        [ text (I18Next.t translations "verticallyCenteringInCssIsEasy")]
```

^
...where they are used by the I18Next module to look for the "verticallyCenteringInCssIsEasy" key...

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/gtaonxu7a318tmd/japanese-display.png?dl=1)

^
...and then display on the screen. That covers the main functionality of language switching, but there is still more we can do.

---
[.slidenumber-style: #FFFFFF]

# [fit] DETECT
# [fit] *User Language*

^
Currently, the application language is set to English by default when it starts, but it would be nice if we at least tried to set the application to initially display in the user's preferred language. To simplify the idea of a "preferred language" (because this is not universal amongst browsers), we will consider it to be the language of the browser being used. How do we get that?

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Detect User Language

- **_`navigator.language`_**
- **_`navigator.userLanguage`_** (IE)

^
In Javascript, we can use navigator.language, and navigator.userLanguage, which is IE specific. So, let's grab that information and pass it into Elm as a flag...

---

```js
import "tachyons"
import { Main } from "./Main.elm"

const appContainer = document.getElementById("root")

if (appContainer) {
  Main.embed(appContainer, { language: getLanguage() })
}

function getLanguage() {
  return navigator.language || navigator.userLanguage
}
```

^
In the index.js file where we embed our Elm app...

---

```js, [.highlight: 6-8]
import "tachyons"
import { Main } from "./Main.elm"

const appContainer = document.getElementById("root")

if (appContainer) {
  Main.embed(appContainer, { language: getLanguage() })
}

function getLanguage() {
  return navigator.language || navigator.userLanguage
}
```

^
We pass in a language flag that is the result of calling the getLanguage function...

---

```js, [.highlight: 10-12]
import "tachyons"
import { Main } from "./Main.elm"

const appContainer = document.getElementById("root")

if (appContainer) {
  Main.embed(appContainer, { language: getLanguage() })
}

function getLanguage() {
  return navigator.language || navigator.userLanguage
}
```

^
Which we define here, and we attempt to get the language using the two ways we know how.

---

```js
import "tachyons"
import { Main } from "./Main.elm"

const appContainer = document.getElementById("root")

if (appContainer) {
  Main.embed(appContainer, { language: getLanguage() })
}

function getLanguage() {
  return navigator.language || navigator.userLanguage
}
```

^
Now, to take in this flag, we'll have to go back to our Elm app and add a definition for Flags...

---

```elm
import Json.Decode as Decode exposing (Value)


type alias Flags =
    { language : Value }

```

^
...like this, and because we do not trust any information passed in from Javascript, we will decode the flag to ensure that we are getting a string.

---

```elm
init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        language =
            flags.language
                |> Decode.decodeValue Decode.string
                |> Language.langFromFlag
    in
        ( { currentLanguage = language
          , showAvailableLanguages = False
          , translations = I18Next.initialTranslations
          }
        , Cmd.fetchTranslations language
        )
```

^
This will change the init function slightly, as we'll now take the Flags in as a parameter...

---

```elm, [.highlight: 4-7]
init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        language =
            flags.language
                |> Decode.decodeValue Decode.string
                |> Language.langFromFlag
    in
        ( { currentLanguage = language
          , showAvailableLanguages = False
          , translations = I18Next.initialTranslations
          }
        , Cmd.fetchTranslations language
        )
```

^
...and parse it first through a JSON string decoder, and then through the langFromFlag function...

---

```elm
module Language exposing (..)


langFromFlag : Result String String -> Lang
langFromFlag language =
    case language of
        Ok language ->
            Translations.getLnFromCode language

        Err _ ->
            En
```

^
...which will delegate out to the Translations module to get a Language type, or if there was an issue with the language flag, only then will we default the language to English.

---
[.slidenumber-style: #FFFFFF]
[.header: text-scale(1.4)]

# [fit] STORE
# [fit] *Language Preference*

^
Now, having a default language is nice, but if you switch languages and then refresh the page, the application will revert back to the language set in the browser. Plenty of people want to read content in a different language than their system settings, and it would be nice to be able to save their language preference for this application. So, let’s then use the browser's localStorage to help us do exactly that.

---

```elm
port module Main exposing (..)


port storeLanguageInLocalStorage : String -> Cmd msg


storeLanguage : Lang -> Cmd msg
storeLanguage language =
    language
        |> toString
        |> String.toLower
        |> storeLanguageInLocalStorage
```

^
Sending Elm data to Javscript requires us to use Elm Ports, so that's what we'll do now. Here...

---

```elm, [.highlight: 7-12]
port module Main exposing (..)


port storeLanguageInLocalStorage : String -> Cmd msg


storeLanguage : Lang -> Cmd msg
storeLanguage language =
    language
        |> toString
        |> String.toLower
        |> storeLanguageInLocalStorage
```

^
...we have created a storeLanguage command function that takes in a Lang type, stringifies it, and sends it off to Javascript via the...

---

```elm, [.highlight: 4]
port module Main exposing (..)


port storeLanguageInLocalStorage : String -> Cmd msg


storeLanguage : Lang -> Cmd msg
storeLanguage language =
    language
        |> toString
        |> String.toLower
        |> storeLanguageInLocalStorage
```

^
...storeLanguageInLocalStorage port

---

```js
if (appContainer) {
  const app = Main.embed(appContainer, { language: getLanguage() })

  app.ports.storeLanguageInLocalStorage.subscribe((language) => {
    localStorage.setItem("elm-i18n-example-language", language)
  })
}

function getLanguage() {
  return localStorage.getItem("elm-i18n-example-language") ||
    navigator.language ||
    navigator.userLanguage
}
```

^
On the Javascript side...

---

```js, [.highlight: 4-6]
if (appContainer) {
  const app = Main.embed(appContainer, { language: getLanguage() })

  app.ports.storeLanguageInLocalStorage.subscribe((language) => {
    localStorage.setItem("elm-i18n-example-language", language)
  })
}

function getLanguage() {
  return localStorage.getItem("elm-i18n-example-language") ||
    navigator.language ||
    navigator.userLanguage
}
```

^
...we subscribe to the storeLangugageInLocalStorage port, and store the string that we get passed into localStorage via its setItem function.

---

```js, [.highlight: 9-13]
if (appContainer) {
  const app = Main.embed(appContainer, { language: getLanguage() })

  app.ports.storeLanguageInLocalStorage.subscribe((language) => {
    localStorage.setItem("elm-i18n-example-language", language)
  })
}

function getLanguage() {
  return localStorage.getItem("elm-i18n-example-language") ||
    navigator.language ||
    navigator.userLanguage
}
```

^
While we're here, we can now ensure that the getLanguage function goes and checks localStorage for a preferred language first before checking browser settings when the application first starts.

---

```js
if (appContainer) {
  const app = Main.embed(appContainer, { language: getLanguage() })

  app.ports.storeLanguageInLocalStorage.subscribe((language) => {
    localStorage.setItem("elm-i18n-example-language", language)
  })
}

function getLanguage() {
  return localStorage.getItem("elm-i18n-example-language") ||
    navigator.language ||
    navigator.userLanguage
}
```

^
By the way, there is no particular reason behind the "elm-i18n-example-language" named key; it could have been named anything, but I think it is best to have it as unique as possible, since many different applications will likely be making use of localStorage

---

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- ...
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , Cmd.batch
                [ fetchTranslations language
                , storeLanguage language
                ]
            )
```

^
Okay, we've got the pathway to Javascript set up, now we need to make sure that the command to store the language is run every time the language is changed...

---

```elm, [.highlight: 5-11]
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- ...
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , Cmd.batch
                [ fetchTranslations language
                , storeLanguage language
                ]
            )
```

^
...(ie the ChangeLanguage message is sent), so we make that addition in the update function to say that when the language is changed, fire off two commands, one to fetch the translations, and one to store the selected language in localStorage.

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/xf1d9samofpki37/language-stored.png?dl=1)

^
Now, you should be able to switch languages, and have it stored in localStorage. Open up the Javascript console in your browser's developer tools to confirm this with the localStorage.getItem() command.

---
[.slidenumber-style: #FFFFFF]
[.header: text-scale(5.0)]

# :+1:

^
Okay, awesome! We're pretty much feature complete.

---
[.slidenumber-style: #FFFFFF]

# [fit] LINGERING
# [fit] *Issues*

^
However, there are still a few potential issues that would be worthy of a bit more investigation.

---
[.header: text-scale(2.0)]
[.text: text-scale(1.10)]

# [fit] Lingering Issues

- Translation key visible on refresh

^
If you refresh the page, you may see the translation key "verticallyCenteringInCssIsEasy" briefly flash before the translation is shown.

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/equhawf4pclwbrw/refresh-issue.gif?dl=1)

^
This is particularly noticeable on the Japanese translation. Perhaps the translations are being loaded too slowly...?

---
[.header: text-scale(2.0)]
[.text: text-scale(1.10)]

# [fit] Lingering Issues

- Translation key visible on refresh
- **_`I18Next.t translations "thisKeyDoesNotExist"`_**

^
If you accidentally make a typo when requesting a translation by key in a view (like "thisKeyDoesNotExist"), then no error is raised: the key is simply displayed on the page, which may not be what you want

---

[.header: text-scale(2.0)]
[.text: text-scale(1.10)]

# [fit] Lingering Issues

- Translation key visible on refresh
- **_`I18Next.t translations "thisKeyDoesNotExist"`_**
- Missed translations and typos ignored

^
If you accidentally do not provide a translation for a particular key for a known available language, or make a typo in the translation file (eg delete the translations.ja.json file or change its key name), then, again, no error is raised, and the requested key is displayed on the page as-is.<br />
Elm programmers are spoiled by the Elm compiler always looking over our shoulder and helping us avoid these kinds of mistakes. If you are confident about manually handling the issues outlined or they are not important to you, then all is good and you need not go any further. But, if want Elm to cast more of an eye over your i18n development, what options are available to you?

---
[.slidenumber-style: #FFFFFF]

# [fit] TYPE-SAFE
# [fit] *Translations*

^
Glad you asked! Since we have our translation files as JSON, we can use...

---
[.slidenumber-style: #FFFFFF]

# [fit] `npm install -g elm-i18n-gen`

^
...a package called Elm i18n Gen to generate a Translations module containing one function for every translation in the JSON files. You install it via npm as you can see here...

---
[.slidenumber-style: #FFFFFF]

# [fit] `elm-i18n-gen public/locale src/Translations.elm`

^
...and you can generate a new Translations module for the app with the following command, that will contain the following functions...

---

```elm
module Translations exposing (..)

-- ...

verticallyCenteringInCssIsEasy : Lang -> String
verticallyCenteringInCssIsEasy lang =
    case lang of
        En ->
            "Vertically centering things in css is easy!"

        It ->
            "Centrare verticalmente con css è facile!"

        Ja ->
            "CSSで垂直センタリングは簡単だよ！"
```

^
We only have one translation key in our JSON files, so elm-i18n-gen created just one function for us that covers translations for all our languages. The full module looks like this...

---

```elm
module Translations exposing (..)


type Lang
    = En
    | It
    | Ja


getLnFromCode : String -> Lang
getLnFromCode code =
    -- ...


verticallyCenteringInCssIsEasy : Lang -> String
verticallyCenteringInCssIsEasy lang =
    case lang of
        En ->
            "Vertically centering things in css is easy!"

        It ->
            "Centrare verticalmente con css è facile!"

        Ja ->
            "CSSで垂直センタリングは簡単だよ！"
```

^
...including a Lang type and a getLnFromCode function, which is why I adopted the sort-of-awkward naming conventions in advance.<br />
Anyway, now that we have our function, let’s use it in the view:

---

```elm
view : Model -> Html Msg
view model =
    -- ...

content : Translations -> Html Msg
content translations =
    -- ...

heading : Translations -> Html Msg
heading translations =
    h1 [ class Styles.heading ]
        [ text (I18Next.t translations "verticallyCenteringInCssIsEasy")]
```

^
We go from using I18Next and a set of translations...

---

```elm
view : Model -> Html Msg
view model =
    -- ...

content : Lang -> Html Msg
content language =
    -- ...

heading : Lang -> Html Msg
heading language =
    h1 [ class Styles.heading ]
        [ text (Translations.verticallyCenteringInCssIsEasy language) ]
```

^
...to using a simple function, and passing in the language to switch on. The effects of this one change mean that...

---
[.header: text-scale(1.8)]
[.text: text-scale(1.2)]

# [fit] Type-Safe Translations

- No need to fetch translations

^
There is now no need to fetch any translations, and consequently the FetchTranslations Msg, the fetchTranslations function, the translations entry in the Model, and any trace of the I18Next and Http packages, can now be safely removed

---
[.header: text-scale(1.8)]
[.text: text-scale(1.2)]

# [fit] Type-Safe Translations

- No need to fetch translations
- No translation key visible

^
The issue of a translation key displaying before the translation is loaded has consequently gone away since we are now just calling a function

---
[.header: text-scale(1.8)]
[.text: text-scale(1.2)]

# [fit] Type-Safe Translations

- No need to fetch translations
- No translation key visible
- Compiler errors if translation not provided

^
Elm will raise a compiler error if a translation is not provided for all languages. Those are some pretty good benefits! I'm not sure about any downsides to this, aside from maybe having a single module with potentially hundreds of functions in it for any given large JSON translation file. But, I would guess the overhead for maintainability of that module would be the same for the JSON file that it is derived from.

---
[.slidenumber-style: #FFFFFF]

# [fit] CONCLUSION

---

![70%](https://www.dropbox.com/s/kdgb81yii0vmqh7/thinkception.png?dl=1)

^
Even after all this, I'm still not really sure what to think when it comes to an ideal solution for I18n in Elm, but I'm planning on continuing to use these methods for the time being...

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/54w4rydk19ff20c/elm-i18n-runtime-pr.png?dl=1)

^
...or at least until the elm-i18n package merges the currently open PR for runtime language switching.

---
[.header: text-scale(2.0)]
[.text: text-scale(0.9)]

# Links

- `https://github.com/paulfioravanti/elm-i18n-example`
- `https://paulfioravanti.com/blog/2018/05/11/runtime-language-switching-in-elm/`

^
The code for the example app in this talk is located in my Github repo, so if you would like to take a closer look at this example, it's there for the taking. I also wrote a blog post about this very topic which I re-purposed for this talk, so if you want more information and the ability to go through all this at your own pace, please go and check it out.

---
[.slidenumbers: false]
[.hide-footer]

![right](https://www.dropbox.com/s/5w770gu31uw33l9/nekobus_headshot.jpeg?dl=1)

# [fit] Thanks!
# [fit] **_`@paulfioravanti`_**
