module Triangle exposing (Triangle(..), triangleKind, version)
import Set exposing (..)

type Triangle
    = Equilateral
    | Isosceles
    | Scalene


version : Int
version =
    2


triangleKind : comparable -> comparable -> comparable ->  Result String Triangle
triangleKind x y z =
  if invalidLengths x y z then
    Err "Invalid lengths"
  else if violatesInequality x y z then
    Err "Violates inequality"
  else
    triangleType x y z


violatesInequality x y z =
  let
    sorted = List.sort [x,y,z]
  in
    List.sum (List.take 2 sorted) < (Maybe.withDefault 0 (List.maximum sorted))


invalidLengths : comparable -> comparable -> comparable -> Bool
invalidLengths x y z =
  List.any (\n -> n <= 0) [x,y,z]

triangleType : comparable -> comparable -> comparable -> Result String Triangle
triangleType x y z =
  let
    uniqValues = Set.fromList([x,y,z])
    uniqValuesLength = Set.size uniqValues
  in
    if uniqValuesLength == 1 then
      Ok Equilateral
    else if uniqValuesLength == 2 then
      Ok Isosceles
    else
      Ok Scalene


