using Documenter
using BibtexLibrary

pages = Any[
    "Home" => "index.md",
    "API"  => "API.md"
    ]


mathengine = MathJax(Dict(
    :TeX => Dict(
        :equationNumbers => Dict(:autoNumber => "AMS"),
        :Macros => Dict(),
    ),
))

format = Documenter.HTML(
    prettyurls = get(ENV, "CI", nothing) == "true",
    mathengine = mathengine,
    collapselevel = 1,
)

makedocs(
    sitename = "BibtexLibrary",
    format = format,

    clean = false,
    modules = [BibtexLibrary],
    pages = pages,
)

deploydocs(
    repo = "github.com/Yujie-W/BibtexLibrary.jl.git",
    target = "build",
    push_preview = true,
)
