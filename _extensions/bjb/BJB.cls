%%
%% This is the file `BJB.cls',
%%
%% The cls file for the Brazilian Journal of Biometrics
%%
%% Adapted from the article.cls and from cup-journal.cls.
%%
%% --------------------------------------------------------------
%% Released under the LaTeX Project Public License, version 1.3c any later version.
%% The latest version of this license is in https://www.latex-project.org/lppl.txt
%% --------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BJB}[2022/04/28 v1.0 Submission to BJB]
\LoadClass[10pt,letter,twoside]{article}

% Style the sectioning elements:
\renewcommand\section{\@startsection {section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {.2ex \@plus.2ex}%
  {\normalfont\Large\sffamily\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {0.2ex \@plus .2ex}%
  {\normalfont\large\sffamily\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {0.2ex \@plus .2ex}%
  {\sffamily\itshape\bfseries}}
%\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
%  {3.25ex \@plus1ex \@minus.2ex}%
%  {-1em}%
%  {\sffamily}}
\def\@hangfrom#1{\setbox\@tempboxa\hbox{{#1}}%
  \hangindent 0pt%\wd\@tempboxa
  \noindent\box\@tempboxa}

% Approximations of commercial fonts:
\RequirePackage[scaled=0.97]{fbb}
\RequirePackage[semibold]{sourcesanspro}
\RequirePackage{sansmath}
\RequirePackage[italic,eulergreek]{mathastext}
\RequirePackage{lastpage} % For getting the last page in the first page header
\RequirePackage{enumitem} % For list styling
\setlist{noitemsep,leftmargin=\parindent}
\RequirePackage[online]{threeparttable} % For table notes
\let\TPTnoteSettingsOrig\TPTnoteSettings
\def\TPTnoteSettings{\TPTnoteSettingsOrig\scriptsize}
\RequirePackage{endnotes}
\newcommand*{\printendnotes}{%
  \def\enoteformat{\rightskip=0pt \leftskip=0pt \parindent=0pt \makeenmark}
  \def\makeenmark{\bgroup\bfseries\theenmark\enspace\egroup}
  \theendnotes
}
%%
\newcommand*\bjb@warning{\ClassWarning{bjb-journal}}
\newcommand*\bjb@ifundefined[1]{%
  \begingroup\expandafter\expandafter\expandafter\endgroup
  \expandafter\ifx\csname #1\endcsname\relax
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
}
\RequirePackage{xkeyval}
\newcommand*\bjb@keyval@bool[2]{%
  \bjb@ifundefined{bjb@#1#2}{%
    \bjb@warning{Unknown option `#2' for key #1}%
  }{%
    \@nameuse{bjb@#1#2}%
  }%
}
\newif\ifbjb@abbreviations
\newif\ifbjb@jel
\newif\ifbjb@msc
\newif\ifbjb@dates
\newif\ifbjb@copyright
\newif\ifbjb@articletitle
\newif\ifbjb@chaptertitle
\newif\ifbjb@email
\newif\ifbjb@hyperref
\newif\ifbjb@keywords
\newif\ifbjb@super
\define@key{bjb}{abbreviations}[true]{%
  \bjb@keyval@bool{abbreviations}{#1}%
}
\define@key{bjb}{jel}[true]{%
  \bjb@keyval@bool{jel}{#1}%
}
\define@key{bjb}{msc}[true]{%
  \bjb@keyval@bool{msc}{#1}%
}
\define@key{bjb}{suppmat}[true]{%
  \bjb@keyval@bool{suppmat}{#1}%
}
\define@key{bjb}{suppdata}[true]{%
  \bjb@keyval@bool{suppdata}{#1}%
}
\define@key{bjb}{orcid}[true]{%
  \bjb@keyval@bool{orcid}{#1}%
}
\define@key{bjb}{ack}[true]{%
  \bjb@keyval@bool{ack}{#1}%
}
\define@key{bjb}{contrib}[true]{%
  \bjb@keyval@bool{contrib}{#1}%
}
\define@key{bjb}{financial}[true]{%
  \bjb@keyval@bool{financial}{#1}%
}
\define@key{bjb}{conflicts}[true]{%
  \bjb@keyval@bool{conflicts}{#1}%
}
\define@key{bjb}{ethics}[true]{%
  \bjb@keyval@bool{ethics}{#1}%
}
\define@key{bjb}{dates}[true]{%
  \bjb@keyval@bool{dates}{#1}%
}
\define@key{bjb}{copyright}[true]{%
  \bjb@keyval@bool{copyright}{#1}%
}
\define@key{bjb}{articletitle}[true]{%
  \bjb@keyval@bool{articletitle}{#1}%
}
\define@key{bjb}{chaptertitle}[true]{%
  \bjb@keyval@bool{chaptertitle}{#1}%
}
\define@key{bjb}{email}[true]{%
  \bjb@keyval@bool{email}{#1}%
}
\define@key{bjb}{hyperref}[true]{%
  \bjb@keyval@bool{hyperref}{#1}%
}
\define@key{bjb}{keywords}[true]{%
  \bjb@keyval@bool{keywords}{#1}%
}
\define@key{bjb}{super}[true]{%
  \bjb@keyval@bool{super}{#1}%
}
\define@key{bjb}{usetitle}[true]{%
  \bjb@keyval@bool{articletitle}{#1}%
}
\newcommand*\bjb@journal{jbjbat}
\newcommand*\bjb@doi{\bjb@warning{No DOI provided}}
\newcommand*\bjb@layout{traditional}
\newcommand*\bjb@manuscript{article}
\newcommand*\bjb@year{\bjb@warning{No year provided}}
\newcommand*\bjb@vol{\bjb@warning{No volume provided}}
\newcommand*\bjb@maxauthors{15}
\define@key{bjb}{journal}{%
  \def\bjb@journal{#1}%
}
\define@key{bjb}{layout}{%
  \def\bjb@layout{#1}%
}
\define@key{bjb}{manuscript}{%
  \AtBeginDocument{\def\bjb@manuscript{#1}}%
}
\define@key{bjb}{year}{%
  \def\bjb@year{#1}%
}
\define@key{bjb}{volume}{%
  \def\bjb@vol{#1}%
}
\ProcessOptionsX*<bjb>
%\newcommand*\bjb@manuscript@communication{communication}
%\newcommand*\bjb@manuscript@letter{letter}
%\newcommand*\bjb@manuscript@note{note}
%\newcommand*\bjb@manuscript@review{review}
%\newcommand*\bjb@manuscript@suppinfo{suppinfo}
\setkeys{bjb}{
  articletitle,
  super,
  dates,
  copyright,
  abbreviations,
  jel,
  msc,
  keywords,
}
\RequirePackage{geometry}
\RequirePackage{changepage}
\RequirePackage{stringstrings}
\RequirePackage[absolute]{textpos}
\RequirePackage[table,svgnames]{xcolor}

\RequirePackage{
  caption,
  floatrow,
  graphicx,
  url,
  mdframed,
  mfirstuc,
%   footmisc,
  alphalph
}
\urlstyle{same}
\captionsetup{
  font={
    footnotesize,
    sf,
%    sansmath
  },
  labelfont=bf,
  labelsep=period
}
\floatsetup{
  font={
    sf,
%    sansmath,
    footnotesize
  }
}
\colorlet{structure@color}{black}
\def\@seccntformat#1{\@ifundefined{#1@cntformat}%
   {\csname the#1\endcsname\quad}%  default
   {\csname #1@cntformat\endcsname}% individual control
   }
   \def\section@cntformat{\thesection.\quad}
\renewcommand\appendix{\par
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \gdef\thesection{Appendix \@arabic\c@section}
}
\newmdenv[backgroundcolor=structure@color!15,hidealllines=true,leftmargin=3mm,rightmargin=3mm,innertopmargin=2mm,innerbottommargin=3mm,frametitle={\abstractfont\sffamily Abstract},frametitleaboveskip=3mm,frametitlebelowskip=0mm]{bjb@abstract@box}
\let\abstract@org\abstract
\def\abstract{\bjb@abstract@box\small}
\def\endabstract{\endbjb@abstract@box}
\ifbjb@hyperref
  \expandafter\RequirePackage
\else
  \expandafter\@gobble
\fi
  {hyperref}
\renewcommand*{\title}[2][]{%
  \gdef\bjb@title@short{#1}%
  \gdef\@title{#2}%
  \ifx\bjb@title@short\@empty
    \global\let\bjb@title@short\@title
  \fi
}
\@onlypreamble\title
\newcount\bjb@author@cnt
\newcount\bjb@affil@cnt
\newcount\bjb@affil@alt@cnt
\newcount\bjb@footnote@cnt
\newcount\bjb@affil@marker@cnt
\def\author#1{%
  \global\advance\bjb@author@cnt\@ne\relax
  \expandafter\gdef\csname @author@\@roman\bjb@author@cnt\endcsname{#1}%
  \begingroup
    \advance\bjb@affil@cnt\@ne
    \expandafter\xdef\csname @author@affil@\@roman
      \bjb@author@cnt\endcsname
      {\the\bjb@affil@cnt}%
  \endgroup
}
\@onlypreamble\author
\def\and{%
  \bjb@warning{%
    \string\and\space not used by the bjb-journal class: please see
    the\MessageBreak package documentation for details%
  }%
}
\def\thanks{%
  \bjb@warning{%
    \string\thanks\space not used by the bjb-journal class: please see
    the\MessageBreak the package documentation for details%
  }%
}
\newcommand*\affiliation[2][\relax]{%
  \ifnum\bjb@author@cnt>\z@\relax
    \bjb@affil@ifdup{#2}{%
      \bjb@affil@swap{#2}%
    }{%
      \global\advance\bjb@affil@cnt\@ne\relax
      \expandafter\gdef\csname @address@\@roman\bjb@affil@cnt\endcsname
        {#2}%
      \ifx\relax#1\relax
        \expandafter\gdef\csname @affil@\@roman\bjb@affil@cnt\endcsname
          {#2}%
      \else
        \expandafter\gdef\csname @affil@\@roman\bjb@affil@cnt\endcsname
          {#1}%
      \fi
    }%
  \else
    \bjb@warning{Affiliation with no author}%
  \fi
}
\@onlypreamble\affiliation
\newcommand*\bjb@affil@ifdup[1]{%
  \begingroup
    \def\@tempa{#1}%
    \@tempswafalse
    \@tempcnta\z@\relax
    \bjb@affil@ifdup@aux
    \if@tempswa
      \aftergroup\@firstoftwo
    \else
      \aftergroup\@secondoftwo
    \fi
  \endgroup
}
\newcommand*\bjb@affil@ifdup@aux{%
  \advance\@tempcnta\@ne\relax
  \expandafter\expandafter\expandafter\def\expandafter\expandafter
    \expandafter\@tempb\expandafter\expandafter\expandafter
    {\csname @address@\@roman\@tempcnta\endcsname}%
  \ifx\@tempa\@tempb
    \expandafter\@tempswatrue
  \else
    \ifnum\@tempcnta<\bjb@affil@cnt\relax
      \expandafter\expandafter\expandafter\bjb@affil@ifdup@aux
    \fi
  \fi
}
\newcommand*\bjb@affil@swap[1]{%
  \begingroup
    \def\@tempa{#1}%
    \@tempcnta\z@\relax
    \@tempcntb\z@\relax
    \bjb@affil@ifdup@aux
    \advance\bjb@affil@cnt\@ne\relax
    \bjb@affil@swap@aux
  \endgroup
}
\newcommand*\bjb@affil@swap@aux{%
  \advance\@tempcntb\@ne\relax
  \expandafter\ifnum\csname @author@affil@\@roman\@tempcntb\endcsname
    = \bjb@affil@cnt\relax
    \expandafter\xdef\csname @author@affil@\@roman\@tempcntb\endcsname{%
      \the\@tempcnta
    }%
  \fi
  \ifnum\@tempcntb<\bjb@author@cnt\relax
    \expandafter\bjb@affil@swap@aux
  \fi
}
\newcommand*\alsoaffiliation[2][\relax]{%
  \ifnum\bjb@author@cnt>\z@\relax
    \bjb@affil@ifdup{#2}{%
      \bjb@alsoaffil@find{#2}%
    }{%
      \global\advance\bjb@affil@cnt\@ne\relax
      \@tempcnta\bjb@affil@cnt\relax
      \expandafter\gdef\csname @address@\@roman\bjb@affil@cnt\endcsname
        {#2}%
      \ifx\relax#1\relax
        \expandafter\gdef\csname @affil@\@roman\bjb@affil@cnt\endcsname
          {#2}%
      \else
        \expandafter\gdef\csname @affil@\@roman\bjb@affil@cnt\endcsname
          {#1}%
      \fi
    }%
    \@ifundefined{@author@alsoaffil@\@roman\bjb@author@cnt}{%
      \expandafter\xdef\csname @author@alsoaffil@\@roman\bjb@author@cnt
        \endcsname{\the\@tempcnta}%
    }{%
      \expandafter\xdef\csname @author@alsoaffil@\@roman\bjb@author@cnt
        \endcsname{%
        \csname @author@alsoaffil@\@roman\bjb@author@cnt\endcsname
        ,\the\@tempcnta
      }%
    }%
  \else
    \bjb@warning{Affiliation with no author}%
  \fi
}
\newcommand*\bjb@alsoaffil@find[1]{%
  \begingroup
    \def\@tempa{#1}%
    \@tempcnta\z@\relax
    \@tempcntb\z@\relax
    \bjb@affil@ifdup@aux
  \expandafter\endgroup
  \expandafter\@tempcnta\the\@tempcnta\relax
}
\newcommand*\altaffiliation[1]{%
  \ifnum\bjb@author@cnt>\z@\relax
    \begingroup
      \bjb@altaffil@ifdup{#1}{%
        \expandafter\xdef\csname @author@altaffil@\\bjb@author@cnt
          \endcsname{\the\@tempcnta}%
      }{%
        \global\advance\bjb@affil@alt@cnt\@ne\relax
        \expandafter\gdef\csname @altaffil@\\bjb@affil@alt@cnt
          \endcsname{#1}%
        \expandafter\xdef\csname @author@altaffil@\@roman\bjb@author@cnt
          \endcsname{\the\bjb@affil@alt@cnt}%
      }%
    \endgroup
  \else
    \bjb@warning{Affiliation with no author}%
  \fi
}
\@onlypreamble\altaffiliation
\newcommand*\bjb@altaffil@ifdup[1]{%
  \def\@tempa{#1}%
  \@tempswafalse
  \@tempcnta\z@\relax
  \ifnum\bjb@affil@alt@cnt>\z@\relax
    \expandafter\bjb@altaffil@ifdup@aux
  \fi
  \if@tempswa
    \expandafter\@firstoftwo
  \else
    \expandafter\@secondoftwo
  \fi
}
\newcommand*\bjb@altaffil@ifdup@aux{%
  \advance\@tempcnta\@ne\relax
  \expandafter\expandafter\expandafter\def\expandafter\expandafter
    \expandafter\@tempb\expandafter\expandafter\expandafter
    {\csname @altaffil@\@roman\@tempcnta\endcsname}%
  \ifx\@tempa\@tempb
    \expandafter\@tempswatrue
  \else
    \ifnum\@tempcnta<\bjb@affil@alt@cnt\relax
      \expandafter\expandafter\expandafter\bjb@altaffil@ifdup@aux
    \fi
  \fi
}
\newcommand*\email[2][]{%
  \ifnum\bjb@author@cnt>\z@\relax
    \bjb@emailtrue%
    \expandafter\gdef\csname @emailname@\@roman\bjb@author@cnt\endcsname
      {#1}%
    \expandafter\gdef\csname @email@\@roman\bjb@author@cnt\endcsname
      {#2}%
  \else
    \bjb@warning{E-mail with no author}%
  \fi
}
\@onlypreamble\email
%
\newcommand*\abbreviations[1]{%
  \gdef\@abbreviations{#1}%
}
\newcommand*\@abbreviations{}
\@onlypreamble\abbreviations
\newcommand*\keywords[1]{%
  \gdef\@keywords{#1}%
}
\newcommand*\@keywords{}
\@onlypreamble\keywords
\newcommand*\bjb@abbreviations@print{%
  \ifx\@abbreviations\@empty\else
    {\noindent\bfseries Abbreviations: }
    \@abbreviations
    \par
  \fi
}
\newcommand*\jel[1]{%
  \gdef\@jel{#1}%
}
\newcommand*\@jel{}
\@onlypreamble\jel
\newcommand*\bjb@jel@print{%
  \ifx\@jel\@empty\else
    {\noindent\bfseries JEL classification: }
    \@jel
    \par
  \fi
}
\newcommand*\msc[1]{%
  \gdef\@msc{#1}%
}
\newcommand*\@msc{}
\@onlypreamble\msc
\newcommand*\bjb@msc@print{%
  \ifx\@msc\@empty\else
    {\noindent\bfseries MSC Codes: }
    \@msc
    \par
  \fi
}
\newcommand*\bjb@keywords@print{%
  \ifx\@keywords\@empty\else
    {\noindent\bfseries Keywords: }
    \@keywords
    \par
  \fi
}
\newcommand*\doi[1]{\gdef\bjb@doi{#1}}
\@onlypreamble\doi

\newcommand*\received[1] {\gdef\bjb@recvd{#1}}
\newcommand*\revised[1]  {\gdef\bjb@revd{#1}}
\newcommand*\accepted[1] {\gdef\bjb@accptd{#1}}
\newcommand*\published[1]{\gdef\bjb@publd{#1}}
\newlength\bjb@space@pre@title
\setlength\bjb@space@pre@title{1em}
\newlength\bjb@space@post@title
\setlength\bjb@space@post@title{1em}
\newlength\bjb@space@post@author
\setlength\bjb@space@post@author{0.5em}
\newlength\bjb@space@post@address
\setlength\bjb@space@post@address{0pt}
\newlength\bjb@space@post@email
\setlength\bjb@space@post@email{1.5em}
\newlength\bjb@space@post@date
\setlength\bjb@space@post@date{0.5em}
\newlength\bjb@space@inter@extra
\setlength\bjb@space@inter@extra{0.5em}
\newlength\bjb@maketitle@width
\setlength\bjb@maketitle@width{\textwidth}
\newcommand*\affilsize{\footnotesize}
\newcommand*\authorsize{\normalsize}
\newcommand*\emailsize{\footnotesize}
\newcommand*\titlesize{\LARGE}
\newcommand*\datesize{\footnotesize}
\newcommand*\firstheadsize{\scriptsize}
\newcommand*\affilfont{\footnotesize}
\newcommand*\authorfont{}
\newcommand*\emailfont{\footnotesize}
\newcommand*\emailsymbol{$^\star$}
\newcommand*\titlefont{\sffamily\bfseries\raggedright\color{structure@color}}
\newcommand*\datefont{\footnotesize}
\newcommand*\extrasfont{\footnotesize}
\newcommand*\abstractfont{\small}
\newcommand*\journalnamefont{\itshape}
\newcommand*\volumefont{\bfseries}
\newcommand*\bjb@etal{\emph{et al.}}
\def\ps@plain{
  \renewcommand{\@oddhead}{\hfill{\journalnamefont\bjb@journal@name}\qquad\thepage}%
  \renewcommand{\@evenhead}{\thepage\qquad\journalnamefont\bjb@journal@name\hfill}%
%  \renewcommand{\@evenhead}{\thepage\qquad\@author@i\space\bjb@etal\hfill}%
  \renewcommand{\@evenfoot}{}%
  \renewcommand{\@oddfoot}{\@evenfoot}%
}
\pagestyle{plain}
\newcommand*\bjb@copyright@notice{\scriptsize%
  \noindent \textcopyright\ Brazilian Journal of Biometrics. This is an open access article distributed under the terms of the Creative Commons Attribution licence (\url{http://creativecommons.org/licenses/by/4.0/})
}
\def\@maketitle{%
  \setlength\parindent{\z@}
  \ifnum\bjb@author@cnt<\z@\relax
    \bjb@warning{No authors defined: At least one author is required}%
  \fi
  \newpage\vspace*{\dimexpr-\headsep-\headheight\relax}
  \parbox[b]{\dimexpr\textwidth-26mm\relax}{%
    \firstheadsize{\journalnamefont\bjb@journal@name}, {\volumefont\bjb@vol}, \thepage--\pageref{LastPage} (\bjb@year)
    \par doi:{\bjb@doi}}\hfill\\%\includegraphics[width=26mm]{bjb_logo.png}\par
    \includegraphics[width=1.0\textwidth]{bjb_logo.png}\par
  \vspace*{\baselineskip}
  {\sffamily\bfseries\color{structure@color}\MakeUppercase{\convertchar{\bjb@manuscript}{-}{ }}\par}
  \vspace*{\bjb@space@pre@title}%
        {%
          \titlefont
          \titlesize
          \let\@fnsymbol\bjb@author@fnsymbol
          \let\footnote@org\footnote
          \let\footnote\bjb@title@footnote
          \bjb@maketitle@suppinfo \@title
          \bjb@title@footnote@check
          \global\bjb@footnote@cnt\c@footnote
          \@maketitle@title@hook
          \par
        }%
        \vspace*{\bjb@space@post@title}%
        {%
          \authorsize
          \authorfont
          \frenchspacing
          \bjb@author@list
          \par
        }%
        \vspace*{\bjb@space@post@author}%
        {%
          \affilsize
          \affilfont
          \bjb@address@list
          \par
        }%
        \vspace*{\bjb@space@post@address}%
        {%
          \emailsize
          \emailfont
          \ifbjb@email
            \expandafter\bjb@contact@details
            \par
            \vspace*{\bjb@space@post@email}%
          \fi
        }%
        {%
          \datesize
          \datefont
          \ifbjb@dates
           (Received: \bjb@recvd; Revised: \bjb@revd; Accepted: \bjb@accptd; Published: \bjb@publd)
            %\vspace*{\bjb@space@post@date}%
          %\fi
          \ifbjb@copyright
            \bgroup\let\thefootnote\relax
            \footnote{\bjb@copyright@notice}
            \egroup
          \fi
        }%
}
\newcommand*\@maketitle@title@hook{}
\newcommand*\bjb@maketitle@suppinfo{%
  \ifx\bjb@manuscript\bjb@manuscript@suppinfo
    Supporting Information:\\
  \fi
}
\newcommand*\bjb@title@footnote[1]{%
  \footnotemark
  \g@addto@macro\@thanks{\footnotetext{#1}}%
}
\newcommand\bjb@title@footnote@check{%
  \ifx\@thanks\@empty
  \else
    \begingroup
      \toks@=\expandafter{\@thanks}%
      \xdef\@thanks{%
        \begingroup
          \let\noexpand\@fnsymbol\noexpand\bjb@author@fnsymbol
          \the\toks@
        \endgroup
      }%
    \endgroup
  \fi
}
\newcommand*\bjb@contact@details{%
  { \emailsymbol{}Corresponding author. Email: \bjb@email@list}%
  \bjb@number@list
}
\let\@thanks\@empty
\newcommand*\bjb@author@list{%
  \@tempcnta\z@\relax
  \ifnum\bjb@author@cnt=\z@\relax\else
    \expandafter\bjb@author@list@main
  \fi
}
\newcommand*\bjb@author@footnotes{}
\newcommand*\bjb@author@list@main{%
  \advance\@tempcnta\@ne\relax
  \def\bjb@author@footnotes{}%
  \bjb@author@list@and
  \space
  \@nameuse{@author@\@roman\@tempcnta}%
  \bjb@author@list@comma
  \bjb@author@star
  \bjb@author@affil
  \bjb@author@affil@also
  \bjb@author@affil@alt
  \ifx\@empty\bjb@author@footnotes\else
    \textsuperscript{\bjb@author@footnotes}%
  \fi
  \ifnum\@tempcnta<\bjb@author@cnt\relax
    \expandafter\bjb@author@list@main
  \fi
}
\newcommand*\bjb@author@list@and{%
  \ifnum\bjb@author@cnt=\@ne\relax\else
    \ifnum\@tempcnta=\bjb@author@cnt\relax
      \space and%
    \fi
  \fi
}
\newcommand*\bjb@author@list@comma{%
  \ifnum\bjb@author@cnt>\tw@\relax
    \ifnum\@tempcnta<\bjb@author@cnt\relax
      ,%
    \fi
  \fi
}
\newcommand*\bjb@author@star{%
  \bjb@ifundefined{@email@\@roman\@tempcnta}{}{%
    \bjb@author@star@aux
  }%
}
\newcommand*\bjb@author@star@aux{%
  \protected@edef\bjb@author@footnotes{%
    % \bjb@author@fnsymbol{\z@}%
%    \emailsymbol%
    \ifnum\bjb@affil@cnt>\@ne\relax
      %,%
    \else
      \ifnum\bjb@affil@alt@cnt>\z@\relax
        %,%
      \fi
    \fi
  }%
  \emailsymbol%
}
\newcommand*\bjb@author@affil{%
  \bjb@ifundefined{%
    @affil@\@roman\csname @author@affil@\@roman\@tempcnta\endcsname
  }{%
    \bjb@warning{%
      No affiliation given for author\MessageBreak
      \@nameuse{@author@\@roman\@tempcnta}%
    }%
  }{%
    \bjb@author@affil@aux
  }%
}
\newcommand*\bjb@author@affil@aux{%
  \ifnum\bjb@affil@cnt>\@ne\relax
    \expandafter\bjb@affil@marker@cnt\csname @author@affil@\@roman
      \@tempcnta\endcsname\relax
    \advance\bjb@affil@marker@cnt\bjb@footnote@cnt\relax
    \protected@edef\bjb@author@footnotes{%
      \bjb@author@footnotes
      \bjb@author@fnsymbol{\bjb@affil@marker@cnt}%
    }%
  \else
    \ifnum\bjb@affil@alt@cnt>\z@\relax
      \bjb@affil@marker@cnt\@ne\relax
      \advance\bjb@affil@marker@cnt\bjb@footnote@cnt\relax
      \protected@edef\bjb@author@footnotes{%
        \bjb@author@footnotes
        \bjb@author@fnsymbol{\bjb@affil@marker@cnt}%
      }%
    \fi
  \fi
}
\newcommand*\bjb@author@affil@also{%
  \bjb@ifundefined{@author@alsoaffil@\@roman\@tempcnta}{}{%
    \bjb@author@affil@also@aux
  }%
}
\newcommand*\bjb@author@affil@also@aux{%
  \expandafter\@for\expandafter\@tempa\expandafter:\expandafter
    =\csname @author@alsoaffil@\@roman\@tempcnta\endcsname\do{%
    \bjb@affil@marker@cnt\@tempa\relax
    \advance\bjb@affil@marker@cnt\bjb@footnote@cnt\relax
    \protected@edef\bjb@author@footnotes{%
      \bjb@author@footnotes
      %,%
      \bjb@author@fnsymbol{\bjb@affil@marker@cnt}%
    }%
  }%
}
\newcommand*\bjb@author@affil@alt{%
  \bjb@ifundefined{@author@altaffil@\@roman\@tempcnta}{}{%
    \bjb@author@affil@alt@aux
  }%
}
\newcommand*\bjb@author@affil@alt@aux{%
  \expandafter\bjb@affil@marker@cnt
    \csname @author@altaffil@\@roman\@tempcnta\endcsname\relax
  \advance\bjb@affil@marker@cnt\bjb@affil@cnt\relax
  \advance\bjb@affil@marker@cnt\bjb@footnote@cnt\relax
  \protected@edef\bjb@author@footnotes{%
    \bjb@author@footnotes
    %,%
    \bjb@author@fnsymbol{\bjb@affil@marker@cnt}%
  }%
}
\newcommand*{\bjb@author@fnsymbol}[1]{%
  \ensuremath{%
    \expandafter\bjb@author@fnsymbol@aux\expandafter{\number#1}%
  }%
}
\newcommand*{\bjb@author@fnsymbol@aux}[1]{%
  \ifnum#1>10 %
    \expandafter\bjb@author@fnsymbol@loop
  \else
    \expandafter\bjb@author@fnsymbol@symbol
  \fi
    {#1}%
}
\newcommand*{\bjb@author@fnsymbol@loop}[1]{%
   \bjb@author@fnsymbol@loop@aux@i#1%
}
\newcommand*{\bjb@author@fnsymbol@loop@aux@i}[2]{%
  \bjb@author@fnsymbol@symbol{\ifnum#2=0 10\else #2\fi}%
  \expandafter\bjb@author@fnsymbol@loop@aux@ii\romannumeral #1000Q{}%
    {\bjb@author@fnsymbol@symbol{\ifnum#2=0 10\else #2\fi}}%
}
\newcommand*{\bjb@author@fnsymbol@loop@aux@ii}[1]{%
  \@nameuse{bjb@author@fnsymbol@loop@aux@#1}%
}
\def\bjb@author@fnsymbol@loop@aux@m#1Q#2#3{%
  \bjb@author@fnsymbol@loop@aux@ii#1Q{#2#3}{#3}%
}
\newcommand*{\bjb@author@fnsymbol@loop@aux@Q}[2]{#1}
\newcommand*{\bjb@author@fnsymbol@symbol}[1]{%
  \ifcase #1 *\or
    \dagger\or
      \ddagger\or
        \P\or
          \S\or
            \|\or
              \bot\or
                \#\or
                  @\or
                    \triangle\or
                      \nabla
    \fi
}
\newcommand*\bjb@address@list{%
  \ifnum\bjb@affil@cnt>\z@
    \expandafter\bjb@address@list@auxi
  \else
    \bjb@warning{No affiliations: at least one affiliation is needed}%
  \fi
}
\newcommand*\bjb@address@list@auxi{%
  \ifnum0%
    \ifnum\bjb@affil@cnt>\@ne    1\fi
    \ifnum\bjb@affil@alt@cnt>\z@ 1\fi
      >\z@
    \expandafter\bjb@address@list@auxii
  \else
    \@address@i\par
  \fi
}
\newcommand*\bjb@address@list@auxii{%
  \@tempcnta\z@
  \bjb@affil@marker@cnt\bjb@footnote@cnt
  \loop\ifnum\@tempcnta<\bjb@affil@cnt
    \advance\@tempcnta\@ne
    \advance\bjb@affil@marker@cnt\@ne
    \bjb@author@fnsymbol{\bjb@affil@marker@cnt}%
    \@nameuse{@address@\@roman\@tempcnta}\par% and % TODO handle multiples
  \repeat
  \@tempcnta\z@
  \loop\ifnum\@tempcnta<\bjb@affil@cnt
    \advance\@tempcnta\@ne
    \advance\bjb@affil@marker@cnt\@ne
    \bjb@ifundefined{@altaffil@\@roman\@tempcnta}
      {}
      {%
        \bjb@author@fnsymbol{\bjb@affil@marker@cnt}%
        \@nameuse{@altaffil@\@roman\@tempcnta}\par
      }%
  \repeat
}
\newcommand*\bjb@fnsymbol@org{}
\newcommand*\bjb@affil@list{%
  \let\bjb@fnsymbol@org\@fnsymbol
  \let\@fnsymbol\bjb@author@fnsymbol
  \@tempcnta\z@\relax
  \@tempcntb\z@\relax
  \ifnum\bjb@affil@cnt>\@ne\relax
    \expandafter\bjb@affil@list@aux
  \else
    \ifnum\bjb@affil@alt@cnt>\z@\relax
      \bjb@affil@marker@cnt\@ne\relax
      \advance\bjb@affil@marker@cnt\bjb@footnote@cnt\relax
      \footnotetext[^\bjb@affil@marker@cnt]{\@affil@i}%
      \@tempcnta\@ne\relax
    \fi
  \fi
  \ifnum\bjb@affil@alt@cnt>\z@\relax
    \expandafter\bjb@affil@alt@list
  \fi
  \let\@fnsymbol\bjb@fnsymbol@org
}
\newcommand*\bjb@affil@list@aux{%
  \advance\@tempcnta\@ne\relax
  \bjb@affil@marker@cnt\@tempcnta\relax
  \advance\bjb@affil@marker@cnt\bjb@footnote@cnt\relax
  \footnotetext[\bjb@affil@marker@cnt]{%
    \@nameuse{@affil@\@roman\@tempcnta}%
  }%
  \ifnum\@tempcnta<\bjb@affil@cnt\relax
    \expandafter\bjb@affil@list@aux
  \fi
}
\newcommand*\bjb@affil@alt@list{%
  \advance\@tempcntb\@ne\relax
  \bjb@ifundefined{@altaffil@\@roman\@tempcntb}{}{%
    \bjb@altaffil@foot@aux
  }
  \ifnum\@tempcntb<\bjb@author@cnt\relax
    \expandafter\bjb@affil@alt@list
  \fi
}
\newcommand*\bjb@altaffil@foot@aux{%
  \advance\@tempcnta\@ne\relax
  \bjb@affil@marker@cnt\@tempcnta\relax
  \advance\bjb@affil@marker@cnt\bjb@footnote@cnt\relax
  \footnotetext[\bjb@affil@marker@cnt]{%
    \@nameuse{@altaffil@\@roman\@tempcntb}%
  }%
}
\newcommand*\bjb@email@list@font{}
\newcommand*\bjb@email@list{%
  \begingroup
    \def\UrlFont{\bjb@email@list@font}%
    \@tempcnta\z@\relax
    \@tempcntb\z@\relax
    \bjb@email@list@aux
    \ifnum\@tempcntb=\z@\relax
      \bjb@warning{%
        No e-mail given:\MessageBreak
        at lest one author must have a contact e-mail%
      }%
    \fi
  \endgroup
}
\newcommand*\bjb@email@list@aux{%
  \advance\@tempcnta\@ne\relax
  \ifnum\@tempcnta>\bjb@author@cnt\relax\else
    \bjb@ifundefined{@email@\@roman\@tempcnta}{}{%
      \advance\@tempcntb\@ne\relax
      \ifnum\@tempcntb>\@ne\relax
        ;
      \fi
      \expandafter\expandafter\expandafter\url\expandafter
        \expandafter\expandafter{%
           \csname @email@\@roman\@tempcnta\endcsname
      }%
    }%
    \expandafter\bjb@email@list@aux
  \fi
}
\newcommand*\bjb@number@list{%
  \begingroup
    \bjb@number@list@aux@i{phone}%
    \let\@tempb\@tempa
    \bjb@number@list@aux@i{fax}%
    \ifx\@tempa\@empty
      \let\@tempa\@tempb
    \else
      \ifx\@tempb\@empty\else
        \protected@edef\@tempa{%
          \@tempb.\space\@tempa
        }%
      \fi
    \fi
    \ifx\@tempa\@empty\else
      \par
      \@tempa
    \fi
  \endgroup
}
\newcommand*\bjb@number@list@aux@i[1]{%
  \def\@tempa{}%
  \@tempcnta\z@\relax
  \def\bjb@number@list@aux@ii{%
    \advance\@tempcnta\@ne\relax
    \ifnum\@tempcnta>\bjb@author@cnt\relax\else
      \bjb@ifundefined{@#1@\@roman\@tempcnta}{}{%
        \bjb@ifundefined{@email@\@roman\@tempcnta}{}{%
          \ifx\@tempa\@empty
            \edef\@tempa{%
              \@nameuse{@#1@\@roman\@tempcnta}%
            }%
          \else
            \edef\@tempa{%
              \@tempa
              ;
              \@nameuse{@#1@\@roman\@tempcnta}%
            }%
          \fi
        }%
      }%
      \expandafter\bjb@number@list@aux@ii
    \fi
  }%
  \bjb@number@list@aux@ii
  \ifx\@tempa\@empty\else
    \protected@edef\@tempa{%
      \MakeUppercase#1: \@tempa
    }%
  \fi
}
\newcommand*\bjb@number@list@aux@ii{}
\g@addto@macro\endabstract{%
  \aftergroup\bjb@abstract@extras
}
\newcommand*{\bjb@abstract@extras}{%
  \bgroup
  \extrasfont
  \ifbjb@keywords
    \bjb@keywords@print
    \par\vspace*{\bjb@space@inter@extra}
  \fi
  \ifbjb@jel
    \bjb@jel@print
    \par\vspace*{\bjb@space@inter@extra}
  \fi
  \ifbjb@msc
    \bjb@msc@print
    \par\vspace*{\bjb@space@inter@extra}
  \fi
  \ifbjb@abbreviations
    \bjb@abbreviations@print
    \par\vspace*{\bjb@space@inter@extra}
  \fi
  \egroup
}
\newcommand*\bjb@maketitle@extras{%
  \bjb@maketitle@extras@hook
}
\newcommand*\bjb@maketitle@extras@hook{}
\g@addto@macro{\maketitle}{\bjb@maketitle@extras\thispagestyle{empty}}
\g@addto@macro{\document}{\maketitle}
\newfloat{scheme}{htbp}{los}
\floatname{scheme}{Scheme}
\newfloat{chart}{htbp}{loc}
\floatname{chart}{Chart}
\newfloat{graph}{htbp}{loh}
\floatname{graph}{Graph}
%\newcommand*\schemename{Scheme}
%\newcommand*\chartname{Chart}
%\newcommand*\graphname{Graph}
\floatplacement{table}{htbp}
\floatplacement{figure}{htbp}
\floatstyle{plaintop}
\restylefloat{table}
\let\bjb@floatboxreset\@floatboxreset
\def\@floatboxreset{%
  \centering
  \bjb@floatboxreset
}
\AtEndOfClass{%
  \colorlet{tbrowcolor}{structure@color!10}
  \colorlet{tbheadcolor}{structure@color!30}
  \arrayrulecolor{structure@color}
}
%% From https://tex.stackexchange.com/a/32366/226
\newcommand*{\trfiller}{%
  \arrayrulecolor{tbrowcolor}% change to cell colour
  \specialrule{\heavyrulewidth}{0pt}{-\heavyrulewidth}% "invisible" rule
  \arrayrulecolor{structure@color}% revert to regular line colour
}
\newcommand*{\thfiller}{%
  \arrayrulecolor{tbheadcolor}% change to cell colour
  \specialrule{\heavyrulewidth}{0pt}{-\heavyrulewidth}% "invisible" rule
  \arrayrulecolor{structure@color}% revert to regular line colour
}
\newcommand{\headrow}{\rowcolor{tbheadcolor}}
\newcommand{\patchbjbtables}{%
  \rowcolors*{1}{tbrowcolor}{tbrowcolor}%
  \setlength{\aboverulesep}{0pt}%
  \setlength{\belowrulesep}{0pt}%
  \setlength{\extrarowheight}{.75ex}%
}
\AtBeginEnvironment{table}{\patchbjbtables}
\AtBeginEnvironment{table*}{\patchbjbtables}
\newcommand*\bjb@section{}
\let\bjb@section\section
\newcommand*\bjb@subsection{}
\let\bjb@subsection\subsection
\newcommand*\bjb@subsubsection{}
\let\bjb@subsubsection\subsubsection
\newcommand*\bjb@startsection@orig{}
\let\bjb@startsection@orig\@startsection
\newcommand\bjb@startsection[6]{%
 \if@noskipsec \leavevmode \fi
 \par \@tempskipa #4\relax
 \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
 \@ifstar{\@dblarg{\@sect{#1}{\@m}{#3}{#4}{#5}{#6}}}%
         {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}%
}
\let\@startsection\bjb@startsection
\newcommand*\bjb@startsection@alt[6]{%
  \if@noskipsec \leavevmode \fi
  \par \@tempskipa #4\relax
  \@afterindenttrue
 \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
 \if@nobreak \everypar{}\else
     \addpenalty\@secpenalty\addvspace\@tempskipa\fi
  \@ifstar{\@ssect{#3}{#4}{#5}{#6}}
          {\@ssect{#3}{#4}{#5}{#6}}%
}
\newcommand*\bjb@sections@none{%
  \@ifstar{%
    \bjb@sections@none@aux
  }{%
    \bjb@sections@none@aux
  }%
}
\newcommand*\bjb@sections@none@aux[2][]{%
  \bjb@warning{%
    (Sub)section `#2' ignored%
  }%
}
\patchcmd{\@ssect}{#4}{\color{structure@color}#4}{}{}
\patchcmd{\@sect}{#6}{\color{structure@color}#6}{}{}
\newcommand*\SectionNumbersOff{%
  \let\@startsection\bjb@startsection@alt
}
\@onlypreamble\SectionNumbersOff
\newcommand*\SectionNumbersOn{%
  \let\@startsection\bjb@startsection
}
\@onlypreamble\SectionNumbersOn
\newcommand*\SectionsOff{%
  \let\section\bjb@sections@none
  \let\subsection\bjb@sections@none
  \let\subsubsection\bjb@sections@none
}
\@onlypreamble\SectionsOff
\newcommand*\SectionsOn{%
  \let\section\bjb@section
  \let\subsection\bjb@subsection
  \let\subsubsection\bjb@subsubsection
}
\@onlypreamble\SectionsOn
\begingroup
  \toks@=\expandafter{\tableofcontents}
  \xdef\tableofcontents{%
    \begingroup
      \let\noexpand\@startsection\noexpand\bjb@startsection@orig
      \the\toks@
    \endgroup
  }
\endgroup
\newenvironment{acknowledgement}{%
  \bjb@section*{\acknowledgementname}%
}{}
\newenvironment{suppinfo}{%
  \bjb@section*{\suppinfoname}%
}{}
\newcommand*\acknowledgementname{Acknowledgement}
\AtEndOfClass{%
  \def\bibsection{%
    \bjb@section*{\refname}%
  }%
}
\newcommand*\suppinfoname{Supporting Information Available}
\newcommand*\bjb@iffalse{\iffalse}
\newtoks\bjb@collect@toks
\newtoks\bjb@collect@empty@toks
\newcommand*\bjb@collect@begins{}
\newcommand*\bjb@collect@content{}
\newcommand\bjb@collect[1]{%
  \bjb@collect@toks{%
    \expandafter#1\expandafter{\the\bjb@collect@toks}%
  }%
  \edef\bjb@collect@content{%
    \the\bjb@collect@toks
    \noexpand\end{\@currenvir}%
  }%
  \bjb@collect@toks\bjb@collect@empty@toks
  \def\bjb@collect@begins{b}%
  \begingroup
    \expandafter\let\csname\@currenvir\endcsname\bjb@collect@aux
    \edef\bjb@collect@content{%
      \expandafter\noexpand\csname\@currenvir\endcsname
    }%
    \bjb@collect@content
}
\newcommand*\bjb@collect@aux{}
\long\def\bjb@collect@aux#1\end#2{%
  \edef\bjb@collect@begins{%
    \bjb@collect@begins@#1\begin\end
    \expandafter\@gobble\bjb@collect@begins
  }%
  \ifx\@empty\bjb@collect@begins
    \endgroup
    \@checkend{#2}%
    \bjb@collect@body{#1}%
  \else
    \bjb@collect@body{#1\end{#2}}%
  \fi
  \bjb@collect@content
}
\newcommand*\bjb@collect@begins@{}
\long\def\bjb@collect@begins@#1\begin#2{%
  \ifx\end#2\else
    b\expandafter\bjb@collect@begins@
  \fi
}
\newcommand\bjb@collect@body[1]{%
  \global\bjb@collect@toks\expandafter{\the\bjb@collect@toks#1}%
}
\newcommand*\bjb@type@list{article,communication,suppinfo}
\newcommand*\bjb@type@default{article}
\newcommand*\bjb@type@check{%
  \@tempswafalse
  \@for\@tempa:=\bjb@type@list\do{%
    \ifx\@tempa\bjb@manuscript
      \expandafter\@tempswatrue
    \fi
  }%
  \if@tempswa\else
    \bjb@warning{%
      Invalid manuscript type \bjb@manuscript:\MessageBreak
      changed to default type \bjb@type@default
    }%
    \let\bjb@manuscript\bjb@type@default
  \fi
}
\newcommand*\bjb@setkeys{\setkeys{bjb}}
\let\bjb@killsecs\SectionsOff
\newcommand*\bjb@validtype[2][article]{%
  \def\bjb@type@default{#1}%
  \def\bjb@type@list{#2}%
}
\newcommand*\bjb@par{}
\let\bjb@par\par
\let\bjbTWOCOL\relax
%%%% CUSTOMISATIONS FOR LARGE LAYOUT
\newcommand*\bjb@layout@large{%
  \newlength{\bjb@sidebar@width}
  \newlength{\bjb@real@lmargin}
  \setlength{\bjb@sidebar@width}{5cm}
  \setlength{\bjb@real@lmargin}{1.5cm}
  \geometry{paperwidth=210mm,paperheight=280mm,
      left=7cm,top=2.3cm,bottom=1.7cm,right=1.4cm,
      columnsep=2em,headsep=0.8cm
      }
  \def\bjbTWOCOL{%
      \let\bjbTWOCOL\relax%
      {\unskip\parfillskip 0pt\par}%
      \twocolumn\changetext{}{\dimexpr\Gm@lmargin-\bjb@real@lmargin\relax}{}{-\dimexpr\Gm@lmargin-\bjb@real@lmargin\relax}{}{}%
      \noindent\ignorespaces%
  }
    \def\ps@plain{
      \renewcommand{\@oddhead}{\sffamily{\journalnamefont\bjb@journal@name}\hfill\thepage}%
      \renewcommand{\@evenhead}{\sffamily\thepage\hfill\@author@i\space\bjb@etal}%
      \renewcommand{\@evenfoot}{}%
      \renewcommand{\@oddfoot}{\@evenfoot}%
    }
  \pagestyle{plain}
  \setcounter{secnumdepth}{0}
  \def\sidebarfont{\sffamily}
  \patchcmd{\bjb@keywords@print}{Keywords: }{Keywords:\par}{}{}
  \patchcmd{\bjb@msc@print}{Codes: }{Codes:\par}{}{}
  \patchcmd{\bjb@jel@print}{classification: }{classification:\par}{}{}
  \patchcmd{\bjb@abbreviations@print}{Abbreviations: }{Abbreviations:\par}{}{}
  \def\@maketitle{%
      \vspace*{\dimexpr-\headsep-\headheight\relax}%
      \setlength\parindent{\z@}
      \ifnum\bjb@author@cnt<\z@\relax
        \bjb@warning{No authors defined: At least one author is required}%
      \fi
      \def\titlefont{\sffamily\mdseries\color{structure@color}\raggedright}
      \def\authorfont{\sffamily}
      \def\affilfont{\sffamily}
      \setlength{\bjb@space@inter@extra}{1em}
      \begin{textblock*}{\bjb@sidebar@width}(\bjb@real@lmargin,\dimexpr\Gm@tmargin-\headsep\relax)
        \raggedright%
        \sidebarfont
        {%
          \journalnamefont
          \bjb@journal@name
          \par
        }%
        \vspace*{\bjb@space@inter@extra}%
        \textbf{www.cambridge.org}\par%
        \vspace*{3\bjb@space@inter@extra}%
        {\large\bfseries\color{structure@color}\xmakefirstuc{\bjb@manuscript}\par}%
        \vspace*{\bjb@space@inter@extra}%
        {%
          \datesize
          \datefont
          \ifbjb@dates
            Received \bjb@recvd\\%
            Revised \bjb@revd\\%
            Accepted \bjb@accptd\\%
            First published online \bjb@publd%
            \par\vspace*{\bjb@space@inter@extra}%
          \fi
          \bjb@abstract@extras\par
          \gdef\bjb@abstract@extras{}
        }%
        {%
          \emailsize
          \emailfont
          \ifbjb@email
            \patchcmd{\bjb@contact@details}{Corresponding author}{Author for correspondence}{}{}
            \expandafter\bjb@contact@details
            \par
            \vspace*{\bjb@space@post@email}%
          \fi
        }%
        % \vspace*{\bjb@space@inter@extra}%
        \end{textblock*}
        % }%
        \ifbjb@copyright
          \begin{textblock*}{\bjb@sidebar@width}[0,1](\bjb@real@lmargin,\dimexpr\paperheight-\Gm@bmargin\relax)
            \raggedright\sidebarfont
            \bjb@copyright@notice\par
            \vspace*{2\baselineskip}
            \includegraphics[width=\linewidth]{bjb-logo-new}
          \end{textblock*}
        \fi
        {%
          \titlefont
          \titlesize
          \let\@fnsymbol\bjb@author@fnsymbol
          \let\footnote@org\footnote
          \let\footnote\bjb@title@footnote
          \bjb@maketitle@suppinfo \@title
          \bjb@title@footnote@check
          \global\bjb@footnote@cnt\c@footnote
          \@maketitle@title@hook
          \par
        }%
        \vspace*{\baselineskip}
        {%
          \hrule\vskip2pt
          \authorsize
          \authorfont
          \frenchspacing
          \bjb@author@list
          \par\vskip2pt
          \hrule
        }%
        \vspace*{1.5\bjb@space@post@author}%
        {%
          \affilsize
          \affilfont
          \bjb@address@list
          \par
        }%
    }%
}
\newcommand*\bjb@layout@largetwo{%
  \geometry{paperwidth=210mm,paperheight=280mm,
      left=1.5cm,top=2.3cm,bottom=1.7cm,right=1.4cm,
      columnsep=2em,headsep=0.8cm
      }
  \patchcmd{\@maketitle}{\firstheadsize}{\sffamily\firstheadsize}{}{}
  \appto{\authorfont}{\sffamily}
  \appto{\affilfont}{\sffamily}
  \appto{\datesize}{\sffamily}
  \appto{\emailfont}{\sffamily}
  \patchcmd{\document}{\maketitle}{}{}{}
  \RequirePackage{environ}
  \let\oldabstract\abstract
  \let\endoldabstract\endabstract
  \RenewEnviron{abstract}{%
    \twocolumn[%
      \begin{@twocolumnfalse}
        \maketitle%
        \begin{oldabstract}%
        \protecting{\BODY}%
        \end{oldabstract}%
      \end{@twocolumnfalse}]}
  \def\ps@plain{
      \renewcommand{\@oddhead}{\sffamily{\journalnamefont\bjb@journal@name}\hfill\thepage}%
      \renewcommand{\@evenhead}{\sffamily\thepage\hfill\@author@i\space\bjb@etal}%
      \renewcommand{\@evenfoot}{}%
      \renewcommand{\@oddfoot}{\@evenfoot}%
    }
  \pagestyle{plain}
}
\newcommand*\bjb@layout@medium{%
  \geometry{paperwidth=174mm,paperheight=247mm,
    top=2.3cm,bottom=1.4cm,left=1.8cm,right=1.5cm,
    headsep=0.8cm}
}
\newcommand*\bjb@layout@small{%
  \geometry{paperwidth=152mm,paperheight=228mm,
    top=2cm,bottom=1.5cm,left=1.7cm,right=1.5cm,
    headsep=0.5cm}
}
\newcommand*\acksize{\normalsize}
\newcommand*\suppsize{\normalsize}
\newcommand*\patch@numeric@authors{%
  %%% Make author markers numeric...
  \renewcommand{\bjb@author@fnsymbol@symbol}[1]{##1}
  \pretocmd{\bjb@author@fnsymbol}{\let\ensuremath\relax}{}{}
  \patchcmd{\bjb@author@star@aux}{\else}{,\else}{}{}
  \patchcmd{\bjb@author@star@aux}
    {\ifnum\bjb@affil@alt@cnt>\z@\relax}
    {\ifnum\bjb@affil@alt@cnt>\z@\relax,}
    {}{}
  \patchcmd{\bjb@author@affil@also@aux}
    {\bjb@author@fnsymbol}
    {,\bjb@author@fnsymbol}
    {}{}
  \patchcmd{\bjb@address@list@auxii}
    {\bjb@author@fnsymbol{\bjb@affil@marker@cnt}}
    {\textsuperscript{\bjb@author@fnsymbol{\bjb@affil@marker@cnt}}}
    {}{}
}

\def\bjb@jnl@bjb{
  \def\bjb@journal@name{Brazilian Journal of Biometrics}
  \bjb@layout@medium
  \colorlet{structure@color}{blue!70!black}
  \patch@numeric@authors
%  \patchcmd{\@maketitle}
%    {bjb-logo-new}{epsa-outline-black}{}{}
  \let\endnote\footnote
  \let\printendnotes\relax
  \AtEndOfClass{%
    \colorlet{tbrowcolor}{white}
    \colorlet{tbheadcolor}{white}
    \arrayrulecolor{black}
  }
  \patchcmd{\trfiller}{structure@color}{black}{}{}
  \patchcmd{\thfiller}{structure@color}{black}{}{}
}

\ifcsname bjb@jnl@\bjb@journal\endcsname%
  \csname bjb@jnl@\bjb@journal\endcsname%
\else%
  \bjb@warning{%
    Unknown journal `\bjb@journal':\MessageBreak
    using default configuration%
  }%
  \bjb@jnl@default%
\fi%




% New packages
\RequirePackage{tikz,hyperref}
\RequirePackage{tabularx,booktabs}

\usepackage[table]{xcolor}
\definecolor{lightgray}{gray}{0.9}


% Make Orcid icon
\definecolor{lime}{HTML}{A6CE39}
\DeclareRobustCommand{\orcidicon}{%
    \begin{tikzpicture}
    \draw[lime, fill=lime] (0,0)
    circle [radius=0.16]
    node[white] {{\fontfamily{qag}\selectfont \tiny ID}};
    \draw[white, fill=white] (-0.0625,0.095)
    circle [radius=0.007];
    \end{tikzpicture}
    \hspace{-2mm}
}

\foreach \x in {A, ..., Z}{%
    \expandafter\xdef\csname orcid\x\endcsname{\noexpand\href{https://orcid.org/\csname orcidauthor\x\endcsname}{\noexpand\orcidicon}}
}
\newcommand{\orcid}[1]{\href{https://orcid.org/#1}{\textcolor[HTML]{A6CE39}{\orcidicon}}}



\usepackage[backend=biber,
		citestyle=authoryear,
		maxbibnames=9,
		maxcitenames=2,
		bibstyle=nature,
        doi=true,
		natbib=true]{biblatex}

\RequirePackage{etoolbox}
%
%% Aplica a desativação de cores dentro do bloco de execução do floatrow
%% Garante o mesmo efeito de digitar manualmente após o font size.
\AtBeginEnvironment{floatbox}{\rowcolors{1}{}{}}
%
%% Garante também para tabelas convencionais fora do floatrow
\AtBeginEnvironment{tabular}{\rowcolors{1}{}{}}
\AtBeginEnvironment{tabular*}{\rowcolors{1}{}{}}
\AtBeginEnvironment{tabularx}{\rowcolors{1}{}{}}
%% --- Fim da correção ---		
		
		
%%
%% Based on the achemso class
%% Originally developed by Mats Dahlgren
%% Copyright (C) 1996-1998 by Mats Dahlgren
%% Copyright (C) 2008-2018 by Joseph Wright <joseph.wright@morningstar2.co.uk>
%% Copyright (C) 2019 by Overleaf (WriteLaTeX Limited)
%%
%% Part of this bundle is derived from cite.sty, to which the
%% following license applies:
%%   Copyright (C) 1989-2009 by Donald Arseneau
%%   These macros may be freely transmitted, reproduced, or
%%   modified provided that this notice is left intact.
%%
%% It may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License (LPPL), either version 1.3c of
%% this license or (at your option) any later version.  The latest
%% version of this license is in the file:
%%
%%    http://www.latex-project.org/lppl.txt
%%
%% This work is "maintained" (as per LPPL maintenance status) by
%%   Paul Gessler.
%%
%% This work consists of the file bjb-journal.cls.
%%
%%
%% End of file `bjb-journal.cls'.



%%% End of file `article.cls'.
