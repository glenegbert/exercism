module ScrabbleScore exposing (scoreWord)
import Dict

scoreWord : String -> Int
scoreWord string =
  string
    |> String.toUpper
    |> String.toList
    |> List.map charParser
    |> List.foldr (+) (0)


charParser: Char -> Int
charParser char =
  (Dict.get char valueMap)
    |> Maybe.withDefault 0


valueMap: Dict.Dict Char Int
valueMap =
  Dict.fromList [ ('A', 1)
                , ('E', 1)
                , ('I', 1)
                , ('O', 1)
                , ('U', 1)
                , ('L', 1)
                , ('N', 1)
                , ('R', 1)
                , ('S', 1)
                , ('T', 1)
                , ('T', 1)
                , ('G', 2)
                , ('D', 2)
                , ('B', 3)
                , ('C', 3)
                , ('M', 3)
                , ('P', 3)
                , ('F', 4)
                , ('H', 4)
                , ('V', 4)
                , ('W', 4)
                , ('Y', 4)
                , ('K', 5)
                , ('J', 8)
                , ('X', 8)
                , ('Q', 10)
                , ('Z', 10)
                ]


