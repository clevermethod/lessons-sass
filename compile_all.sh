#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$DIR"
cd $DIR
sass --watch scss_watch_folder:css_watch_folder \
scss_watch_file/file-watch.scss:css_watch_file/site.css \
scss_watch_comp/_compiled.scss:css_watch_comp/site.css --style nested