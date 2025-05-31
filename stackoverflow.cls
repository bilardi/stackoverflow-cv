%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Stackoverflow CV
% LaTeX Class
% Version 3.0 (1/1/24)
%
% This class has been modified from a version originates from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Jan Vorisek (jan@vorisek.me)
% Based on a template by Jan Küster (info@jankuester.com)
% Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
% Modified for Stackoverflow CV by Alessandra Bilardi (alessandra.bilardi@gmail.com)
%
% License:
% The MIT License (see included LICENSE file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stackoverflow}[2022/06/06 Stackoverflow CV class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation

\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links

\pagestyle{empty} % No headers or footers

\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)

%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\newif\ifprint
\printfalse % Default to screen layout

\DeclareOption{print}{\printtrue}
\ProcessOptions\relax

\ifprint
  % Print-optimized settings
  \geometry{margin=2cm}
\else
  % Screen-optimized settings
  \geometry{margin=1.2cm}
\fi

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{fontspec} % For modern fonts
\usepackage{unicode-math} % For Unicode math symbols
\usepackage{fontawesome5} % Updated FontAwesome version

% Modern font options
\usepackage{roboto} % Google's Roboto font
%\usepackage{sourcesanspro} % Adobe Source Sans Pro
%\usepackage{lato} % Lato font

\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

%----------------------------------------------------------------------------------------
%	GRAPHICS DEFINITIONS
%---------------------------------------------------------------------------------------- 

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm} % Default tikz units

% Command to vertically centre adjacent content
\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}

% main color
\usepackage{xcolor}
\definecolor{stackoverflow}{HTML}{74aedd}
\definecolor{stackoverflow-name}{HTML}{00599a}
\definecolor{stackoverflow-detail}{HTML}{818181}

% Modern color scheme
\definecolor{primary}{HTML}{007ACC} % Modern blue
\definecolor{secondary}{HTML}{6C757D} % Gray
\definecolor{accent}{HTML}{28A745} % Green
\definecolor{warning}{HTML}{FFC107} % Yellow
\definecolor{danger}{HTML}{DC3545} % Red

%----------------------------------------------------------------------------------------
%	CUSTOM COMPONENTS
%----------------------------------------------------------------------------------------

\usepackage[skins,breakable]{tcolorbox}
\newcommand{\block}[2]{
	\textcolor{stackoverflow}{\hrule}
	\vspace{\baselineskip} % Whitespace before the section title
	\begin{minipage}[t]{0.25\textwidth}
		#1
	\end{minipage}
	\begin{minipage}[t]{0.75\textwidth}
		{\small#2}
	\end{minipage}
}

\newcommand{\miniblock}[4]{
	\begin{minipage}[t]{#1\textwidth}
		\textbf{#3}
	\end{minipage}
	\begin{minipage}[t]{#2\textwidth}
		#4
	\end{minipage}
}

%----------------------------------------------------------------------------------------
%	CUSTOM SECTIONS
%----------------------------------------------------------------------------------------

% Command to output section title headings
\newcommand{\cvsect}[1]{% The only parameter is the section text
%	\vspace{\baselineskip} % Whitespace before the section title
%	\colorbox{black}{\textcolor{white}{\MakeUppercase{\textbf{#1}}}}\\% Section title
	\textcolor{stackoverflow}{\textbf{#1}}\\% Section title
}

%----------------------------------------------------------------------------------------
%	ENTRY LIST
%----------------------------------------------------------------------------------------

\usepackage{longtable} % Required for tables that span multiple pages
\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable

\setlength{\tabcolsep}{0pt} % No spacing between table columns

% Environment to hold a new list of entries
\newenvironment{entrylist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

\newcommand{\entry}[4]{% First argument for the leftmost date(s) text, second is for the bold entry heading, third is for the bold right-aligned entry qualifier and the fourth is for the entry description
	\parbox[t]{1\textwidth}{
		\textcolor{stackoverflow}{\rule{13.5cm}{0.3pt}}
		\\\\
		\textbf{#2} - \textcolor{black}{#3}% Entry heading text
		\hfill% Horizontal whitespace
%		{\footnotesize \textbf{\textcolor{black}{#3}}}\\% Right-aligned entry qualifier text
%		\textbf{\textit{\textcolor{stackoverflow-detail}{#1}}}\\% Right-aligned entry qualifier text
		\textit{\textcolor{stackoverflow-detail}{#1}}\\% Right-aligned entry qualifier text
		#4 % Entry description text
	}\\\\}

% Command to output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}

% Modern layout features
\usepackage{multicol} % Multiple columns
\usepackage{enumitem} % Custom lists
\usepackage{graphicx} % Enhanced graphics
\usepackage{microtype} % Typography enhancements
\usepackage{ragged2e} % Better text alignment
\usepackage{booktabs} % Professional tables
