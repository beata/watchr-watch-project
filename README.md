Script to watch project's less and js files, which helps you to compile javascript and less files automatically.

Javascript files would be compiled according to the settings in `build.rb`.

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

Open `~/lib/js.watchr` and change `@js_lib_dir` path matching yours.

    @js_lib_dir = ENV["lib"] + "/custom/snippets"


### Modify lessc --include-path option.

Open `~/lib/lessc.watchr` and change `@inc_path` matchin your folder structure. This variable would be `--include-path` option for `lessc` command

    @inc_path = [
        ".",
        ENV["lib"] + "/css",
        ENV["lib"] + "/javascript" ].join(":")


### Modify Project Root Path.

[See build.rb file example](https://github.com/beata/watchr-watch-project/blob/master/examples/build.rb)


# Usage

Create your project under WEB_ROOT path and execute this command:

    watchr-project ABS_PATH_TO_PROJECT

