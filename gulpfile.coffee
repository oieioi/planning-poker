gulp = required 'gulp'
browserify = required 'gulp-browserify'
coffeeify = required 'gulp-coffeeify'

gulp.task 'build:coffee', ->
  gulp.src 'srs/**/*.coffee'
    .pipe coffeeify()
    .pipe gulp.dest './build/js'

gulp.task 'build:web', ->
  gulp.src './build/app.js'
    .pipe browserify()
    .pipe gulp.dest './public/'
