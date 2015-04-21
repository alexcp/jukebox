Array::contains = (needle) ->
  for i of this
    `i = i`
    if @[i] == needle
      return true
  false
