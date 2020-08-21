module BibtexLibrary




export combine_libs,
       sort_libs!,
       switch_letter_to_latin,
       transcode_libs!




###############################################################################
#
# Combine the libraries into one
#
###############################################################################
"""
    combine_libs(file_in::Array{String,1}, file_out::String)

Combine and sort the libraries, given
- `files_in` Array of bibliography file names
- `file_out` File to write
"""
function combine_libs(
            files_in::Array{String,1},
            file_out::String
)
    # initialize the list of string to write
    dict_to_write = Pair{String,String}[];

    # iterate through each file
    _key    = "";
    _string = "";
    for file_name in files_in
        line_list = readlines(file_name);
        for line in line_list
            # judge if next item (not @comment)
            if      length(line)>=5         &&
                    line[1]=='@'            &&
                    lowercase(line[2])!='c' &&
                    _key!=""
                push!(dict_to_write, _key => _string);
                _key    = "";
                _string = "";
            end

            # skip the comments
            if length(line)>=5 && line[1]=='@' && lowercase(line[2])=='c'
                nothing;

            # else, the line is useful
            else
                # find the key from the line @...
                if length(line)>0 && line[1]=='@'
                    _ini = findfirst("{", line)[end] + 1;
                    _end = findfirst(",", line)[1  ] - 1;
                    _key = line[_ini:_end];
                end

                # if empty lines at the very beginning
                if length(_string)==0 && length(line)==0
                    nothing;
                # if two consecutive empty lines in the middle
                elseif length(_string)>1    &&
                       length(line)==0      &&
                       _string[end]=='\n'
                    nothing;
                else
                    _string *= line * "\n";
                end
            end
        end
        if _key!="" && _string!=""
            push!(dict_to_write, _key => _string);
            _key    = "";
            _string = "";
        end
    end

    # sort and save the string to file
    sort!(dict_to_write);
    file_write = open(file_out, "w");
    for (_key,_string) in dict_to_write
        write(file_write, _string * "\n");
    end
    close(file_write);

    return nothing
end








###############################################################################
#
# sort the libraries
#
###############################################################################
"""
    sort_libs!(file_list::Array{String,1})
Sort the libraries, given
- `files_in` Array of bibliography file names
"""
function sort_libs!(
            files_in::Array{String,1}
)
    # iterate through each file
    for _file in files_in
        # initialize the list of string to write
        dict_to_write = Pair{String,String}[];
        _key    = "";
        _string = "";

        # read through the file
        line_list = readlines(_file);
        for line in line_list
            # judge if next item (not @comment)
            if      length(line)>=5         &&
                    line[1]=='@'            &&
                    lowercase(line[2])!='c' &&
                    _key!=""
                push!(dict_to_write, _key => _string);
                _key    = "";
                _string = "";
            end

            # skip the comments
            if length(line)>=5 && line[1]=='@' && lowercase(line[2])=='c'
                nothing;

            # else, the line is useful
            else
                # find the key from the line @...
                if length(line)>0 && line[1]=='@'
                    _ini = findfirst("{", line)[end] + 1;
                    _end = findfirst(",", line)[1  ] - 1;
                    _key = line[_ini:_end];
                end

                # if empty lines at the very beginning
                if length(_string)==0 && length(line)==0
                    nothing;
                # if two consecutive empty lines in the middle
                elseif length(_string)>1    &&
                       length(line)==0      &&
                       _string[end]=='\n'
                    nothing;
                else
                    _string *= line * "\n";
                end
            end
        end
        if _key!="" && _string!=""
            push!(dict_to_write, _key => _string);
            _key    = "";
            _string = "";
        end

        # sort and save file
        sort!(dict_to_write);
        file_write = open(_file, "w");
        for (_key,_string) in dict_to_write
            write(file_write, _string * "\n");
        end
        close(file_write);
    end

    return nothing
end








###############################################################################
#
# Transcode the letter from UTF-8 to Latin
#
###############################################################################
"""
    switch_letter_to_latin(letter_in::Char)
    switch_letter_to_latin(letter_in::String)
Switch letter from UTF-8 to latex latin string, given
- `letter_in` Input letter
"""
function switch_letter_to_latin(letter_in::Char)
    if letter_in == '–'
        return "--"
    elseif letter_in == 'ä'
        return "{\\\"a}"
    elseif letter_in == 'Á'
        return "{\\\'A}"
    elseif letter_in == 'é'
        return "{\\\'e}"
    elseif letter_in == 'í'
        return "{\\\'i}"
    elseif letter_in == 'ó'
        return "{\\\'o}"
    elseif letter_in == 'ö'
        return "{\\\"o}"
    elseif letter_in == 'Ü'
        return "{\\\"U}"
    else
        return letter_in
    end
end




function switch_letter_to_latin(letter_in::String)
    if letter_in == "–"
        return "--"
    elseif letter_in == "ä"
        return "{\\\"a}"
    elseif letter_in == "Á"
        return "{\\\'A}"
    elseif letter_in == "é"
        return "{\\\'e}"
    elseif letter_in == "í"
        return "{\\\'i}"
    elseif letter_in == "ó"
        return "{\\\'o}"
    elseif letter_in == "ö"
        return "{\\\"o}"
    elseif letter_in == "Ü"
        return "{\\\"U}"
    else
        return letter_in
    end
end








###############################################################################
#
# Transcode the bibliography from UTF-8 to Latin
#
###############################################################################
"""
    transcode_libs!(file_in::Array{String,1})
Transcode the UTF8 letter to latex latin strings, given
- `files_in` Array of bibliography file names
"""
function transcode_libs!(
            files_in::Array{String,1}
)
    # initialize the list of string to write
    dict_to_write = Pair{String,String}[];

    # iterate through each file
    _key    = "";
    _string = "";
    for file_name in files_in
        line_list = readlines(file_name);
        for line in line_list
            # judge if next item (not @comment)
            if      length(line)>=5         &&
                    line[1]=='@'            &&
                    lowercase(line[2])!='c' &&
                    _key!=""
                push!(dict_to_write, _key => _string);
                _key    = "";
                _string = "";
            end

            # skip the comments
            if length(line)>=5 && line[1]=='@' && lowercase(line[2])=='c'
                nothing;

            # else, the line is useful
            else
                # find the key from the line @...
                if length(line)>0 && line[1]=='@'
                    _ini = findfirst("{", line)[end] + 1;
                    _end = findfirst(",", line)[1  ] - 1;
                    _key = line[_ini:_end];
                end

                # if empty lines at the very beginning
                if length(_string)==0 && length(line)==0
                    nothing;
                # if two consecutive empty lines in the middle
                elseif length(_string)>1    &&
                       length(line)==0      &&
                       _string[end]=='\n'
                    nothing;
                else
                    for letter in line
                        _str = switch_letter_to_latin(letter);
                        _string *= _str;
                    end
                    # add a line feed at the end of line
                    _string *= '\n';
                end
            end
        end
        if _key!="" && _string!=""
            push!(dict_to_write, _key => _string);
            _key    = "";
            _string = "";
        end

        # sort and save file to the file
        sort!(dict_to_write);
        file_write = open(file_name, "w");
        for (_key,_string) in dict_to_write
            write(file_write, _string * "\n");
        end
        close(file_write);
    end

    return nothing
end




end # module
