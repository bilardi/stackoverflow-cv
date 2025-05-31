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
%\ProvidesClass{developercv}[2019/01/28 Developer CV class v1.0]
\ProvidesClass{stackoverflow}[2022/05/31 Stackoverflow CV class v2.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation

\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links

\newcommand{\lorem}{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.} % Dummy text

\pagestyle{empty} % No headers or footers

\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)

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

% Remove old font packages
%\usepackage{helvet}
%\usepackage[default]{raleway}
%\usepackage[defaultsans]{droidsans}
%\usepackage{cmbright}
%\usepackage{fetamont}
%\usepackage{gillius}

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

% Remove old geometry settings
%\geometry{
%	paper=a4paper,
%	top=1.7cm,
%	bottom=1.7cm,
%	left=1.5cm,
%	right=1.5cm,
%	headheight=0.75cm,
%	footskip=1cm,
%	headsep=0.5cm,
%}

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\usepackage{xcolor} % Load xcolor package first
\definecolor{stackoverflow}{HTML}{74aedd}
\definecolor{stackoverflow-name}{HTML}{00599a}
\definecolor{stackoverflow-detail}{HTML}{818181}

% Add modern color scheme
\definecolor{primary}{HTML}{007ACC} % Modern blue
\definecolor{secondary}{HTML}{6C757D} % Gray
\definecolor{accent}{HTML}{28A745} % Green
\definecolor{warning}{HTML}{FFC107} % Yellow
\definecolor{danger}{HTML}{DC3545} % Red

%----------------------------------------------------------------------------------------
%	MODERN FEATURES
%----------------------------------------------------------------------------------------

% Define icon command to use FontAwesome 5
\newcommand{\icon}[3]{%
    \vcenteredhbox{\colorbox{stackoverflow}{\makebox(#2, #2){\textcolor{white}{\large\csname fa#1\endcsname}}}}%
    \hspace{0.2cm}%
    \vcenteredhbox{\textcolor{black}{#3}}%
}

%------------------------------------------------

% small caps and italic
\newcommand{\sci}[1]{
	\textsc{\emph{#1}}
}
% italic and underline
\newcommand{\iu}[1]{
	\emph{\underline{#1}}
}

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

%----------------------------------------------------------------------------------------
%	CHARTS
%---------------------------------------------------------------------------------------- 

\newcounter{barcount}

% Environment to hold a new bar chart
\newenvironment{barchart}[1]{ % The only parameter is the maximum bar width, in cm
	\newcommand{\barwidth}{0.35}
	\newcommand{\barsep}{0.2}
	
	% Command to add a bar to the bar chart
	\newcommand{\baritem}[2]{ % The first argument is the bar label and the second is the percentage the current bar should take up of the total width
		\pgfmathparse{##2}
		\let\perc\pgfmathresult
		
		\pgfmathparse{#1}
		\let\barsize\pgfmathresult
		
		\pgfmathparse{\barsize*##2/100}
		\let\barone\pgfmathresult
		
		\pgfmathparse{(\barwidth*\thebarcount)+(\barsep*\thebarcount)}
		\let\barx\pgfmathresult

%		\filldraw[fill=black, draw=none] (0,-\barx) rectangle (\barone,-\barx-\barwidth);		
		\filldraw[fill=stackoverflow, draw=none] (0,-\barx) rectangle (\barone,-\barx-\barwidth);
		
%		\node [label=180:\colorbox{black}{\textcolor{white}{##1}}] at (0,-\barx-0.175) {};
		\node [label=180:\textcolor{black}{##1}] at (0,-\barx-0.175) {};
		\addtocounter{barcount}{1}
	}
	\begin{tikzpicture}
		\setcounter{barcount}{0}
}{
	\end{tikzpicture}
}

%------------------------------------------------

\usepackage[most]{tcolorbox}
% ovalbox
\newtcbox{\ovalbox}{nobeforeafter,colback=stackoverflow!5!white,colframe=stackoverflow!75!white,boxrule=0.5pt,boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt}%arc=5pt,
% bubble box for a single word
\newcommand{\bbtrim}[1]{
	\ovalbox{\emph{\small #1}}
}
% bubble box for a phrase 
\newcommand{\bb}[1]{
	% \setbox0=\hbox{#1}%
	% \setlength{\@tempdima}{\dimexpr\wd0+1pt}%
	\begin{tcolorbox}[nobeforeafter,colback=stackoverflow!5!white,colframe=stackoverflow!75!white,boxrule=0.5pt,boxsep=0pt,left=1pt,right=1pt,top=1pt,bottom=1pt]%width=\@tempdima]
		\emph{\small #1}
	\end{tcolorbox}
}

%------------------------------------------------

\newcounter{a}
\newcounter{b}
\newcounter{c}

% Command to output a number of automatically-sized bubbles from a string in the format of '<size>/<label>', e.g. \bubbles{5/Eclipse, 6/git, 4/Office, 3/Inkscape, 3/Blender}
\newcommand{\bubbles}[1]{
	% Reset counters
	\setcounter{a}{0}
	\setcounter{c}{150}
	
	\begin{tikzpicture}[scale=3]
		\foreach \p/\t in {#1} {
			\addtocounter{a}{1}
			\bubble{\thea/2}{\theb}{\p/25}{\t}{1\p0}
		}
	\end{tikzpicture}
}

% Command to output a bubble at a specific position with a specific size
\newcommand{\bubble}[5]{
	\filldraw[fill=black, draw=none] (#1,0.5) circle (#3); % Bubble
	\node[label=\textcolor{black}{#4}] at (#1,0.7) {}; % Label
}

%----------------------------------------------------------------------------------------
%	CUSTOM COMPONENTS
%----------------------------------------------------------------------------------------

\newcommand{\block}[2]{
	\textcolor{stackoverflow}{\hrule}
	\vspace{\baselineskip} % Whitespace before the section title
	\begin{minipage}[t]{0.2\textwidth}
		#1
	\end{minipage}
	\begin{minipage}[t]{0.8\textwidth}
		#2
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

\newcommand{\linewithstring}[1]{
	\textcolor{stackoverflow}{\hrule}
	\vspace{0.15cm}
	\hfill\textbf{\textit{\textcolor{stackoverflow-detail}{#1}}}\\
%	\hfill\textit{\textcolor{stackoverflow-detail}{#1}}\\
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
%	\parbox[t]{0.175\textwidth}{% 17.5% of the text width of the page
%		#1 % Leftmost entry date(s) text
%	}%
%	&\parbox[t]{0.825\textwidth}{% 82.5% of the text width of the page
%		\textbf{#2}% Entry heading text
	\parbox[t]{1\textwidth}{
		\textbf{#2} - \textcolor{black}{#3}% Entry heading text
		\hfill% Horizontal whitespace
%		{\footnotesize \textbf{\textcolor{black}{#3}}}\\% Right-aligned entry qualifier text
		\textbf{\textit{\textcolor{stackoverflow-detail}{#1}}}\\% Right-aligned entry qualifier text
%		\textit{\textcolor{stackoverflow-detail}{#1}}\\% Right-aligned entry qualifier text
		#4 % Entry description text
	}\\\\}

% Environment to hold a new list of publications
\newenvironment{publicationlist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

\newcommand{\publication}[3]{% First argument for the leftmost date(s) text, second is for the bold entry heading, third is for the bold right-aligned entry qualifier and the fourth is for the entry description
	\parbox[t]{1\textwidth}{%
		\textbf{#1} \textcolor{black}{#2}\\
		#3 % Entry description text
	}\\\\}

% Command to output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}
