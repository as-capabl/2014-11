\ProvidesClass{a5book}[2008/6/29 a6 tate novel]
\LoadClassWithOptions{tbook}

%% 2010/12/20 burasage.sty導入
%% \usepackage{burasage}

%% burasageパッケージ対応版
%\let\origkuten\。
%\renewcommand{\。}{\origkuten\kern-\alltume}
%\let\origtouten\、
%\renewcommand{\、}{\origtouten\kern-\alltume}

%\newcommand{\danmatuku}{\hbox to 0pt {。\hss}}
%\newcommand{\danmatutou}{\hbox to 0pt {、\hss}}

%%OTFパッケージ対応版
\newcommand{\。}{。}
\newcommand{\、}{、}
\newcommand{\danmatuku}{。}
\newcommand{\danmatutou}{、}


\usepackage{addjfonts}
%\DefineJapaneseFamily{jis}{jis}{jis-v}{jis}
%\renewcommand{\kanjifamilydefault}{jis}


\normalfont

\renewcommand{\normalsize}{
    \@setfontsize\normalsize{9.2}{16}
}

\normalsize

\newlength{\medmargin}


\def\ps@empty{\let\ps@jpl@in\ps@empty
  \let\@oddfoot\@empty
  \def\@oddhead{\tiny\hfill\thepage\hspace{-\medmargin}}%
  \def\@evenhead{\tiny\leftmark\hspace{-\medmargin}\thepage\hfil}%
  \let\@mkboth\markboth
    \def\chaptermark##1{\markboth{}{%
%%      \ifnum \c@secnumdepth >\m@ne
%%        \if@mainmatter
%%          \@chapapp\thechapter\@chappos\hskip1zw
%%        \fi
%%     \fi
   ##1}}%p
  }

\def\ps@headings{\let\ps@jpl@in\ps@empty
  \let\@oddfoot\@empty
  \def\@oddhead{\scriptsize\hbox{}\thepage\hspace{5mm}\rightmark\hfil}%
  \def\@evenhead{\scriptsize\hbox{}\leftmark\hfil\thepage}%
  \let\@mkboth\markboth
    \def\chaptermark##1{\markboth{}{%
%%      \ifnum \c@secnumdepth >\m@ne
%%        \if@mainmatter
%%          \@chapapp\thechapter\@chappos\hskip1zw
%%        \fi
%%     \fi
   ##1}}%
  }
\renewcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}\hbox{}\clearpage
  \thispagestyle{jpl@in}%
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter}
\newcommand{\chapterwithoutpage}{%
  \ifodd \c@page\else\clearpage\fi
  \thispagestyle{jpl@in}%
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter\space\@chappos}%
    \addcontentsline{toc}{chapter}%
%%      {\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
      {#1}%
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading}
\def\@makechapterhead#1{%
  \vbox to \textheight{\parindent\z@
%%   \raggedright
   \reset@font\Large
   \vfil
   \leavevmode
%%    \ifnum \c@secnumdepth >\m@ne
%%      \setlength\@tempdima{\linewidth}%
%%     \if@mainmatter
%%      \setbox\z@\hbox{\@chapapp\thechapter\@chappos\hskip1zw}%
%%      \addtolength\@tempdima{-\wd\z@}%
%%      \unhbox\z@\nobreak
%%     \fi
%%      \vtop{\hsize\@tempdima#1}%
%%    \else
     \hspace*{2zw}#1\relax\hfil\par%
%%   \fi
     \vfil
  }%
  \clearpage
%%\vspace*{3\baselineskip}
}


\pagestyle{headings}

\newlength{\alltume}
%\setlength{\alltume}{-0.5pt}
\setlength{\alltume}{0pt}

\newlength{\texmargin}
\setlength{\texmargin}{1in}
\setlength{\paperwidth}{148mm}
\setlength{\paperheight}{210mm}
\setlength{\textheight}{19\baselineskip}
\setlength{\textwidth}{52zw}
\advance\textwidth by -51\alltume

\setlength{\topmargin}{12mm}
\advance\topmargin by -\texmargin

\setlength{\headsep}{8mm}

\setlength{\medmargin}{18mm}

\setlength{\oddsidemargin}{\paperwidth}
\advance\oddsidemargin by -\textheight
\advance\oddsidemargin by -\medmargin 
\advance\oddsidemargin by -\texmargin

\setlength{\evensidemargin}{\medmargin}
\advance\evensidemargin by -\texmargin

\setlength{\columnsep}{2zh}

%% \typeout{tm \the\topmargin}
%% \typeout{om \the\oddsidemargin}
%% \typeout{em \the\evensidemargin}
%% \typeout{w  \the\textwidth}
%% \typeout{h  \the\textheight}

\newcommand{\「}{\par\parindent=0zw「\parindent=1zw}
\newcommand{\tnoind}[1]{\par\parindent=0zw#1\parindent=1zw}
\newcommand{\？}{？\hspace{.6zw}}
\newcommand{\！}{！\hspace{.6zw}}
\newcommand{\exqu}{\rensuji*{!?}\hspace{.6zw}}

\renewcommand{\bigskip} {\vspace{2\baselineskip}}
\renewcommand{\medskip} {\vspace{1\baselineskip}}

\newcommand{\nodoublebreak}{\ifodd\c@page \nobreak\fi}

%\raggedright
\parindent=1zw
\kanjiskip=-\alltume
\advance\kanjiskip by 0pt plus0.5pt
\clubpenalty=0
\interlinepenalty=0
%\linepenalty=0
\outputpenalty=0
\widowpenalty=0
\fussy

\jcharwidowpenalty=0
\parskip=0pt

%\let\parpar=\par
%\def\par{\parpar\clubpenalty=0\widowpenalty=0}

