using BibtexLibrary
using Test




println("\nTesting the combine, sort, and transcode functions...");
# testing the sort and transcode functions
@testset "BibtexLibrary --- combine, sort, and transcode" begin
    # make temp dir
    mkdir(joinpath(@__DIR__, "temp"));

    # the sort function
    smp_1 = joinpath(@__DIR__, "../data/sample_1.bib");
    smp_2 = joinpath(@__DIR__, "../data/sample_2.bib");
    bib_1 = joinpath(@__DIR__, "temp/bib_1.bib");
    bib_2 = joinpath(@__DIR__, "temp/bib_2.bib");
    combo = joinpath(@__DIR__, "temp/trans.bib");

    # copy libs to current location
    cp(smp_1, bib_1, force=true);
    cp(smp_2, bib_2, force=true);

    # test the combine_libs
    combine_libs([bib_1, bib_2], combo);
    @test true;

    # test the sort_libs!
    sort_libs!([bib_1, bib_2, combo]);
    @test true;

    # test the transcode_libs!
    transcode_libs!([bib_1, bib_2, combo]);
    @test true;

    # remove dir
    rm(joinpath(@__DIR__, "temp"), force=true, recursive=true);
end
