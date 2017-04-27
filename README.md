# SASS

### How to guide and examples

## General guides

http://sass-lang.com/guide

http://sass-lang.com/documentation/file.SASS_REFERENCE.html

## Installation

http://sass-lang.com/install

MACs already have ruby installed! so you just need to:

`$ sudo gem install sass`

## Converting / Watching

CSS to SCSS!:

`$ sass-convert style.css style.scss`

This is a crude conversion and will only try to nest your rules as it scans the document from top to bottom. It **will not** attempt to move rules around from the original to combine them or make variables. Some clean-up may be required with this option.

SASS to SCSS: (use SCSS over SASS)

`$ sass-convert style.sass style.scss`

SCSS to CSS

simple one time use:

`$ sass input.scss output.css`

watch (recompiles whenever the watch file / folder are updated):

file:
`$ sass --watch input.scss:output.css`

folder:
`$ sass --watch style/scss:style/css`

## Compression

`$ sass --watch style/scss:style/css --style expanded`
will attempt to pretty print your output file to make it very human read-able

`$ sass --watch style/scss:style/css --style nested`
will attempt to indent your output file similar to how your SCSS was written (this is what compiler will do by default)

`$ sass --watch style/scss:style/css --style compact`
will attempt to put each rule on a new single line

`$ sass --watch style/scss:style/css --style compressed`
will attempt to put the entire style sheet onto a single line (most minified)

