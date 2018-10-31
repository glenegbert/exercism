module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
  List.foldr (conditionalCons predicate) [] list

discard : (a -> Bool) -> List a -> List a
discard predicate list =
  keep (not << predicate) list

conditionalCons : (a -> Bool) -> a -> List a -> List a
conditionalCons pred a list =
  if pred a then
    a :: list
  else
    list

{- For next time, make it work without using foldr -}


