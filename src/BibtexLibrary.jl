module BibtexLibrary

using DataStructures: OrderedDict


include("bibformat.jl");
include("entries.jl");
include("latinize.jl");
include("library.jl");
include("parse.jl");


end # module
