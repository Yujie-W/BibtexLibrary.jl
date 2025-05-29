\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{emerald}[2024/07/03 Normal Template Class]




% Load required packages before loading the class
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{babel}
    \PassOptionsToPackage{english}{babel}
\RequirePackage{bm}
\RequirePackage{graphicx}
\RequirePackage{helvet}
\RequirePackage{indentfirst}
\RequirePackage{inputenc}
    \PassOptionsToPackage{utf8}{inputenc}
\RequirePackage{lineno}
\RequirePackage{multirow}
\RequirePackage{newpxtext}
\RequirePackage{newpxmath}
\RequirePackage{setspace}
\RequirePackage{soul}
\usepackage{upgreek}
\RequirePackage{url}
    \PassOptionsToPackage{hyphens}{url}
\RequirePackage{xcolor}




% Declare options related to the class
% Font size
\DeclareOption{10pt}{\def\npts\@ptsize{10}}
\DeclareOption{11pt}{\def\npts\@ptsize{11}}
\DeclareOption{12pt}{\def\npts\@ptsize{12}}
\DeclareOption{13pt}{\def\npts\@ptsize{13}}
\DeclareOption{14pt}{\def\npts\@ptsize{14}}
% Font family
\DeclareOption{arial}{
    \renewcommand{\familydefault}{\sfdefault}
}
\DeclareOption{serif}{
    \renewcommand{\familydefault}{\rmdefault}
}
% Text alignment
\DeclareOption{right}{
    \raggedright
    \setlength\parindent{3em}
}
% Line numbering
\DeclareOption{lineno}{
    \linenumbers
}
% References type
\DeclareOption{apadoi}{
    \PassOptionsToPackage{round,sort&compress}{natbib}
    \bibliographystyle{apadoi}
}
\DeclareOption{apamaxdoi}{
    \PassOptionsToPackage{round,sort&compress}{natbib}
    \bibliographystyle{apamaxdoi}
}
\DeclareOption{nature}{
    \PassOptionsToPackage{numbers,sort&compress,super}{natbib}
    \bibliographystyle{nature}
}
\DeclareOption{numdoi}{
    \PassOptionsToPackage{numbers,square,sort&compress}{natbib}
    \bibliographystyle{numdoi}
}
\DeclareOption{nummaxdoi}{
    \PassOptionsToPackage{numbers,square,sort&compress}{natbib}
    \bibliographystyle{nummaxdoi}
}
% Default options to pass to the article class
\DeclareOption{*}{
    \PassOptionsToClass{\CurrentOption}{article}
}
\ExecuteOptions{11pt,lineno,serif}
\ProcessOptions\relax
\PassOptionsToClass{\npts\@ptsize pt}{article}
\LoadClass{article}




% Load required packages after loading the class
% Disable the \showhypens warnings, use with package microtype
\let\CheckCommand\providecommand
\RequirePackage{geometry}
\RequirePackage{caption}
    \captionsetup[figure]{labelfont={bf,it},labelformat={default},labelsep=period, name={Fig.}, textfont={default}}
    \captionsetup[table]{labelfont={bf,it},labelformat={default},labelsep=period, name={Table}, textfont={default}}
\RequirePackage{enumitem}
\RequirePackage{longtable}
\RequirePackage{microtype}
\RequirePackage{natbib}
\RequirePackage{titlesec}
    \titleformat{\section}{\bfseries\normalfont}{\bfseries\thesection}{1em}{\bfseries}
    \titleformat{\subsection}{\bfseries\normalfont}{\bfseries\thesubsection}{1em}{\bfseries}
    \titleformat{\subsubsection}{\bfseries\normalfont}{\bfseries\thesubsubsection}{1em}{\bfseries}
    \titlespacing*{\section}{0pt}{2\baselineskip}{0pt}
    \titlespacing*{\subsection}{0pt}{1\baselineskip}{0pt}
    \titlespacing*{\subsubsection}{0pt}{1\baselineskip}{0pt}




% Page setup
\geometry{margin=1in}
\setstretch{1.5}
\setlength{\abovedisplayskip}{0pt}
\setlength{\belowdisplayskip}{0pt}
\setlength{\parindent}{3em}




% Title page setup (adapted from agujournal2019.cls)
\def\title#1{\def\thetitle{#1} {\centering \Large \bf #1 \vskip6pt}}
\def\authors#1{{\centering \normalsize #1 \vskip6pt}}
\def\affil#1{{$^\text{#1}$}}
\def\affiliation#1#2{{\centering \normalsize $^{#1}$#2 \vskip6pt}}
\def\correspondingauthors#1{{\centering \normalsize $^\text{*}$ Corresponding author: #1 \vskip6pt}}




% To penalize hyphen
\tolerance=1
\emergencystretch=\maxdimen
\hyphenpenalty=10000
\hbadness=10000
\sloppy




% Common institute shortcuts
\def\caltechgps{Division of Geological and Planetary Sciences, California Institute of Technology, Pasadena, California 91125, USA}
\def\caltechjpl{Jet Propulsion Laboratory, California Institute of Technology, Pasadena, California 91109, USA}
