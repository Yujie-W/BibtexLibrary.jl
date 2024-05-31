"""

    sync_field!(entry_from::Dict{String, String}, entry_to::Dict{String, String}, field::String; warn_level::Int = 0)

Synchronize a field from one entry to another, given
- `entry_from` Source entry
- `entry_to` Destination entry
- `field` Field to synchronize

"""
function sync_field!(entry_from::Dict{String, String}, entry_to::Dict{String, String}, field::String; warn_level::Int = 0)
    if haskey(entry_from, field)
        # if the field is pages
        if field == "pages"
            if occursin("--", entry_from["pages"])
                entry_to["pages"] = entry_from["pages"];
            elseif occursin("-", entry_from["pages"])
                entry_to["pages"] = replace(entry_from["pages"], "-" => "--");
            else
                entry_to["pages"] = entry_from["pages"];
            end;

        # if the field is doi
        elseif field == "doi"
            if occursin("https://doi.org/", entry_from["doi"])
                entry_to["doi"] = entry_from["doi"];
            elseif entry_from["doi"][2:4] == "10."
                entry_to["doi"] = "{https://doi.org/$(entry_from["doi"][2:end-1])}";
            else
                @error "DOI field is not in the correct format in the entry: $(entry_from["BIB_KEY"])";
            end;

        # otherwise, just copy the field
        else
            entry_to[field] = entry_from[field];
        end;
    else
        if warn_level == 2
            @error "Field $field is missing in the entry: $(entry_from["BIB_KEY"])";
        elseif warn_level == 1
            @warn "Field $field is missing in the entry: $(entry_from["BIB_KEY"])";
        end;
    end;

    return nothing
end;


"""

    format_entry_article(entry::Dict{String, String})

Format an article entry, given
- `entry` Input entry

"""
function format_entry_article(entry::Dict{String, String})
    new_entry = OrderedDict{String, String}();

    # set the type and key
    new_entry["type"] = "article";
    new_entry["key"] = entry["BIB_KEY"];

    # add the fields to the new entry
    sync_field!(entry, new_entry, "author"; warn_level = 2);
    sync_field!(entry, new_entry, "year"; warn_level = 2);
    sync_field!(entry, new_entry, "title"; warn_level = 2);
    sync_field!(entry, new_entry, "journal"; warn_level = 2);
    sync_field!(entry, new_entry, "volume"; warn_level = 2);
    sync_field!(entry, new_entry, "number"; warn_level = 1);
    sync_field!(entry, new_entry, "pages"; warn_level = 2);
    sync_field!(entry, new_entry, "doi"; warn_level = 1);

    return new_entry
end;


"""

    format_entry_book(entry::Dict{String, String})

Format a book entry, given
- `entry` Input entry

"""
function format_entry_book(entry::Dict{String, String})
    new_entry = OrderedDict{String, String}();

    # set the type and key
    new_entry["type"] = "book";
    new_entry["key"] = entry["BIB_KEY"];

    # add the fields to the new entry
    sync_field!(entry, new_entry, "author"; warn_level = 2);
    sync_field!(entry, new_entry, "year"; warn_level = 2);
    sync_field!(entry, new_entry, "title"; warn_level = 2);
    sync_field!(entry, new_entry, "edition"; warn_level = 0);
    sync_field!(entry, new_entry, "editor"; warn_level = 2);
    sync_field!(entry, new_entry, "publisher"; warn_level = 2);
    sync_field!(entry, new_entry, "doi"; warn_level = 1);

    return new_entry
end;


"""

    format_entry_dataset(entry::Dict{String, String})

Format a dataset entry, given
- `entry` Input entry

"""
function format_entry_dataset(entry::Dict{String, String})
    new_entry = OrderedDict{String, String}();

    # set the type and key
    new_entry["type"] = "dataset";
    new_entry["key"] = entry["BIB_KEY"];

    # add the fields to the new entry
    sync_field!(entry, new_entry, "author"; warn_level = 2);
    sync_field!(entry, new_entry, "year"; warn_level = 2);
    sync_field!(entry, new_entry, "title"; warn_level = 2);
    sync_field!(entry, new_entry, "journal"; warn_level = 2);
    sync_field!(entry, new_entry, "doi"; warn_level = 2);

    return new_entry
end;


"""

    format_entry_incollection(entry::Dict{String, String})

Format an incollection entry, given
- `entry` Input entry

"""
function format_entry_incollection(entry::Dict{String, String})
    new_entry = OrderedDict{String, String}();

    # set the type and key
    new_entry["type"] = "incollection";
    new_entry["key"] = entry["BIB_KEY"];

    # add the fields to the new entry
    sync_field!(entry, new_entry, "author"; warn_level = 2);
    sync_field!(entry, new_entry, "year"; warn_level = 2);
    sync_field!(entry, new_entry, "title"; warn_level = 2);
    sync_field!(entry, new_entry, "booktitle"; warn_level = 2);
    sync_field!(entry, new_entry, "editor"; warn_level = 0);
    sync_field!(entry, new_entry, "publisher"; warn_level = 2);
    sync_field!(entry, new_entry, "pages"; warn_level = 2);
    sync_field!(entry, new_entry, "doi"; warn_level = 1);

    return new_entry
end;


"""

    format_entry(entry::Dict{String, String})

Format an entry, given
- `entry` Input entry

"""
function fomart_entry(entry::Dict{String, String})
    # if entry type is an article
    if lowercase(entry["BIB_TYPE"]) == "article"
        return format_entry_article(entry);
    end;

    # if the entry type is a book
    if lowercase(entry["BIB_TYPE"]) == "book"
        return format_entry_book(entry);
    end;

    # if the entry type is a dataset
    if lowercase(entry["BIB_TYPE"]) == "dataset"
        return format_entry_dataset(entry);
    end;

    # if the entry type is an incollection or inproceedings
    if lowercase(entry["BIB_TYPE"]) == "incollection" || lowercase(entry["BIB_TYPE"]) == "inproceedings"
        return format_entry_incollection(entry);
    end;

    # otherwise, post an error
    return error("Entry type $(entry["BIB_TYPE"]) is not supported yet!");
end;
