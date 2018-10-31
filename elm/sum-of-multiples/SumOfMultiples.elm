module SumOfMultiples exposing (sumOfMultiples)
import Set

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples limit =
    Set.foldr (+) 0
   <| Set.fromList
   <| List.concat
   <| List.map (fromMultiple limit) multiples

fromMultiple : Int -> Int -> List Int
fromMultiple limit mult =
  let
      rang = List.range 1 <| (limit-1) // mult
  in
     List.map (\n -> n * mult) rang

