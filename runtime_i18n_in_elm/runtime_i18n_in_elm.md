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
I'd like to use the Full Screen Centered Title component documentation page from Tachyons' website as a base and take it from this, to...

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
On the back end, we provide some translations for the page in JSON format, and allow the dropdown menu to switch the language.

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# Back End

- Provide translations in JSON
- Store selected language in **_`localStorage`_**

^
Store the selected language in localStorage so that any selected language persists through page refreshes and different sessions.

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# Back End

- Provide translations in JSON
- Store selected language in **_`localStorage`_**
- Explore type safety options

^
And later on, explore generating Elm modules from the JSON translation files in order to give the translations some type safety

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/l2irsat3sbow78d/Tachyons-full-screen-component-documentation.png?dl=1)

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

---
[.slidenumber-style: #FFFFFF]

# [fit] Language
# [fit] Dropdown

^
From here, let's add a language dropdown.

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Language Dropdown

- Show current language on menu

^
The current language should be shown on the menu by default

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Language Dropdown

- Show current language on menu
- Reveal available languages

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Language Dropdown

- Show current language on menu
- Reveal available languages
- Change language

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

---

```elm
import LanguageDropdown


view : Model -> Html Msg
view model =
    main_ [ class Styles.main_ ]
        [ LanguageDropdown.view
        , content
        ]
```

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/x1p8k83m0fatv34/menu-with-current-selection.png?dl=1)

^
The "menu" here (yes, it is currently just a p tag), currently does nothing, but we can at least confirm that it looks like it is in a good spot on the page. Now, let's actually give it a dropdownList under the currentSelection.

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

---
[.slidenumbers: false]
[.hide-footer]

![fit](https://www.dropbox.com/s/egb6vlob8mxolx2/menu-with-open-selection.png?dl=1)

---
[.slidenumber-style: #FFFFFF]

# [fit] Show/Hide
# [fit] *Available Languages*

---
[.header: text-scale(1.5)]
[.text: text-scale(1.25)]

# [fit] Show/Hide Available Languages

- Flag to **_`showAvailableLanguages`_** in model

---
[.header: text-scale(1.5)]
[.text: text-scale(1.25)]

# [fit] Show/Hide Available Languages

- Flag to **_`showAvailableLanguages`_** in model
- Toggle dropdown list visibility (**_`ShowAvailableLanguages`_**)

---
[.header: text-scale(2.0)]
[.text: text-scale(1.25)]

# [fit] Show/Hide Available Languages

- Flag to **_`showAvailableLanguages`_** in model
- Toggle dropdown list visibility (**_`ShowAvailableLanguages`_**)
- Hide dropdown list on blur (**_`CloseAvailableLanguages`_**)

---

```elm
module Model exposing (Model, init)

import Msg exposing (Msg)


type alias Model =
    { showAvailableLanguages : Bool }


init : ( Model, Cmd Msg )
init =
    ( { showAvailableLanguages = False }, Cmd.none )
```

---

```elm
module Msg exposing (Msg(..))


type Msg
    = CloseAvailableLanguages
    | ShowAvailableLanguages
```

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

---

```elm
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

---
[.slidenumber-style: #FFFFFF]

# [fit] Subscribe to
# [fit] *Mouse Clicks*

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

---
[.slidenumber-style: #FFFFFF]

# [fit] *Language*
# [fit] Switching

---

# `elm-i18next`

```sh
elm-package install -y ChristophP/elm-i18next
elm-package install -y elm-lang/http
```

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

---

```elm
module Msg exposing (Msg(..))

import Http exposing (Error)
import I18Next exposing (Translations)
import Translations exposing (Lang)


type Msg
    = ChangeLanguage Lang
    | CloseAvailableLanguages
    | FetchTranslations (Result Error Translations)
    | ShowAvailableLanguages
```

---

```elm
module Cmd exposing (fetchTranslations)

import I18Next
import Msg exposing (Msg(FetchTranslations))
import Translations exposing (Lang)


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

---

```elm, [.highlight: 8-12]
module Cmd exposing (fetchTranslations)

import I18Next
import Msg exposing (Msg(FetchTranslations))
import Translations exposing (Lang)


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

---

```elm, [.highlight: 15-23]
module Cmd exposing (fetchTranslations)

import I18Next
import Msg exposing (Msg(FetchTranslations))
import Translations exposing (Lang)


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

---

```elm
module Cmd exposing (fetchTranslations)

import I18Next
import Msg exposing (Msg(FetchTranslations))
import Translations exposing (Lang)


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

---

```elm
module Model exposing (Model, init)

import Cmd
import I18Next exposing (Translations)
import Msg exposing (Msg)
import Translations exposing (Lang(En))


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
    , Cmd.fetchTranslations En
    )
```

---

```elm
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- ...
        ChangeLanguage language ->
            ( { model | currentLanguage = language }
            , Cmd.fetchTranslations language
            )

        FetchTranslations (Ok translations) ->
            ( { model | translations = translations }, Cmd.none )

        FetchTranslations (Err msg) ->
            ( model, Cmd.none )
```

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
