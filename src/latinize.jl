"""

    unicode_to_latin(c::Char)

Convert a Unicode character to a Latin string, given
- `c` Input character

"""
function unicode_to_latin(c::Char)
    if UInt(c) > 0x7f
        # general Unicode characters
        if c == '‐'                 # hyphen
            return "-"
        elseif c == '–'             # en dash
            return "--"
        elseif c == '−'             # minus sign
            return "\$-\$"
        elseif c == '·'             # middle dot
            return "\$\\cdot\$"
        elseif c == '×'             # multiplication sign
            return "\$\\times\$"
        elseif c == '’'
            return "'"
        elseif c == ' '
            return ' '
        # Greek letters
        elseif c == 'μ'
            return "\$\\mu\$"
        # Other Unicode characters
        elseif c == 'ä'
            return "{\\\"a}"
        elseif c == 'Á'
            return "{\\\'A}"
        elseif c == 'é'
            return "{\\\'e}"
        elseif c == 'í'
            return "{\\\'i}"
        elseif c == 'ó'
            return "{\\\'o}"
        elseif c == 'ö'
            return "{\\\"o}"
        elseif c == 'Ü'
            return "{\\\"U}"
        else
            @error "Character '$c' not supported, please add the support before forwarding!"
            return c
        end;
    else
        return c
    end;
end;


"""

    latinized_line(line::String)

Convert a line to a Latin string, given
- `line` Input line

"""
function latinized_line(line::String)
    # count the number of non-ASCII characters
    count = 0;
    for c in line
        if UInt(c) > 0x7f
            count += 1;
        end;
    end;

    # if count is zero, return the original line
    if count == 0
        return line
    end;

    # otherwise, convert the non-ASCII characters to ASCII characters
    newline = "";
    for c in line
        newline *= unicode_to_latin(c);
    end;

    return newline
end;


"""

    latinize_file!(infile::String, outfile::String)

Convert a file to a Latin character only file, given
- `infile` Input file
- `outfile` Output file

"""
function latinize_file!(infile::String, outfile::String)
    oldlines = readlines(infile);
    open(outfile, "w") do f
        for line in oldlines
            newline = latinized_line(line);
            write(f, "$newline\n");
        end;
    end;

    return nothing
end;
