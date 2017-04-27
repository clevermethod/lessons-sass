# SASS

### How to guide and examples

## General guide

http://sass-lang.com/guide

## Installation

http://sass-lang.com/install

MACs already have ruby installed! so you just need to:

`$ sudo gem install sass`

## Converting / Watching

CSS to SCSS!:

`$ sass-convert style.css style.scss`

SASS to SCSS:

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

`$ sass --watch style/scss:style/css --style compressed`
