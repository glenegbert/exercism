module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
    List.filter (isAnagram word) candidates


isAnagram : String -> String -> Bool
isAnagram word1 word2 =
  let
      w1 = String.toLower word1
      w2 = String.toLower word2
  in
    if w1 == w2 then
      False
    else
      sortedChars w1 == sortedChars w2


sortedChars : String -> List Char
sortedChars string =
  List.sort (String.toList string)
