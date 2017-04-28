# SASS

### How to guide and examples

## General guides

http://sass-lang.com/guide

http://sass-lang.com/documentation/file.SASS_REFERENCE.html

## Installation

http://sass-lang.com/install

MACs already have ruby installed! so you just need to:
>`$ sudo gem install sass`

you'll want to use sudo to have access to install the framework globally. your computer password will be required.

check it is installed correctly
>`$ sass -v`

will return the sass version if installed correctly

## Converting / Watching

CSS to SCSS:
>`$ sass-convert style.css style.scss`

This is a crude conversion and will only try to nest your rules as it scans the document from top to bottom. It **WILL NOT** attempt to move rules around from the original to combine them or make variables. Some clean-up may be desired with this option, but is not required.

SASS to SCSS: (use SCSS over SASS)
>`$ sass-convert style.sass style.scss`

SCSS to CSS

simple one time use:
>`$ sass input.scss output.css`

watch (recompiles whenever the watch file / folder are updated):

file:
>`$ sass --watch input.scss:output.css`

folder:
>`$ sass --watch style/scss:style/css`

## Compression

**expanded** 
will attempt to pretty print your output file to make it very human read-able
>`$ sass --watch style/scss:style/css --style expanded`

**nested**
will attempt to indent your output file similar to how your SCSS was written (this is what compiler will do by default)
>`$ sass --watch style/scss:style/css --style nested`

**compact**
will attempt to put each rule on a new single line
>`$ sass --watch style/scss:style/css --style compact`

**compressed**
will attempt to put the entire style sheet onto a single line (most minified)
>`$ sass --watch style/scss:style/css --style compressed`

## Lesson examples

In terminal navigate to the parent folder of the folder you want to start watching
>`$ cd /path_from_computer_root/to_style_folder_parent/`



Folder watch:
>`$ sass --watch style/scss:style/css`

## Other resources

http://gulpjs.com/
is a task management framework for automating repetitive workflow operations. 

http://brackets.io/
is a lightweight / highly extensible text editor with large community support

Brackets plugins:
>**SASS/SCSS Hints** by Konstantin Kobs

>**Beautify** by Drew Hamlett

