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
       reduce (nextNumber num) + 1


nextNumber : Int -> Int
nextNumber num =
  if isEven num then
    (3 * num) + 1
  else
    num // 2


isEven : Int -> Bool
isEven num =
  modBy 2 num == 1
