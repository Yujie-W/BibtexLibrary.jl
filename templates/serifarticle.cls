\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{serifarticle}[2024/07/03 Normal Template Using Serif font]




% load default article class 11 pt and letterpaper
\LoadClass[11pt,letterpaper]{article}




% Disable the \showhypens warnings, use with package microtype
\let\CheckCommand\providecommand




% Load required packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{babel}
    \PassOptionsToPackage{english}{babel}
\RequirePackage{bm}
\RequirePackage{caption}
    \captionsetup[figure]{labelfont={bf,it},labelformat={default},labelsep=period, name={Fig.}, textfont={default}}
    \captionsetup[table]{labelfont={bf,it},labelformat={default},labelsep=period, name={Table}, textfont={default}}
\RequirePackage{enumitem}
\RequirePackage{geometry}
    \geometry{margin=1in}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
    \setlength\parindent{3em}
\RequirePackage{inputenc}
    \PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{lineno}
    \linenumbers
\RequirePackage{longtable}
\RequirePackage{microtype}
\RequirePackage{multirow}
\RequirePackage{newpxmath}
\RequirePackage{newpxtext}
\RequirePackage{natbib}
    \PassOptionsToPackage{round,sort&compress}{natbib}
\RequirePackage{setspace}
    \setstretch{1.5}
\RequirePackage{soul}
\RequirePackage{titlesec}
    \titleformat{\section}{\bfseries\normalfont}{\bfseries\thesection}{1em}{\bfseries}
    \titleformat{\subsection}{\bfseries\normalfont}{\bfseries\thesubsection}{1em}{\bfseries}
    \titleformat{\subsubsection}{\bfseries\normalfont}{\bfseries\thesubsubsection}{1em}{\bfseries}
    \titlespacing*{\section}{0pt}{2\baselineskip}{0pt}
    \titlespacing*{\subsection}{0pt}{1\baselineskip}{0pt}
    \titlespacing*{\subsubsection}{0pt}{1\baselineskip}{0pt}
\RequirePackage{url}
    \PassOptionsToPackage{hyphens}{url}
\RequirePackage{xcolor}




% To penalize hyphen
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000
\sloppy




% set length before and after equations
\setlength{\abovedisplayskip}{0pt}
\setlength{\belowdisplayskip}{0pt}




% Options
\DeclareOption{right}{\raggedright \setlength\parindent{3em}}




% load default options
\ExecuteOptions{}
\ProcessOptions\relax
