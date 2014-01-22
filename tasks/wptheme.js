(function() {
  var createHeader;

  createHeader = require("../lib/header");

  module.exports = function(grunt) {
    return grunt.registerTask("wptheme", function() {
      var buf, contents, file, themeData, themeFile, _i, _len, _ref, _ref1;
      themeFile = (_ref = grunt.config.get("themeFile")) != null ? _ref : "theme.json";
      themeData = grunt.file.readJSON(themeFile);
      contents = createHeader(themeData);
      _ref1 = grunt.file.expand(themeData.css);
      for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
        file = _ref1[_i];
        buf = grunt.file.read(file);
        contents += "\n\n/* " + file + " */\n" + buf;
      }
      return grunt.file.write("style.css", contents + "\n");
    });
  };

}).call(this);
