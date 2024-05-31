"""

    formatted_library(dicts::Vector{Dict{String,String}})

Format the Vector of Dict to a new Dict of OrderedDict (so as to join), given
- `dicts` Vector of dictionaries

"""
function formatted_library(dicts::Vector{Dict{String,String}})
    library = Dict{String, OrderedDict{String, String}}();
    for dict in dicts
        newdict = format_entry(dict);

        # if the key already exists in the library, throw an error
        if haskey(library, newdict["BIB_KEY"])
            @error "Duplicate key found in the library: $(newdict["BIB_KEY"])";
        else
            library[newdict["BIB_KEY"]] = newdict;
        end;
    end;

    return library
end;


"""

    write_entry!(dict::OrderedDict{String, String}, f::IOStream)

Write the entry to a file, given
- `dict` Dictionary of fields
- `f` File IO stream

"""
function write_entry!(dict::OrderedDict{String, String}, f::IOStream)
    # write the type and key
    write(f, "@$(dict["BIB_TYPE"]){$(dict["BIB_KEY"]),\n");

    # write the fields one by one
    for field in keys(dict)
        if !(field in ["BIB_TYPE", "BIB_KEY"])
            write(f, "    $field = $(dict[field]),\n");
        end;
    end;

    # write the closing bracket
    write(f, "}\n\n");

    return nothing
end;


"""

    save_bibliography!(library::Dict{String, OrderedDict{String, String}}, outfile::String)

Save the library to a file, given
- `library` Library of entries
- `outfile` Output file

"""
function save_bibliography!(library::Dict{String, OrderedDict{String, String}}, outfile::String)
    open(outfile, "w") do f
        sorted_keys = sort(collect(keys(library)));
        for key in sorted_keys
            write_entry!(library[key], f);
        end;
    end;

    return nothing
end;
