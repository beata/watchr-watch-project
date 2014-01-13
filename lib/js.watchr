#!/usr/bin/env ruby

require "pathname"

# watch javascript library folder
@js_lib_dir = ENV["lib"] + "/custom/snippets"

@date="$(date +%I:%M:%S%p)"
@source_dir = File.dirname(ARGV.last)

def load_config
    require ARGV.last
    $configure.each { |group, config|
        config[:files].each_index { |i|
            file = config[:files][i]
            if "./" === file[0,2] or "../" === file[0,3]
                config[:files][i] = Pathname.new(@source_dir + "/" + file).realpath.to_s
            end
        }
    }
end

def compile_changed_js(m)
    changed = m[0]
    changed_realpath = Pathname.new(m[0]).realpath.to_s
    $configure.each { |group, config|
        if config[:files].include?(changed_realpath)
            _compile_js(config, changed)
        end
    }
end

def compile_all_js()
    $configure.each { |group, config|
        _compile_js(config, "all")
    }
end

def _compile_js(config, changed)
    output = config[:output]

    if "./" === output[0,2] or "../" === output[0,3]
        output = @source_dir + "/" + output
    end

    output_str = "@source_dir/" + config[:output]
    output_pathname = Pathname.new(output)

    if not output_pathname.exist?
        system("touch #{output} && echo #{@date} \"created #{output_str}\"")
    end

    files = config[:files].join(" ")

    system("uglifyjs #{files} -o #{output_pathname.realpath.to_s} && echo #{@date} \"#{changed} -> #{output_str}\"")
end

load_config if !$configure

# watch source
watch(".*.js") { |m| compile_changed_js  m }


# watch library
p1 = Pathname.new(Dir.pwd)
p2 = Pathname.new(@js_lib_dir)
Dir.chdir(p2.relative_path_from(p1)) do
    watch(".*.js") { |m|
        puts m
        compile_changed_js m } end
