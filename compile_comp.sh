#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$DIR"
cd $DIR
sass --watch scss_watch_comp/_compiled.scss:css_watch_comp/site.css --style nested