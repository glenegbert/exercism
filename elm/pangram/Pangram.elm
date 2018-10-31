module Pangram exposing (..)
import Regex
import Char

isPangram word =
  let value =
    charsOnly word |>
    wordToLower |>
    uniq |>
    String.length
  in
    if value == 26 then
      True
    else
      False

toCode: String -> (List Char.KeyCode)
toCode word =
  String.toList word |>
  List.map Char.toCode


uniq: String -> String
uniq word =
  String.foldr (\c s ->
          if String.contains (String.fromChar c) s then
            s
          else
            String.cons c s
            )
         ""
         word


wordToLower: String -> String
wordToLower word =
  String.map Char.toLower word


charsOnly: String -> String
charsOnly input =
    Regex.replace Regex.All (Regex.regex "[^A-Za-z]") (\_ -> "") input

