module TwelveDays exposing (..)
import Dict exposing(..)

recite:  Int -> Int -> List String
recite firstVerseNumber lastVerseNumber =
  List.range firstVerseNumber lastVerseNumber |>
  List.map verse

verse: Int -> String
verse num =
  firstPart num ++ secondPart num


secondPart: Int -> String
secondPart num =
  if num == 1 then
    "a Partridge in a Pear Tree."
  else
    String.join ", "
    <| List.reverse
    <| List.take num
    <| Dict.values intSecondPart


firstPart: Int -> String
firstPart num =
  "On the " ++
  Maybe.withDefault " " (Dict.get num intOrdinal) ++
  " day of Christmas my true love gave to me, "


intSecondPart: Dict number String
intSecondPart =
  Dict.fromList [(1,"and a Partridge in a Pear Tree."),
                 (2,"two Turtle Doves"),
                 (3,"three French Hens"),
                 (4,"four Calling Birds"),
                 (5,"five Gold Rings"),
                 (6,"six Geese-a-Laying")]


intOrdinal: Dict number String
intOrdinal =
  Dict.fromList [(1,"first"),
                 (2,"second"),
                 (3,"third"),
                 (4,"fourth"),
                 (5,"fifth"),
                 (6,"sixth")]
