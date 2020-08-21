var documenterSearchIndex = {"docs":
[{"location":"#BibtexLibrary.jl","page":"Home","title":"BibtexLibrary.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Functions to manager Bibtex Bibliography library.","category":"page"},{"location":"#Usage","page":"Home","title":"Usage","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"using BibtexLibrary\n\ncombine_libs([\"file_name_1\", \"file_name_2\"], \"combined_file_name\");\nsort_libs!([\"file_name_1\", \"file_name_2\"]);\ntranscode_libs!([\"file_name_1\", \"file_name_2\"]);","category":"page"},{"location":"API/#API","page":"API","title":"API","text":"","category":"section"},{"location":"API/","page":"API","title":"API","text":"CurrentModule = BibtexLibrary","category":"page"},{"location":"API/#Library-operations","page":"API","title":"Library operations","text":"","category":"section"},{"location":"API/","page":"API","title":"API","text":"combine_libs\nsort_libs!\nswitch_letter_to_latin\ntranscode_libs!","category":"page"},{"location":"API/#BibtexLibrary.combine_libs","page":"API","title":"BibtexLibrary.combine_libs","text":"combine_libs(file_in::Array{String,1}, file_out::String)\n\nCombine and sort the libraries, given\n\nfiles_in Array of bibliography file names\nfile_out File to write\n\n\n\n\n\n","category":"function"},{"location":"API/#BibtexLibrary.sort_libs!","page":"API","title":"BibtexLibrary.sort_libs!","text":"sort_libs!(file_list::Array{String,1})\n\nSort the libraries, given\n\nfiles_in Array of bibliography file names\n\n\n\n\n\n","category":"function"},{"location":"API/#BibtexLibrary.switch_letter_to_latin","page":"API","title":"BibtexLibrary.switch_letter_to_latin","text":"switch_letter_to_latin(letter_in::Char)\nswitch_letter_to_latin(letter_in::String)\n\nSwitch letter from UTF-8 to latex latin string, given\n\nletter_in Input letter\n\n\n\n\n\n","category":"function"},{"location":"API/#BibtexLibrary.transcode_libs!","page":"API","title":"BibtexLibrary.transcode_libs!","text":"transcode_libs!(file_in::Array{String,1})\n\nTranscode the UTF8 letter to latex latin strings, given\n\nfiles_in Array of bibliography file names\n\n\n\n\n\n","category":"function"}]
}