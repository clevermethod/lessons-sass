# SASS

### How to guide and examples

## General guides

http://sass-lang.com/guide

http://sass-lang.com/documentation/file.SASS_REFERENCE.html

## Installation

http://sass-lang.com/install

MACs already have ruby installed! so you just need to:
>`$ sudo gem install sass`

* you'll want to use sudo to have access to install the framework globally. your computer password will be required.

check it is installed correctly
>`$ sass -v`

* will return the sass version if installed correctly

For WINDOWS, reference the sass install documentation: http://sass-lang.com/install
(if you downloaded the Ruby 2.5.0-1 installer, you may run into an issue running the recommended: 'gem install ffi -v 1.9.18'. To fix this append '--force')
>`gem install ffi -v 1.9.18 --force

## Converting / Watching

#### CSS to SCSS:
>`$ sass-convert style.css style.scss`

This is a crude conversion and will only try to nest your rules as it scans the document from top to bottom. It **WILL NOT** attempt to move rules around from the original source to combine them or make variables. Some clean-up may be desired with this option, but is not required.

#### SASS to SCSS: (use SCSS over SASS)
>`$ sass-convert style.sass style.scss`

#### SCSS to CSS

**simple one time use:**
>`$ sass input.scss output.css`

**watch (recompiles whenever the watch file / folder are updated):**

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
>`$ cd /root/.../lessons-sass/`

Folder watch: (sample html **watch_folder.html**)
>`$ sass --watch scss_watch_folder:css_watch_folder`

* will create a folder full of css files with a 1:1 naming convention here: `/css_watch_folder`

File watch: (sample html **watch_file.html**)
>`$ sass --watch scss_watch_file/style.scss:css_watch_file/site.css`

* will create a single file from a single file source named: `site.css` here: `/css_watch_file`

Compile watch: (sample html **watch_comp.html**)
>`$ sass --watch scss_watch_comp/_compiled.scss:css_watch_comp/site.css`

* will create a single file from multi-file sources named: `site.css` here: `/css_watch_comp`

## How-to's

### Rules
are the same as in css with the key difference of nesting

**scss (single):**
~~~~
p{
    font-size: 1em;
    &.active{
        color: $red;
    }
    a{
        font-size: 0.5em;
        &:hover{
            color: green;
        }
    }
    .link{
        color: brown;
    }
}
~~~~
**css (single):**
~~~~
p{
    font-size: 1em;
}
p.active{
    color: #dd0000;
}
p a{
    font-size: 0.5em;
}
p a:hover{
    color: green;
}
p .link{
    color: brown;
}
~~~~

**scss (multi):**
~~~~
p,
span{
    font-size: 1em;
    &.active{
        color: $red;
    }
    a{
        font-size: 0.5em;
        &:hover{
            color: green;
        }
    }
    .link{
        color: brown;
    }
}
~~~~
**css (multi):**
~~~~
p{
    font-size: 1em;
}
p.active{
    color: #dd0000;
}
p a{
    font-size: 0.5em;
}
p a:hover{
    color: green;
}
p .link{
    color: brown;
}
span{
    font-size: 1em;
}
span.active{
    color: #dd0000;
}
span a{
    font-size: 0.5em;
}
span a:hover{
    color: green;
}
span .link{
    color: brown;
}
~~~~

#### Rules about Rules
#### Nesting
The main pitfall with starting out using sass is creating nesting hell; where, seemingly logical nesting in your scss file creates unmanageably long and non-overridable rules in your output file.

But, there is an easy solution using these 2 general rules-of-thumb (granted there are some cases that break this mold).
1. Do not add more selectors (id, class, tag) in your rules than necessary
2. The less repeated an html element on the page, the higher in a nest it will go.

**do:**
~~~~
// scss
body{ // only <html> is higher than <body>
}
section{ // may be more than one, but is high level
    span{
    }
}
#Header{ // should only be one of these per page
    span{
    }
}
//css
body{}
section{}
section span{}
#Header{}
#Header span{}
~~~~

**do not:**
~~~~
//scss
body{
    section{
        span{
        }
        #Header{
            span{
            }
        }
    }
}
//css
body{}
body section
body section span{}
body section #Header{}
body section #Header span{}
~~~~
* note: Empty rules do not get created on convertion. The above are just examples of how the nest would occur on render.

#### Includes
The next rule is about the placement of `@include`'s (which will be expanded upon later) in your rule. They should always be put at the **end** of the rule definition. This is due to a bug in some browser inspectors and how they map the rule back to scss files that made it. If the include is first, it will think that, that scss file made the rule. confusing stuff...

**do**
~~~~
span{
    font-size: 1em;
    @include css3(transform, translate(-50%,-50%)); // last :)
}
~~~~

**do not**
~~~~
span{
    @include css3(transform, translate(-50%,-50%)); // first :(
    font-size: 1em;
}
~~~~

### Variables
are properties saved into a keyword (variable).

**set (string):**
~~~~
$red: #dd0000;
~~~~

**get:**
~~~~
body{
    background: $red;
}
~~~~

**set (array):**
~~~~
$compatlist: -webkit- -moz- -ms- -o- '';
~~~~

**get:**
~~~~
@each $compat in $compatlist {
    #{$compat}transform: translate(-50%, -50%);
}
~~~~
* note: **#{}** is an interpolation syntax in sass. It allows the compiler to treat the variable as a substitution instead of something to evaluate. This is only needed if you want the plain css value from the variable.

### Functions
are functions

**set:**
~~~~
$baseFontSize: 16; // from variables
@function pxToEm($px){
    @return $px / $baseFontSize * 1em;
}
~~~~

**get:**
~~~~
body{
    font-size: pxToEm(32); // returns 2em (where 32 / 16 = 2 * 1em = 2em)
}
~~~~

### Mix-ins
are predefined snippets of code with replaceable tokens

**set:**
~~~~
@mixin css3($prop, $val) {
    @each $compat in $compatlist {
        #{$compat}#{$prop}: #{$val};
    }
}
~~~~

**get:**
~~~~
div {
    @include css3(tranform, translate(-50%, -50%));
}
~~~~

### Media queries
There are 2 ways to set them (you can use variables in their definitions as well!).

**outside rule:**
~~~~
$break-mobile: 425px; // from variables
@media screen and (max-width: $break-mobile) {
    body{
        p{
            font-size: 0.75em;
        }
        span{
            font-size: 0.5em;
        }
    }
}
~~~~

**inside rule:**
~~~~
body{
    p{
        font-size: 1em;
        @media screen and (max-width: $break-mobile) {
            font-size: 0.75em;
        }
    }
    span{
        font-size: 0.5em;
    }
}
~~~~

## Development
### Small scale, single developer projects
Where collaboration / parallel development are not a concern, use the **file** watch method.
* This is the speediest way to get started and keeps all of your concerns in a single location.

### Medium scale, single to multi-developer projects
Where collaboration / parallel development may become a concern, but page count is still managable, use the **folder** or **compiled** watch method.
* The number of files **folder** watch creates is not ideal, but may be necessary for workflow / file management across many pages and developers.

### Large scale, multi-developer projects
Where collaboration / parallel development is a major concern and page count is not managable, use the **compiled** watch method.
* In a case like this, seperating each developer's concerns is paramount.
Though longer to set-up, this allows for the most flexibility with parallel development and organized file management.
This also nicely seperates concerns and creates and environment for portable / reusable code snippets.

## Workflow
Attached in this lesson are some handy `bash` files to help streamline the watch process.

**compile_folder.sh**

**compile_file.sh**

**compile_comp.sh**

**compile_all.sh**

Drag any of these into your terminal window and hit `enter` and the watch process will be started automatically.
This is possible because of the contents of the file and where it is placed in the directory.
~~~~
#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "$DIR"
cd $DIR
sass --watch scss_watch_file/style.scss:css_watch_file/site.css --style nested
~~~~
* First line designated a bash file.
* Next line figures out where on your computer this bash file lives.
* Next line prints that location to your terminal window.
* Next line navigates to that directory.
* Next line starts a sass watch relative to the directory your cd'd to.

### Large scale projects and compile watch method
Here are my techniques for producing managable sass frameworks for large scale / multi-developer projects with scattered deployment schedules.

1. Make a **shared resources** directory
    * variables.scss
    * functions.scss
    * mixins.scss
    * reset.scss
    * grid.scss
2. Make a **site specific** directory
    * general.scss - hold common things
3. For each new page / significant section of the site make a new scss file
    * header.scss
    * footer.scss
    * home.scss
    * contact-us.scss
    * ...
4. Make a **compile** file
    * _compiled.scss - `@import`'s shared resources, site specific files, and is the file to watch
        ~~~~
        @import "variables.scss";
        @import "functions.scss";
        @import "mixins.scss";
        @import "reset.scss";
        @import "grid.scss";
        @import "general.scss";
        @import "header.scss";
        @import "footer.scss";
        @import "home.scss";
        @import "home.scss";
        @import "contact-us.scss";
        ...
        ~~~~
5. Make a **compile.sh** bash file at the root of your project and populate it with the relative paths (from itself) of the _compile.scss file to watch
    * use the **expanded** or **nested** compression types to facilitate partial deployments (non-minification is made up for in ease of deployment and single file request from the server)
6. Start the **compile.sh** bash file in terminal
7. Populate your scss files.
    * If done correctly, you will see in your inspector, your rules as well as a link to the scss file that contains it.
8. In source control, **ignore** `.sass-cache`
    * this cache is rebuilt for each person and doesnt need to be version controlled.
9. Update
    * You may get a conflict on the compiled css and map files. Just accept the incoming changes and rerun your watch `bash` file. Since the compiled file is just the output of various inputs (that did not have conflicts), it will get remade with the other person's changes and your own.
10. Commit
11. Deployment
    * Since the compiled file is not totally minified, it is easy to compare up differences to various environments.
12. Collaboration / parallel development / stagger release
    * Since each page / section is seperated, development is siloed to those developers working on those sections of the site.
    * This is further safe-guarded with the following convention (start every scss file, minus generic ones, with a page identifier):
~~~~
    <body class="pageIdentifier">
        <div id="Rule"></div>
    </body>
~~~~
~~~~
    // start of scss file
    .pageIdentifier{
        #Rule{
        }
    }
~~~~
13. Sit back, relax, profit
    * cause you just streamlined your process!

## Other resources

http://gulpjs.com/
is a task management framework for automating repetitive workflow operations. 

http://brackets.io/
is a lightweight / highly extensible text editor with large community support

Brackets plugins:
>**SASS/SCSS Hints** by Konstantin Kobs

>**Beautify** by Drew Hamlett

_____

###### made with ♥ by [clevermethod](http://www.clevermethod.com/)
