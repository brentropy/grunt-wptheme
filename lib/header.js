(function() {
  var mapping;

  mapping = require("./mapping");

  module.exports = function(data) {
    var key, lines, val;
    if (data == null) {
      data = {};
    }
    lines = ["/*"];
    for (key in data) {
      val = data[key];
      if (mapping[key] != null) {
        if (Array.isArray(val)) {
          val = val.join(", ");
        }
        lines.push("" + mapping[key] + ": " + val);
      }
    }
    lines.push("*/");
    return lines.join("\n");
  };

}).call(this);
