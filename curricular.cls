%% Start of file `curricular.cls'.
% Curricular document class
%
% Copyright (c) 2017 José L. Corrales
% based on Awesome CV by Claud D. Park
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{curricular}[2017/02/13 v0.1.4 curricular document class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to make tables with adjustable-width columns
\RequirePackage{tabularx}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to include graphics with extended arguments
\RequirePackage{graphicx}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to make colored tables
\RequirePackage{colortbl}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
% Needed to use the Source Sans Pro typeface
\RequirePackage[default,opentype]{sourcesanspro}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to loop through collections of items
\RequirePackage{moderncvcollection}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}


%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Highlight colors
\colorlet{accent}{darktext}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

% Set font for footer (default is Source Sans Pro)
\newcommand*{\footerfont}{\sourcesanspro}

% Set font for body (default is Source Sans Pro)
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\huge\headerfontlight\color{graytext} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\huge\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerpositionstyle}[1]{{\large\bodyfont\color{accent} #1}}
\newcommand*{\headeraddressstyle}[1]{{\small\headerfont\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\small\headerfont\color{lighttext} #1}}
\newcommand*{\headerquotestyle}[1]{{\normalsize\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\small\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\large\bodyfont\color{accent}\uppercase{#1}}}
\newcommand*{\subsectionstyle}[1]{{\large\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\normalsize\bodyfontlight\upshape\color{text}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\normalsize\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\normalsize\bodyfont\itshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\normalsize\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\normalsize\bodyfontlight\slshape\color{accent} #1}}
\newcommand*{\descriptionstyle}[1]{{\normalsize\bodyfontlight\upshape\color{text} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\normalsize\bodyfontlight\itshape\color{text} #1}}
\newcommand*{\honorpositionstyle}[1]{{\normalsize\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\normalsize\bodyfontlight\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\normalsize\bodyfontlight\slshape\color{accent} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\normalsize\bodyfont\bfseries\textcolor{darktext}{#1}}}
\newcommand*{\skillgroupstyle}[1]{{\normalsize\bodyfont\color{text} #1}}
\newcommand*{\skillsetstyle}[1]{{\normalsize\bodyfontlight\textcolor{text}{#1}}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's photograph (optional)
% Usage: \photo{<file name>}
\newcommand*{\photo}[1]{\def\@photo{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's fixed phone (optional)
% Usage: \phone{<phone number>}
\newcommand*{\phone}[1]{\def\@phone{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}


%-------------------------------------------------------------------------------
%                Commands for icons
%-------------------------------------------------------------------------------
\newcommand*{\iconAddress}        {{\small\faMapMarker}~}
\newcommand*{\iconMobile}         {{\large\faMobilePhone}~}
\newcommand*{\iconPhone}          {{\textnormal\faPhone}~}
\newcommand*{\iconEmail}          {{\small\faEnvelopeO}~}
\newcommand*{\iconHomepage}       {{\small\faHome}~}

\newcommand*{\iconGithub}         {{\small\faGithub}~}
\newcommand*{\iconStack}          {{\small\faStackOverflow}~}
\newcommand*{\iconLinkedin}       {{\small\faLinkedin}~}
\newcommand*{\iconTwitter}        {{\small\faTwitter}~}
\newcommand*{\iconSkype}          {{\small\faSkype}~}
\newcommand*{\iconXing}           {{\small\faXing}~}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{2mm}
\newcommand{\acvHeaderAfterPositionSkip}{1mm}
\newcommand{\acvHeaderAfterAddressSkip}{2mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{4mm}
\newcommand{\acvHeaderAfterQuoteSkip}{6mm}

% Others
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}

% Boolean value to switch section title rule fill width
\newbool{acvSectionRuleFill}
\setbool{acvSectionRuleFill}{false}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
% Define in terms of m{} to center vertically
\newcolumntype{L}[1]{%
  >{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{%
  >{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{%
  >{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to align an element of tabularx table
% Define in terms of m{} to center vertically
\renewcommand{\tabularxcolumn}[1]{m{#1}}
\newcolumntype{Y}{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}X}
\newcolumntype{Z}{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}X}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}{%
  \begin{center}%
    \ifthenelse{\isundefined{\@photo}}%
      {%
        \makecvpersonal
      }{%
        \begin{minipage}[c]{\textwidth - 4cm}
          \raggedleft\makecvpersonal
        \end{minipage}%
        \begin{minipage}[c]{4cm}
          \setlength{\fboxsep}{0pt}%
          \setlength{\fboxrule}{0.6pt}%
          \raggedleft\color{lightgray}\fbox{\includegraphics[width=3cm]{\@photo}}
        \end{minipage}%
      }%
    \ifthenelse{\isundefined{\@quote}}%
      {\\[\acvHeaderAfterQuoteSkip]}%
      {\\[\acvHeaderAfterSocialSkip]%
        \headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{center}%
}
% Define a personal information header for CV
% Usage: \makecvpersonal
\newcommand*{\makecvpersonal}{%
  \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
  \\[\acvHeaderAfterNameSkip]%
  \ifthenelse{\isundefined{\@position}}%
    {}%
    {\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
  \ifthenelse{\isundefined{\@address}}%
    {}%
    {\headeraddressstyle{\iconAddress\@address\\[\acvHeaderAfterAddressSkip]}}%
  \makecvsocial
  \ifthenelse{\isundefined{\@extrainfo}}%
    {}%
    {\\[\acvHeaderAfterSocialSkip]\headersocialstyle{\@extrainfo}}%
}
% Define a social information header for CV
% Usage: \makecvsocial
\newcommand*{\makecvsocial}{%
  \ifthenelse{\isundefined{\c@collection@cvsocial@count}}%
    {\collectionnew{cvsocial}}%
    {\setcounter{collection@cvsocial@count}{0}}%
  \ifthenelse{\isundefined{\@mobile}}%
    {}%
    {\collectionadd{cvsocial}{%
      \iconMobile\acvHeaderIconSep\@mobile%
    }}%
  \ifthenelse{\isundefined{\@phone}}%
    {}%
    {\collectionadd{cvsocial}{%
      \iconPhone\acvHeaderIconSep\@phone%
    }}%
  \ifthenelse{\isundefined{\@email}}%
    {}%
    {\collectionadd{cvsocial}{%
      \href{mailto:\@email}{\iconEmail\acvHeaderIconSep\@email}%
    }}%
  \ifthenelse{\isundefined{\@homepage}}%
    {}%
    {\collectionadd{cvsocial}{%
      \href{http://\@homepage}{\iconHomepage\acvHeaderIconSep\@homepage}%
    }}%
  \ifthenelse{\isundefined{\@github}}%
    {}%
    {\collectionadd{cvsocial}{%
      \href{https://github.com/\@github}{\iconGithub\acvHeaderIconSep\@github}%
    }}%
  \ifthenelse{\isundefined{\@stackoverflowid}}%
    {}%
    {\collectionadd{cvsocial}{%
      \href{https://stackoverflow.com/users/\@stackoverflowid}{\iconStack\acvHeaderIconSep\@stackoverflowname}%
    }}%
  \ifthenelse{\isundefined{\@linkedin}}%
    {}%
    {\collectionadd{cvsocial}{%
      \href{https://www.linkedin.com/in/\@linkedin}{\iconLinkedin\acvHeaderIconSep\@linkedin}%
    }}%
  \ifthenelse{\isundefined{\@twitter}}%
    {}%
    {\collectionadd{cvsocial}{%
      \href{https://twitter.com/\@twitter}{\iconTwitter\acvHeaderIconSep\@twitter}%
    }}%
  \ifthenelse{\isundefined{\@skype}}%
    {}%
    {\collectionadd{cvsocial}{%
      \iconSkype\acvHeaderIconSep\@skype%
    }}%
  \ifthenelse{\isundefined{\@xing}}%
    {}%
    {\collectionadd{cvsocial}{%
      \href{https://www.xing.com/profile/\@xing}{\iconXing\acvHeaderIconSep\@xing}%
    }}%
  \ifthenelse{\isundefined{\box@cvsocial}}%
    {\newsavebox{\box@cvsocial}}%
    {}%
  \ifthenelse{\isundefined{\box@temp}}%
    {\newsavebox{\box@temp}}%
    {}%
  \ifthenelse{\isundefined{\@acvHeaderSocialWidth}}%
    {\newlength{\@acvHeaderSocialWidth}}%
    {}%
  \setlength{\@acvHeaderSocialWidth}{0pt}%
  \collectionloop{cvsocial}{%
    \ifthenelse{\collectionloopid = 0}%
      {\savebox{\box@cvsocial}{\headersocialstyle{\collectionloopitem}}}%
      {%
        \savebox{\box@temp}%
          {\usebox{\box@cvsocial}\headersocialstyle{\acvHeaderSocialSep\collectionloopitem}}%
        \settowidth{\@acvHeaderSocialWidth}{\usebox{\box@temp}}%
        \ifthenelse{\lengthtest{\@acvHeaderSocialWidth > \textwidth}}%
          {%
            \usebox{\box@cvsocial}\\%
            \savebox{\box@cvsocial}{\headersocialstyle{\collectionloopitem}}%
          }{%
            \savebox{\box@cvsocial}{\usebox{\box@temp}}%
          }%
      }%
  }%
  \usebox{\box@cvsocial}%
}%

%-------------------------------------------------------------------------------
% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}} 
}

%-------------------------------------------------------------------------------
% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \sectionstyle{#1}
  \phantomsection
  \ifbool{acvSectionRuleFill}%
    {\par\nobreak\vspace*{-\baselineskip}\color{accent}\vhrulefill{0.6pt}}%
    {\color{accent}\vhrulefill{0.6pt}}%
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  \phantomsection
}

%-------------------------------------------------------------------------------
% Define an environment for cvparagraph
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{justify}
    \paragraphstyle
}{%
  \end{justify}
}

%-------------------------------------------------------------------------------
% Define an environment for cvitems
\newenvironment{cvitems}{%
  \begin{itemize}[leftmargin=2ex, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{$\smblksquare$}
  }{%
  \end{itemize}
}

%-------------------------------------------------------------------------------
% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
}{%
  \end{center}
}
% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[5]{%
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}
      {\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
      {\entrytitlestyle{#2} & \entrylocationstyle{#3} \\
      \entrypositionstyle{#1} & \entrydatestyle{#4} \\}
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  \end{tabular*}%
}

%-------------------------------------------------------------------------------
% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \center
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \tabularx{\textwidth}{C{1.5cm} X R{2.5cm}}
}{%
    \endtabularx
  \endcenter
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
\newcommand*{\cvhonor}[4]{%
  \honordatestyle{#4} & \honorpositionstyle{#1}, \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}

%-------------------------------------------------------------------------------
% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \center
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \renewcommand{\tabularxcolumn}[1]{p{##1}} % align columns vertically
    \tabularx{\textwidth}{r X}
}{%
    \endtabularx
  \endcenter
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
	\skilltypestyle{#1} & \skillsetstyle{#2} \\
}

%-------------------------------------------------------------------------------
% Define an environment for cvgroup
\newenvironment{cvgroups}{%
  \ifthenelse{\isundefined{\c@group}}
    {\newcounter{group}}
    {\setcounter{group}{0}}
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \center
    \setlength\tabcolsep{0.15cm}
    \setlength{\arrayrulewidth}{0.8pt}
    \setlength{\extrarowheight}{0pt}
    \arrayrulecolor{accent}
    \tabularx{\textwidth}{c | X}
}{%
    \endtabularx
  \endcenter
}
% Define a group of cv information(skills)
% Usage: \cvgroup{<group>}{<skillset>}
\newcommand*{\cvgroup}[2]{%
  \stepcounter{group}
  \ifnumodd{\value{group}}
    {%
      \skillgroupstyle{\cellcolor{lightgray!10}#1} &
      \skillsetstyle{%
        \vspace{-4.0mm}\begin{cvitems}#2\end{cvitems}\vspace{-4.0mm}
      } \\
    }{%
      \skillgroupstyle{#1} &
      \skillsetstyle{\cellcolor{lightgray!10}%
        \vspace{-4.0mm}\begin{cvitems}#2\end{cvitems}\vspace{-4.0mm}
      } \\
    }
}
% Define a legend for cvgroup
% Usage: \cvlegend{<title>}{<legend>}
\newcommand*{\cvlegend}[2]{%
  \cline{2-2}
  \multicolumn{2}{L{\textwidth-0.75cm}}{%
    \rule{0pt}{14pt}\hspace{0.75cm}\ifempty{#1}{#2}{#1\enspace#2}%
  }
}
% Define an entry of cvgroup legend
% Usage: \legend{<group>}{<description>}
\newcommand*{\legend}[2]{%
  \skillgroupstyle{#1}\enspace\skillsetstyle{\small#2}\enspace
}
