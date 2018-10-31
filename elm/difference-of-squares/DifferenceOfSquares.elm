module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


squareOfSum : Int -> Int
squareOfSum =
 flip (List.range 1 >> List.sum >> (^)) 2

sumOfSquares : Int -> Int
sumOfSquares  =
  List.range 1 >> List.map (flip (^) 2) >> List.sum

difference : Int -> Int
difference n =
  squareOfSum n - sumOfSquares n
