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
Behind the scenes..., we have a view function that contains the page content..

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

# [fit] Language
# [fit] Dropdown

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
...and place it above the content

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/x1p8k83m0fatv34/menu-with-current-selection.png?dl=1)

^
The p-tag "menu" here currently does nothing, but we can at least confirm that it looks like it is in a good spot on the page.

---
[.slidenumber-style: #FFFFFF]

# [fit] Language Dropdown
# [fit] *List*

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

# [fit] Show/Hide
# [fit] *Available Languages*

^
Show and hide the available languages as the menu opens that closes. What that is going to entail is...

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
...in the view we'll pass the value of the showAvailableLanguages flag into our other functions.

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
...displayClasses being created as a separate list of either display as flex column or "display none" ("dn")

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
Right, so now we have our menu display down, in order to get some interactivity, we need to be able to...

---
[.slidenumber-style: #FFFFFF]

# [fit] Subscribe to
# [fit] *Mouse Clicks*

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
[.slidenumber-style: #FFFFFF]

# [fit] *Language*
# [fit] Switching

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
...the type for a language, and then...

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
...provide a helper function to convert a string language code into a language.

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
import I18Next


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

```elm, [.highlight: 11-19]
import I18Next


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

```elm, [.highlight: 4-8]
import I18Next


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
...and then calls the I18Next's fetchTranslations function to do the actual fetchhing work.

---

```elm
import I18Next


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

---

```elm
view : Model -> Html Msg
view { currentLanguage, showAvailableLanguages } =
    let
        selectableLanguages =
            List.filter
                (\language -> language /= currentLanguage)
                Language.availableLanguages
    in
        div [ class Styles.dropdownContainer ]
            [ currentSelection currentLanguage showAvailableLanguages
            , dropdownList showAvailableLanguages selectableLanguages
            ]
```

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

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/2hhdtblb3slepie/dropdown-open-close.gif?dl=1)

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/lblajfbfphsq8vu/language-change-on-back-end.png?dl=1)

---

```elm
import Translations exposing (Lang)


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

---
[.slidenumber-style: #FFFFFF]

# [fit] Detect
# [fit] *User Language*

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Detect User Language

- **_`navigator.language`_**
- **_`navigator.userLanguage`_** (IE)

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

---

```elm
module Model exposing (Flags, Model, init)

import Json.Decode as Decode exposing (Value)


type alias Flags =
    { language : Value }

```

---

```elm
module Model exposing (Flags, Model, init)

import Language


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

---

```elm
module Language exposing (availableLanguages, langFromFlag, langToString)


langFromFlag : Result String String -> Lang
langFromFlag language =
    case language of
        Ok language ->
            Translations.getLnFromCode language

        Err _ ->
            En
```

---
[.slidenumber-style: #FFFFFF]
[.header: text-scale(1.4)]

# [fit] Store
# [fit] *Language Preference*

---

```elm
port module Cmd exposing (fetchTranslations, storeLanguage)


port storeLanguageInLocalStorage : String -> Cmd msg


storeLanguage : Lang -> Cmd msg
storeLanguage language =
    language
        |> toString
        |> String.toLower
        |> storeLanguageInLocalStorage
```

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

---

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , Cmd.batch
                [ Cmd.fetchTranslations language
                , Cmd.storeLanguage language
                ]
            )
```

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/xf1d9samofpki37/language-stored.png?dl=1)

---
[.slidenumber-style: #FFFFFF]

# [fit] Lingering
# [fit] *Issues*

---
[.header: text-scale(2.0)]
[.text: text-scale(1.10)]

# [fit] Lingering Issues

- Translation key visible on refresh

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/equhawf4pclwbrw/refresh-issue.gif?dl=1)

---
[.header: text-scale(2.0)]
[.text: text-scale(1.10)]

# [fit] Lingering Issues

- Translation key visible on refresh
- **_`I18Next.t translations "thisKeyDoesNotExist"`_**

---

[.header: text-scale(2.0)]
[.text: text-scale(1.10)]

# [fit] Lingering Issues

- Translation key visible on refresh
- **_`I18Next.t translations "thisKeyDoesNotExist"`_**
- Missed translations and typos ignored

---
[.slidenumber-style: #FFFFFF]

# [fit] Type-Safe
# [fit] *Translations*

---
[.slidenumber-style: #FFFFFF]

# [fit] `npm install -g elm-i18n-gen`

---
[.slidenumber-style: #FFFFFF]

# [fit] `elm-i18n-gen public/locale src/Translations.elm`

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

---

```elm
view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ LanguageDropdown.view
        , content model.currentLanguage
        ]


content : Lang -> Html Msg
content language =
    article [ class Styles.article ]
        [ div [ class Styles.articleContainer ]
            [ heading language ]
        ]

heading : Lang -> Html Msg
heading language =
    h1 [ class Styles.heading ]
        [ text (Translations.verticallyCenteringInCssIsEasy language) ]
```

---
[.header: text-scale(1.8)]
[.text: text-scale(1.2)]

# [fit] Type-Safe Translations

- No need to fetch translations

---
[.header: text-scale(1.8)]
[.text: text-scale(1.2)]

# [fit] Type-Safe Translations

- No need to fetch translations
- No translation key visible

---
[.header: text-scale(1.8)]
[.text: text-scale(1.2)]

# [fit] Type-Safe Translations

- No need to fetch translations
- No translation key visible
- Compiler errors if translation not provided

---
[.slidenumber-style: #FFFFFF]

# [fit] Conclusion

---

![70%](https://www.dropbox.com/s/kdgb81yii0vmqh7/thinkception.png?dl=1)

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/54w4rydk19ff20c/elm-i18n-runtime-pr.png?dl=1)

---
[.header: text-scale(2.0)]
[.text: text-scale(0.9)]

# Links

- `https://github.com/paulfioravanti/elm-i18n-example`
- `https://paulfioravanti.com/blog/2018/05/11/runtime-language-switching-in-elm/`

---
[.slidenumbers: false]
[.hide-footer]

![right](https://www.dropbox.com/s/5w770gu31uw33l9/nekobus_headshot.jpeg?dl=1)

# [fit] Thanks!
# [fit] **_`@paulfioravanti`_**
