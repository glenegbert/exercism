module Triangle exposing (rows)


rows : Int -> List (List Int)
rows nu =
  if nu <= 0 then
    []
  else
    scanL nextValues [1] (List.repeat (nu - 1) 0)

nextValues : Int -> List Int -> List Int
nextValues start list =
  case list of
    nextStart::rest ->
      List.append [start + nextStart] (nextValues nextStart rest)
    [] ->
      [start]


scanL : (a -> b -> b) -> b -> List a -> List b
scanL fn b =
      let
          scan a bs =
            case bs of
              hd :: tl ->
                fn a hd :: bs
              _ ->
                []
      in
            List.foldl scan [b] >> List.reverse

{- scanL : (a-> b-> b) -> b -> List a -> List b
scanL f accum list =
  case list of
    [] ->
     [accum]

    x::xs ->
          let result =
                (f x accum)
              nextResult =
                case xs of
                  [] ->
                    []
                  _ ->
                    (scanL f result xs)
              results =
                  List.append [result] nextResult
          in
              results -}


