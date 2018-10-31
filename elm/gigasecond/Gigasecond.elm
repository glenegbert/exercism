module Gigasecond exposing (add)

import Time exposing(..)
import Iso8601

add : Time.Posix -> Time.Posix
add =
  let
    gigasecondInMillis = 10^12
  in
    posixToMillis >> (+) gigasecondInMillis >> millisToPosix


