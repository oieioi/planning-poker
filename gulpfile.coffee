gulp     = require 'gulp'
coffee   = require 'gulp-coffee'
watchify = require 'gulp-watchify'
rename   = require 'gulp-rename'

gulp.task 'default', ['build', 'browserify']

gulp.task 'build', [
  'build:coffee'
]

gulp.task 'build:coffee', ->
  gulp.src './client/src/**/*.coffee'
    .pipe coffee()
    .pipe gulp.dest './build/javascript'

watching = false
gulp.task 'enable-watch-mode', -> watching = true

gulp.task 'browserify', watchify (watchify) ->
  gulp.src './build/javascript/components/app.js'
    .pipe watchify
      watch: watching
      transform: [
        'react-jade'
      ]
    .pipe rename 'application.js'
    .pipe gulp.dest './public/javascript'

gulp.task 'watchify', ['enable-watch-mode', 'browserify']
gulp.task 'watch', ['build', 'watchify'], ->
  gulp.watch './client/src/**/*.coffee', ['build:coffee']

