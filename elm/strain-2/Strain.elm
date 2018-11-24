module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    case list of
        x :: xs ->
            let
                nextKeepers =
                    keep predicate xs
            in
            if predicate x then
                x :: nextKeepers

            else
                nextKeepers

        _ ->
            []


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    keep (not << predicate) list
