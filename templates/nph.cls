\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nph}[2021/01/05 New Phytologist Template]




% load default article class 12 pt and letterpaper
\LoadClass[12pt,letterpaper]{article}




% Disable the \showhypens warnings, use with package microtype
\let\CheckCommand\providecommand




% Load required packages
\RequirePackage{amsmath}
\RequirePackage{bm}
\RequirePackage{enumitem}
\RequirePackage{geometry}
    \geometry{top=2.6cm,bottom=2.6cm,left=2.6cm,right=2.6cm}
\RequirePackage{graphicx}
\RequirePackage{indentfirst}
    \setlength\parindent{3em}
\RequirePackage{lineno}
    \linenumbers
\RequirePackage{microtype}
\RequirePackage{multirow}
\RequirePackage{newpxmath}
\RequirePackage{newpxtext}
\RequirePackage{natbib}
    \PassOptionsToPackage{round,compress}{natbib}
    \renewcommand{\bibsection}{\section*{REFERENCES}}
\RequirePackage{setspace}
    \setstretch{1.5}
\RequirePackage{soul}
\RequirePackage{titlesec}
    \titleformat{\section}{\bfseries\normalfont}{\bfseries\thesection}{1em}{\bfseries}
    \titleformat{\subsection}{\bfseries\normalfont}{\bfseries\thesubsection}{1em}{\bfseries}
    \titleformat{\subsubsection}{\itshape\normalfont}{\itshape\thesubsubsection}{1em}{\itshape}
    \titlespacing*{\section}{0pt}{2\baselineskip}{0pt}
    \titlespacing*{\subsection}{0pt}{1\baselineskip}{0pt}
    \titlespacing*{\subsubsection}{0pt}{1\baselineskip}{0pt}
\RequirePackage{url}
    \PassOptionsToPackage{hyphens}{url}
\RequirePackage{xcolor}




% Use customized Figure and Table label: Fig. 1 ... and Table 1 ...
% This template does not use \caption to make it compatible with lineno package
\makeatletter
\renewcommand{\figurename}{Fig.}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip\normalsize
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \textbf{#1} #2\par
  \else
    \centering
    \textbf{#1} #2\par
  \fi
  \vskip\belowcaptionskip}
\makeatother




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
