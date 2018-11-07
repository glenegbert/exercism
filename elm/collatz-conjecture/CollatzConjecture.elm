module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
        if start <= 0 then
          Err "Only positive numbers are allowed"
        else
          Ok <| reduce start

reduce : Int -> Int
reduce num =
   case num of
     1 ->
       0
     _ ->
       (reduce <| nextNumber num) + 1


nextNumber : Int -> Int
nextNumber num =
  if isOdd num then
    (3 * num) + 1
  else
    num // 2


isOdd : Int -> Bool
isOdd num =
  modBy 2 num == 1
