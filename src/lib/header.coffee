mapping = require "./mapping"

# Builds a WordPress stylesheet header from an object.
#
# @param  [Object] data
# @return [String]
#
module.exports = (data = {}) ->

  lines = ["/*"]

  for key, val of data
    if mapping[key]?
      val = val.join ", " if Array.isArray val
      lines.push "#{mapping[key]}: #{val}"

  lines.push "*/"
  lines.join "\n"

