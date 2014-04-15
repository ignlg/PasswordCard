module.exports = (grunt) ->
  grunt.initConfig

    coffee:
      development:
        files:
          "lib/PasswordCard.js": [
            "lib/PasswordCard.coffee"
          ]
    coffeelint:
      lib:
        files: [
          cwd: ""
          src: [
            "Gruntfile.coffee"
            "lib/PasswordCard.coffee"
            #"!node_modules/**"
          ]
        ]
        options:
          indentation:
            value: 2
          arrow_spacing:
            level: "warn"
          colon_assignment_spacing:
            spacing:
              left: 0
              right: 1
            level: "warn"
          cyclomatic_complexity:
            level: "warn"
          no_empty_param_list:
            level: "warn"
          space_operators:
            level: "warn"
    watch:
      src:
        files: ['Gruntfile.coffee', 'lib/*.coffee', 'examples/**/*.coffee']
        tasks: ['default']

  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "lint", ["coffeelint:lib"]
  grunt.registerTask "default", ["coffeelint:lib", "coffee:development"]
