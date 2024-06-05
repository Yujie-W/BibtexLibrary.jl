using BibtexLibrary: bib_format_check!, bib_format_file!, formatted_library, latinize_file!, merge_library, parse_bibtex_file, save_bibliography!
using Test


@testset "Formatting Pipelines" begin
    # 1. Convert the file to latin latter only file
    latinize_file!(@__DIR__() * "/../../templates/bibtex/zotero.bib", @__DIR__() * "/cache-latin.bib");
    @test true;

    # 2. Check the bib file format
    status = bib_format_check!(@__DIR__() * "/cache-latin.bib");
    @test status == 0;

    # 3. Format the file to given syntax
    bib_format_file!(@__DIR__() * "/cache-latin.bib", @__DIR__() * "/cache-unformatted.bib");
    @test true;

    # 4. Parse the file to a vector of unformatted dicts
    unformatted_dicts = parse_bibtex_file(@__DIR__() * "/cache-unformatted.bib");
    @test true;

    # 5. Format the library
    formattred_library = formatted_library(unformatted_dicts);
    @test true;

    # 6. Save the formatted library
    save_bibliography!(formattred_library, @__DIR__() * "/cache-formatted.bib");
    @test true;
end;
