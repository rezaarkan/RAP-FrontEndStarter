mkdir app\fonts
mkdir app\js
mkdir app\css
mkdir app\assets
mkdir src\js
mkdir src\sass
mkdir src\sass\mixins
mkdir src\sass\modules
mkdir src\sass\vendor
mkdir src\sass\partials
mkdir bower_components
mkdir node_modules

echo { >package.json
echo   "name": "RAP-FrontEndStarter", >>package.json
echo   "version": "0.0.1", >>package.json
echo   "description": "", >>package.json
echo   "main": "index.js", >>package.json
echo   "scripts": { >>package.json
echo     "test": "echo \"Error: no test specified\" && exit 1" >>package.json
echo   }, >>package.json
echo   "author": "Reza Arkan Partadiredja", >>package.json
echo   "license": "ISC", >>package.json
echo   "devDependencies": { >>package.json
echo     "bower-files": "*", >>package.json
echo     "gulp": "*", >>package.json
echo     "gulp-util": "*", >>package.json
echo     "gulp-concat": "*", >>package.json
echo     "gulp-uglify": "*", >>package.json
echo     "gulp-rename": "*", >>package.json
echo     "gulp-bower": "*", >>package.json
echo     "gulp-notify": "*", >>package.json
echo     "gulp-ruby-sass": "*" >>package.json
echo   } >>package.json
echo } >>package.json

echo { >bower.json
echo   "name": "RAP-FrontEndStarter", >>bower.json
echo   "version": "0.0.1", >>bower.json
echo   "authors": [ >>bower.json
echo     "Reza Arkan Partadiredja" >>bower.json
echo   ], >>bower.json
echo   "license": "MIT", >>bower.json
echo   "ignore": [ >>bower.json
echo     "**/.*", >>bower.json
echo     "node_modules", >>bower.json
echo     "bower_components", >>bower.json
echo     "test", >>bower.json
echo     "tests" >>bower.json
echo   ], >>bower.json
echo   "dependencies": { >>bower.json
echo    "bootstrap-sass": null, >>bower.json
echo    "fontawesome": null >>bower.json
echo  } >>bower.json
echo } >>bower.json

echo var gulp = require('gulp'), >gulpfile.js
echo 	sass = require('gulp-ruby-sass'), >>gulpfile.js
echo 	notify = require('gulp-notify'), >>gulpfile.js
echo 	rename = require('gulp-rename'), >>gulpfile.js
echo 	concat = require('gulp-concat'), >>gulpfile.js
echo 	uglify = require('gulp-uglify'), >>gulpfile.js
echo 	bower = require('gulp-bower'); >>gulpfile.js

echo var lib = require('bower-files')(); >>gulpfile.js

echo var config = { >>gulpfile.js
echo 	sassPath: './src/sass', >>gulpfile.js
echo 	bowerDir: './bower_components' >>gulpfile.js
echo } >>gulpfile.js

echo gulp.task('bower', function() { >>gulpfile.js
echo 	return bower() >>gulpfile.js
echo 		.pipe(gulp.dest(config.bowerDir)); >>gulpfile.js
echo }); >>gulpfile.js

echo gulp.task('icons', function() { >>gulpfile.js
echo 	return gulp.src([config.bowerDir + '/fontawesome/fonts/**.*', >>gulpfile.js
echo 		config.bowerDir + '/bootstrap-sass/assets/fonts/bootstrap/**.*']) >>gulpfile.js
echo 		.pipe(gulp.dest('./app/fonts')); >>gulpfile.js
echo }); >>gulpfile.js

echo gulp.task('js-vendor', function() { >>gulpfile.js
echo 	gulp.src(lib.ext('js').files) >>gulpfile.js
echo 		.pipe(concat('vendor.min.js')) >>gulpfile.js
echo 		.pipe(uglify()) >>gulpfile.js
echo 		.pipe(gulp.dest('./app/js')); >>gulpfile.js
echo }); >>gulpfile.js 

echo gulp.task('css', function() { >>gulpfile.js
echo 	return sass(config.sassPath + '/main.scss', {loadPath: [ >>gulpfile.js
echo 			'./src/sass', >>gulpfile.js
echo 			config.bowerDir + '/bootstrap-sass/assets/stylesheets', >>gulpfile.js
echo 			config.bowerDir + '/fontawesome/scss' >>gulpfile.js
echo 		], style: 'compressed',}) >>gulpfile.js
echo 		.pipe(rename('style.min.css')) >>gulpfile.js
echo 		.pipe(gulp.dest('./app/css')); >>gulpfile.js
echo }); >>gulpfile.js

echo gulp.task('watch', function() { >>gulpfile.js
echo 	gulp.watch(config.sassPath + '/**/*.scss',['css']); >>gulpfile.js
echo }); >>gulpfile.js

echo gulp.task('default', ['bower', 'icons', 'js-vendor', 'css']); >>gulpfile.js

echo >main.scss
move main.scss src\sass\

echo >custom.js
move custom.js src\js\

call bower install
call npm install
pause