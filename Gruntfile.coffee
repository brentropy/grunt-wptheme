module.exports = (grunt) ->

  # Congifutation
  grunt.initConfig
    coffee:
      compile:
        files: [
          expand: true
          cwd: "src/"
          src: ["**/*.coffee"]
          ext: ".js"
        ]
    coffeelint:
      src: ["src/**/*.coffee"]
      options: grunt.file.readJSON 'coffeelint.json'
    watch:
      src:
        files: "src/**/*.coffee"
        tasks: ["coffeelint", "coffee"]
        options:
          atBegin: true

  # Load tasks
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"

  # Define tasks
  grunt.registerTask "default", ["watch:src"]

