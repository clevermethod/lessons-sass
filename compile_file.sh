#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$DIR"
cd $DIR
sass --watch scss_watch_file/file-watch.scss:css_watch_file/site.css --style nested