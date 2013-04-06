#!/usr/bin/env ruby

# set include path that would be used in project's less file
@inc_path = [
    ".",
    ENV["lib"] + "/css",
    ENV["lib"] + "/javascript" ].join(":")

@command = "lessc --include-path=\"#{@inc_path}\""
@date = "$(date +%I:%M:%S%p)"

def compile_less(m)

    changed = m[0]
    folder = m[1]
    filename = m[2]

    case folder
        when nil
            # less/*.less -> css/*.less
            param = "#{changed} > css/#{filename}.css"
            system("#{@command} #{param} && echo #{@date} \"#{param}\"")

        when "shared/"
            # less/shared/*.less -> compile every main less file
            Dir["less/*.less"].each { |file|
                filename = File.basename(file, ".less")
                param = "#{file} > css/#{filename}.css"
                system("#{@command} #{param} && echo #{@date} \"#{changed} -> #{param}\"")
            }
        else
            # compile corresponding main less file
            # less/#{folder}/*.less -> less/#{folder}.less -> css/#{folder}.css
            filename = folder.gsub(/\/$/, "")
            param = "less/#{filename}.less > css/#{filename}.css"
            system("#{@command} #{param} && echo #{@date} \"#{changed} -> #{param}\"")
    end

end

watch("less/([^/]+/)?(.*)\.less$") { |m| compile_less m }
