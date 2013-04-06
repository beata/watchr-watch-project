Script to watch project's less and js files.

Javascript files would be compiled according to `build.rb` in the project javascript directory.
Also, Lessc's `--include-path` option could be set in `lessc.watchr`.

# Requirement

* [less](http://lesscss.org/)
* [uglifyjs2](https://github.com/mishoo/UglifyJS2.git)
* [watchr](https://github.com/mynyml/watchr.git)

# Installation

## Copy File to Target Directory
    cp ~/path/to/watchr-watch-project/bin/watchr-project ~/bin
    cp ~/path/to/watchr-watch-project/lib/*.watchr ~/lib

## Modify Path

### Add "lib" path to environment variable.
Open `~/.bashrc` and add the following line:

    export lib=~/dev/src/lib

### Modify javascirpt lib path to yours.

Open `~/lib/js.watchr` and modify `@js_lib_dir`.

    @js_lib_dir = ENV["lib"] + "/custom/snippets"


### Modify lessc --include-path option.

Open `~/lib/lessc.watchr` and modify `@inc_path`. This variable would be used as `lessc --include-path` option

    @inc_path = [
        ".",
        ENV["lib"] + "/css",
        ENV["lib"] + "/javascript" ].join(":")


### Modify Project Root Path.

Open `~/bin/watchr-project` and modify `WEB_ROOT` path. Also, if you like, you can modify the javascript configuration path in this file as well.

    # the WEB_ROOT path
    WEB_ROOT=~/www/work.dev/public

    # assets/js/src/build.rb - the js configuration file
    watchr ~/lib/js.watchr $WEB_ROOT/$PROJECT/assets/js/src/build.rb &


[See build.rb file example](/beata/watchr-watch-project/blob/master/examples/build.rb)


# Usage

Create your project under WEB_ROOT path and execute this command:

    watchr-project PROJECT_NAME

