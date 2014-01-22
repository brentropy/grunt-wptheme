createHeader = require "../lib/header"

# Grunt plugin for generating a WordPress theme style.css file from a json
# config file.
#
# @param [Object] grunt
#
module.exports = (grunt) ->

  # Register task
  grunt.registerTask "wptheme", ->

    # Get theme configuration
    themeFile = grunt.config.get("themeFile") ? "theme.json"
    themeData = grunt.file.readJSON themeFile

    # Build style.css
    contents = createHeader themeData

    # Append stylesheets files
    for file in grunt.file.expand themeData.css
      buf = grunt.file.read file
      contents += "\n\n/* #{file} */\n#{buf}"

    # Write the file
    grunt.file.write "style.css", contents + "\n"

