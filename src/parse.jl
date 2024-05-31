"""

    get_entry_type_key(line::String)

Get the entry type and key from the line that start with "@" (judged from another function), given
- `line` Input line

"""
function get_entry_type_key(line::String)
    newline = line[2:end-1];
    entry_type, entry_key = split(newline, "{");

    return entry_type, entry_key
end;


"""

    get_key_field(line::String)

Get the key and field from a line that does not start with "    " (judged from another function), given
- `line` Input line

"""
function get_key_field(line::String)
    # split the line by the first "="
    tempkey, tempfield = split(line, "="; limit = 2);

    # remove the leading and trailing spaces
    tempkey = strip(tempkey);
    tempfield = strip(tempfield);

    # make sure the key does not contain any space, '{', or '}'
    if occursin(" ", tempkey) || occursin("{", tempkey) || occursin("}", tempkey)
        @error "Key contains invalid characters: $tempkey";
    else
        key = tempkey;
    end;

    # double check that the field contains the same number of '{' and '}' characters
    terminate_entry = false;
    if count(i->(i=='{'), tempfield) != count(i->(i=='}'), tempfield)
        terminate_entry = true;
        if tempfield[end] == '}'
            tempfield = tempfield[1:end-1];
        else
            @error "Field does not contain the same number of '{' and '}' means it is the end of an entry. But this is not the case: $tempfield";
        end;
    end;

    # remove the leading and trailing , if it exists
    if tempfield[end] == ','
        tempfield = tempfield[1:end-1];
    end;

    # add {} to the beginning and end of the field if it does not have
    if !(tempfield[1] == '{' && tempfield[end] == '}')
        field = "{$tempfield}";
    else
        field = tempfield;
    end;

    return key, field, terminate_entry
end;


"""

    parse_bibtex_file(infile::String)

Parse the lines of a BibTeX file to a Vector of Dict, given
- `infile` Input file

"""
function parse_bibtex_file(infile::String)
    lines = readlines(infile)
    dicts = Vector{Dict{String, String}}();

    # define the purpose of this line (searching for entry or searching for key)
    purpose = "entry";
    entry = Dict{String, String}();
    for line in lines
        if purpose == "entry"
            if length(line) > 0 && line[1] == '@'
                entry_type, entry_key = get_entry_type_key(line);
                entry["BIB_TYPE"] = entry_type;
                entry["BIB_KEY"] = entry_key;
                purpose = "key";
            end;
        else # purpose == "key"
            if length(line) > 0
                # if the first character is '}', it means the entry is finished, clear the entry and change the purpose
                if line[1] == '}'
                    purpose = "entry";
                    push!(dicts, deepcopy(entry));
                    entry = Dict{String, String}();
                end;

                # if the first character is '@', it means last entry was not terminated properly
                if line[1] == '@'
                    @error "Last entry not terminated properly" line;
                end;

                # otherwise, it is a key-field pair
                if line[1] == ' '
                    key, field, terminate_entry = get_key_field(line);
                    entry[key] = field;

                    if terminate_entry
                        purpose = "entry";
                        push!(dicts, deepcopy(entry));
                        entry = Dict{String, String}();
                    end;
                end;
            end;
        end;
    end;

    return dicts
end;
