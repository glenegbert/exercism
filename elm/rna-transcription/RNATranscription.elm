module RNATranscription exposing (toRNA)
import Dict

toRNA : String -> Result String String
toRNA dna =
  List.map toR (String.toList dna) |>
  List.foldr (Result.map2 (String.append)) (Result.Ok "")

toR : Char -> Result String String
toR c =
 (Result.map String.fromChar) <|  Result.fromMaybe "error" <| (Dict.get c dToR)

dToR : Dict.Dict Char Char
dToR =
  Dict.fromList [ ('C','G')
                , ('G','C')
                , ('T','A')
                , ('A','U')]

