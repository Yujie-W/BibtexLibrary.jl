"""

    bib_format_line(line::String)

Format a line in a BibTeX file to meet the following standards:
- Tabs are converted to four spaces
- Leading and trailing white spaces are removed
- If the line does not start with "@" or "}", it is indented with four spaces

"""
function bib_format_line(line::String)
    # convert the tab to four spaces
    line = replace(line, "\t" => "    ");

    # remove the leading and trailing white spaces
    line = String(strip(line));

    # if the line does not start with "@" or "}", maks sure there are 4 leading spaces
    if length(line) > 0
        if line[1] != '@' && line[1] != '}'
            line = "    $line";
        end;
    end;

    return line
end;


"""

    bib_format_check(line::String)

Check if a line in a BibTeX file meets the following standards, namely being one of the following:
- Empty
- Starting with "@"
- Starting with "}"
- Starting with "    " and the fifth character is not " "
- Otherwise, pop up a warning and return 1

"""
function bib_format_check(line::String)
    # if the line is empty, return nothing
    if length(line) == 0
        return 0
    end;

    # if the line start with "@", mark it as the beginning of a new entry
    if line[1] == '@'
        return 0
    end;

    # if the line start with "}", mark it as the end of the entry
    if line[1] == '}'
        return 0
    end;

    # if the line start with " ", make sure that the first four characters are " " and the fifth character is not " "
    if line[1] == ' '
        if line[1:4] == "    " && line[5] != ' '
            return 0
        end;

        @warn "Warning: the line does not follow the format: $line";
        return 1
    end;

    # for other cases, pop up warnings
    @warn "Warning: the line does not follow the format: $line";

    return 1
end;


"""

    bib_format_check!(file::String)

Check if a file in a BibTeX file meets the standards and return the number of warnings, given
- `file` Input file

"""
function bib_format_check!(file::String)
    # total count of warnings
    count = 0;

    open(file) do f
        for line in eachline(f)
            newline = bib_format_line(line);
            count += bib_format_check(newline);
        end;
    end;

    if count > 0
        @info "Total number of warnings: $count";
    end;

    return count
end;


"""

    bib_format_file!(infile::String, outfile::String)

Format a BibTeX file to meet the standards, given
- `infile` Input file
- `outfile` Output file

"""
function bib_format_file!(infile::String, outfile::String)
    oldlines = readlines(infile);
    open(outfile, "w") do f
        for line in oldlines
            newline = bib_format_line(line);
            write(f, "$newline\n");
        end;
    end;

    return nothing
end;
