%
% 若有后续者使用改模板，请先查看格式要求是否与书写本文档时的要求相同，
% 若不相同可善用crtl+F，进行搜索删改命令，针对排版做出改编。
%
% 本cls继承于电子科大论文（原文件作者：Wen Wang <wangwen1192@outlook.com>）模板，适用于海南大学本科理工科毕业论文格式。
% 与继承源文件相比，做出部分删改，和学校名称替换。
%
% 如下，列出海南大学格式文件要求
% 1.关于封面：
%   “海南大学”用宋体，一号；“毕业论文（设计）”用黑体，一号；其余文字用宋体，三号；使用A4纸篇幅。
% 2.排版格式：
%   毕业论文（设计）均要求计算机打印（封面也要求打印），除封面和封底外，每页均应带有页眉，页眉部分使用论文题目。
%   页号放在每页的底部中间。毕业论文要求纵向打印，A4纸篇幅，1.5倍行距。页边距的要求为：
%   上（T）：2.54 cm
%   下（B）：2.54 cm
%   左（L）：3.17 cm
%   右（R）：3.17 cm
%   装订线（T）：1.0 cm
%   装订线位置（T）：左
%   其余设置采取系统默认设置。
% 3.页码
%   【为了更符合打印要求，此文件做出了如下修改，论文封面后空一页，中英文摘要后面也各空一页，保证美观，如果想不空，删去封面、摘要后的\newpage即可】
%   第一页：封面（见封面样张文件）
%   第二页：中文摘要（后附中文关键字）
%   论文第二页为不少于300字的中文内容摘要，在摘要的下方另起一行。应说明本论文的目的、研究方法、成果和结论。论文摘要是学位论文的缩影，尽可能保留原论文的基本信息，突出论文的创造性成果和新见解。论文摘要应尽量深入浅出，通俗易懂，语言力求精炼、准确。关键词3~5个。
%   第三页：英文摘要（后附英文关键字）
%   论文第三页为英文摘要，内容与中文摘要和关键词相同
%   第四页：目录 （标明各章节所在的页码）
%   后续页依次为（文科见后页）：
%   论文正文
%   致谢
%   参考文献
%   附件：如程序、文档、数据、图纸等资料。
% 第一部分：封面
%   按学校的规定进行打印。
%   第二部分：摘要与关键词
%   1、中文摘要、关键词 
%   摘＃＃＃＃要（三号，宋体，加粗，居中）
%   摘要正文(小四号，宋体)
%   关键词标题（小四号，宋体，顶格，加粗）
%   关健词正文（小四号，宋体，词间用分号隔开）
%   2、英文摘要、英文关键词：
%   英文摘要标题Abstract（三号，Times New Roman，加粗，居中）
%   英文摘要正文（小四号，Times New Roman）
%   英文关键词标题Keywords：（小四号，Times New Roman，顶格，加粗）
%   英文关键词正文（小四号，Times New Roman，词间用分号隔开）
%   第三部分：目录  （单独用一页）
%   目＃＃＃＃录（三号，宋体，加粗，居中）
%   1 XXXXXX（一级标题，小四号，宋体，下同）……………………… (页码)
%   1.1 XXXXXX（二级标题）…………………………………………… (页码)
%   1.1.1 XXXXXX (三级标题) …………………………………………… (页码)
%   2 XXXXXX………………………………………………………………(页码)
%   2.1 XXXXXX……………………………………………………………(页码)
%   2.2 XXXXXX……………………………………………………………(页码)
%   2.2.1 XXXXXX…………………………………………………………(页码)
%   致谢…………………………………………………………………(页码)
%   参考文献…………………………………………………………………(页码)
%   附件………………………………………………………………………(页码)
%   第四部分：主体部分
%   1、各级标题与正文
%   一级标题用三号字，宋体，顶格，加粗
%   二级标题用四号字，宋体，顶格，加粗
%   三级标题用小四号字，宋体，顶格，加粗
%   四级标题格式同三级标题
%   正文用小四号字，宋体
%   注：四级、五级标题分别用（1）和①的格式
%   2、正文中的图表
%   正文中图、表均需编排序号，图、表题目及说明（五号、宋体）。
%   第五部分：  致谢标题（三号，宋体，居中，加粗）
%   致谢内容（小四号、宋体）
%   第六部分：参考文献标题（三号，宋体，居中，加粗）
%   参考文献内容（五号、宋体；英文用五号，Times New Roman）
%   标注格式规定如下：
%   1、专著、论文集、报告、学位论文：
%   [序号] 作者(列前3名).文献名.出版社所在地：出版社，出版年.起始页-终止页.
%   2、期刊文章：
%   [序号] 作者(列前3名).论文名.刊名，出版年，卷(期)：起始页-终止页.
%   3、电子文献：
%   [序号] 作者(列前3名).电子文献名.电子文献的出处或可获得地址，发表或更新日期.
%   第七部分：附件
%   
%



\ProvidesClass{thesis-hainanu}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage{ifxetex}
\RequireXeTeX

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6pt]{caption}

\RequirePackage{array}
\RequirePackage{booktabs}
\setlength{\heavyrulewidth}{0.9pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\arrayrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}

\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{lmodern}
\RequirePackage[nopostdot]{glossaries}
\RequirePackage{mathspec}

\RequirePackage{xeCJK}
\RequirePackage{ifplatform}

% set of font(win, mas or linx)
\ifwindows
  \setCJKmainfont[AutoFakeBold=true]{SimSun}
  \newCJKfontfamily{\heiti}{SimHei}
  \newfontfamily{\heiti@letter}{SimHei}
  \setallmainfonts{Times New Roman}
\else
\ifmacosx
  \setCJKmainfont[AutoFakeBold=true]{Songti SC}
  \newCJKfontfamily{\heiti}{STHeiti}
  \newfontfamily{\heiti@letter}{STHeiti}
  \setallmainfonts{Times New Roman}
\else

\setCJKmainfont{SimSun}[
Path = ./fonts/simsun/,
UprightFont = SimSun-01.ttf,
BoldFont = SimSun-01.ttf  % 若粗体未拆分，暂用同一文件
]
% 修改后（从相对路径加载）
\newCJKfontfamily{\heiti}{Noto Sans CJK SC}[
Path = ./fonts/noto/,
UprightFont = NotoSansCJK-Regular.ttc, 
BoldFont = NotoSerifCJK-Bold.ttc,        
Script = CJK
]
\setmainfont{Times New Roman}[
Path = ./fonts/times_new_roman/,  % 指定字体文件路径
UprightFont = times.ttf,           % 常规字体
BoldFont = timesbd.ttf,            % 粗体
ItalicFont = timesi.ttf,           % 斜体
BoldItalicFont = timesbi.ttf        % 粗斜体
]

\setmonofont{FiraCode}[
Path = ./fonts/firacode/,
UprightFont = FiraCode-Regular.ttf,
BoldFont = FiraCode-Bold.ttf,
AutoFakeSlant = 0.15,  % 倾斜系数（0.1~0.3）
Scale = 0.9
]

\fi
\fi

\newcommand{\bm}{\mathbf}

\RequirePackage{zhnumber}
\RequirePackage{pifont}

\RequirePackage[hyphens]{xurl}
\RequirePackage[hyperfootnotes=false,
    bookmarksnumbered,
    bookmarksdepth=4
]{hyperref}
\hypersetup{
  colorlinks=true,
  citecolor=black,
  linkcolor=black,
  urlcolor=black
}

\RequirePackage{indentfirst}
%\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{appendix}
\RequirePackage{cite}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}

\RequirePackage[algochapter, boxruled, linesnumbered]{algorithm2e}

\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage[resetlabels]{multibib}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{everypage}
\RequirePackage{ifoddpage}
\RequirePackage{pdfpages}

\graphicspath{{../../graph/}}

\RequirePackage[titles]{tocloft}
\RequirePackage[labelformat=simple]{subcaption}
\captionsetup[subfigure]{font=small, belowskip=6pt, width=36pt}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\newcommand{\floatcontinue}{\end{figure}\clearpage\begin{figure}[tb]\ContinuedFloat}

\urlstyle{rm}
\raggedbottom

% \AtBeginDocument{\pretocmd{\ref}{~}{}{}\apptocmd{\ref}{}{}{}}

\newcommand{\thesistablelist}{
  \listoftables
}

\RequirePackage[a4paper,
  inner=3.17cm, outer=3.17cm, top=2.54cm, bottom=2.54cm,
  bindingoffset=1cm]{geometry}

\setlength{\headheight}{15pt}

\pagestyle{fancy}
\linespread{1.5}
% 目录调整数字
\setlength\parindent{24pt}
\titlespacing{\chapter}{0pt}{0pt}{18pt}       
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\renewcommand\thechapter{\arabic{chapter}}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

% 这是使目录成层次感递进，使用时可以注释。
%\titlespacing{\chapter}{0pt}{0pt}{18pt}       
%\titlespacing{\section}{0pt}{18pt}{6pt}
%\titlespacing{\subsection}{0pt}{12pt}{6pt}
%\titlespacing{\subsubsection}{0pt}{12pt}{6pt}
%
%\renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章}
%\renewcommand\thesection{\arabic{chapter}.\arabic{section}}
%\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
%\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
%\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

% 添加对frontmatter/mainmatter/appendix的状态控制
\newif\if@mainmatter\@mainmatterfalse
\newif\if@frontmatter\@frontmatterfalse

% 重定义frontmatter/mainmatter命令
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}
  \titleformat{\chapter}[block]
    {\heiti\centering\fontsize{16pt}{16pt}\selectfont\strong\thispagestyle{fancy}}
    {\thechapter}{7.5pt}{}
  \titlespacing{\chapter}{0pt}{0pt}{18pt}
}

\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \titleformat{\chapter}[block]
    {\heiti\raggedright\fontsize{16pt}{16pt}\selectfont\strong\thispagestyle{fancy}}
    {\thechapter}{7.5pt}{}
  \titlespacing{\chapter}{0pt}{0pt}{18pt}
}


\captionsetup{width=\textwidth - 84pt}
\captionsetup[figure]{aboveskip=6pt, belowskip=0pt}
\captionsetup[table]{aboveskip=9pt, belowskip=0pt}

\setlength{\intextsep}{9pt}

\AtBeginEnvironment{figure}{%
  \def\@floatboxreset{\centering}%
}

\AtBeginEnvironment{table}{%
  \def\@floatboxreset{\centering}%
}

\AtBeginEnvironment{tabular}{\small}

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\titleformat{\chapter}[block]
  {\heiti\centering\fontsize{16pt}{16pt}\selectfont\strong\thispagestyle{fancy}}{\thechapter}{7.5pt}{}

\titleformat{\section}[block]
  {\fontsize{14pt}{14pt}\selectfont\strong}
  {\bfseries\thesection}{7pt}{}

\titleformat{\subsection}[block]
  {\fontsize{12pt}{12pt}\selectfont\strong}
  {\bfseries\thesubsection}{7pt}{}

\titleformat{\subsubsection}[block]
  {\fontsize{12pt}{12pt}\selectfont\strong}
  {\bfseries\thesubsubsection}{6pt}{}

\RequirePackage[hang, perpage]{footmisc}
\addtolength{\footnotesep}{0pt}
\setlength{\footnotemargin}{13.5pt}

\renewcommand{\footnotesize}{\fontsize{9pt}{10.8pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{11.7}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}

\renewcommand{\footnoterule}{\vfill\noindent\vspace{0.9mm}\hspace{27pt}\rule{5.05cm}{0.02cm}\vspace*{2.6pt}}

\def\@makefntext #1{
  \ifFN@hangfoot
      \bgroup \setbox \@tempboxa \hbox {
          \ifdim
        \footnotemargin >0pt \hb@xt@
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else
              \hbox { \normalfont \@thefnmark}
      \fi
    }
        \leftmargin \wd \@tempboxa
        \rightmargin \z@ \linewidth \columnwidth
          \advance \linewidth -\leftmargin\parshape \@ne
    \leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
    \leavevmode \llap {\box \@tempboxa }\parskip
        \hangfootparskip \relax \parindent
    \hangfootparindent \relax
        \else
          \parindent 1em \noindent
            \ifdim
                \footnotemargin >\z@ \hb@xt@
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
        \ifdim \footnotemargin =\z@
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
          \llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
        \fi
            \fi
    \fi
        \footnotelayout #1\ifFN@hangfoot \par \egroup
  \fi
}

\newcounter{pseudopage}
\setcounter{pseudopage}{0}
\AddEverypageHook{\stepcounter{pseudopage}}

\newcommand\blankpage{%
  \newpage
  \null
  \thispagestyle{empty}%
  \addtocounter{pseudopage}{-1}%
  \newpage
}
%页眉、页脚
\newenvironment{chineseabstract}{
  %\pagenumbering{Roman}
  \ifchinesebook{
    \pdfbookmark{中文摘要}{chineseabstract}
  }{
    \pdfbookmark{Chinese Abstract}{chineseabstract}
  }
  \setcounter{pseudopage}{1}
  \chapter*{\strong 摘\chinesespace 要}
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont\selectfont\display@chineseheader}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
}{
  \checkoddpage
  \ifoddpage
      \blankpage
    \else
      \newpage
    \fi
}

\newcommand{\chinesekeyword}[1]{
  \vspace{\baselineskip}
  \noindent
  \@hangfrom{\makebox[48pt][l]{\heiti{关键词\chinesecolon}}}#1
}

\newenvironment{englishabstract}{
  %\pagenumbering{Roman}
  \ifchinesebook{
    \pdfbookmark{英文摘要}{englishabstract}
  }{
    \pdfbookmark{English Abstract}{englishabstract}
  }
  \chapter*{\bfseries ABSTRACT}
    \fancyhf{}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont\display@chineseheader}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
}{
  \checkoddpage
  \ifoddpage
      \blankpage
    \else
      \newpage
    \fi
}

\newcommand{\englishkeyword}[1]{
  \vspace{\baselineskip}
  \noindent
  \@hangfrom{\makebox[2.1cm][l]{\textbf{Keywords:}}}#1
}

\AddEverypageHook{\addtocontents{toc}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lof}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lot}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\tocloftpagestyle{fancy}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.4}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}
\setlength{\cftbeforechapskip}{0pt}

%\renewcommand{\cftchapafterpnum}{\hspace{2em}} % 编号后的间距
%\setlength{\cftchapindent}{0em}       % 章节条目整体缩进归零

% 目录标题设置
\renewcommand{\cfttoctitlefont}{\centering\fontsize{15pt}{15pt}\selectfont\strong}
\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}

% 章节目录设置
\setlength{\cftchapindent}{0em}          % 章节条目整体缩进归零
\setlength{\cftchapnumwidth}{1em}      % 一级标题编号盒子宽度(足够容纳"1.1")
\renewcommand{\cftchapaftersnum}{\hspace{0.5em}} % 编号后的间距
\renewcommand{\cftchapfont}{\strong}

% 二级标题设置
\setlength{\cftsecindent}{0em}           % 二级标题整体缩进
\setlength{\cftsecnumwidth}{3.0em}       % 二级编号盒子宽度(足够容纳"1.1.1")

% 三级标题设置
\setlength{\cftsubsecindent}{0em}        % 三级标题整体缩进 
\setlength{\cftsubsecnumwidth}{4.0em}     % 三级编号盒子宽度

% 去除条目间距
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}

% 标题层级缩进关系（重要！）
\cftsetindents{section}{0em}{\cftsecnumwidth}    % 二级标题
\cftsetindents{subsection}{0em}{\cftsubsecnumwidth} % 三级标题

\cftsetindents{section}{21pt}{22pt}
\cftsetindents{subsection}{44pt}{31pt}
\cftsetindents{subsubsection}{76pt}{41pt}

\renewcommand{\cfttoctitlefont}{\centering\fontsize{15pt}{15pt}\selectfont\strong}
\renewcommand\cftchapfont{\strong}

\newcommand{\zh@thetitle}{\chinesespace}
\newcommand{\zh@theauthor}{\chinesespace}
\newcommand{\zh@thedate}{\chinesespace}
\newcommand{\zh@theschool}{\chinesespace}
\newcommand{\zh@thedepart}{\chinesespace}
\newcommand{\zh@thegrade}{\chinesespace}
\newcommand{\zh@themajor}{\chinesespace}
\newcommand{\zh@theadvisor}{\chinesespace}
\newcommand{\zh@thecomplishyear}{\chinesespace}
\newcommand{\zh@thecomplishmonth}{\chinesespace}
\newcommand{\zh@thecomplishday}{\chinesespace}



\newcommand{\en@thetitle}{\chinesespace}
\newcommand{\en@theauthor}{\chinesespace}
\newcommand{\en@thedate}{\chinesespace}
\newcommand{\en@theschool}{\chinesespace}
\newcommand{\en@themajor}{\chinesespace}
\newcommand{\en@theadvisor}{\chinesespace}

\newcommand{\thestudentnumber}{\chinesespace}

\renewcommand{\title}[2]{
  \renewcommand{\zh@thetitle}{#1}
  \renewcommand{\en@thetitle}{#2}
}

\renewcommand{\author}[2]{
  \renewcommand{\zh@theauthor}{#1}
  \renewcommand{\en@theauthor}{#2}
}

\renewcommand{\date}[2]{
  \renewcommand{\zh@thedate}{#1}
  \renewcommand{\en@thedate}{#2}
}

\newcommand{\complishyear}[1]{
  \renewcommand{\zh@thecomplishyear}{#1}
}

\newcommand{\complishmonth}[1]{
  \renewcommand{\zh@thecomplishmonth}{#1}
}

\newcommand{\complishday}[1]{
  \renewcommand{\zh@thecomplishday}{#1}
}

\newcommand{\major}[2]{
  \renewcommand{\zh@themajor}{#1}
  \renewcommand{\en@themajor}{#2}
}

\newcommand{\school}[2]{
  \renewcommand{\zh@theschool}{#1}
  \renewcommand{\en@theschool}{#2}
}

\newcommand{\advisor}[2]{
  \renewcommand{\zh@theadvisor}{#1}
  \renewcommand{\en@theadvisor}{#2}
}

\newcommand{\studentnumber}[1]{
  \renewcommand{\thestudentnumber}{#1}
}

\newcommand{\depart}[1]{
  \renewcommand{\zh@thedepart}{#1}
}

\newcommand{\grade}[1]{
  \renewcommand{\zh@thegrade}{#1}
}

\newcommand{\thedateoral}{}
\newcommand{\thedatesubmit}{}
\newcommand{\thedateconfer}{年\chinesespace 月}

\newcommand{\setdate}[2][]{ 
\ifthenelse{\equal{#1}{oral}}{
  \renewcommand{\thedateoral}{#2}
}{}
\ifthenelse{\equal{#1}{submit}}{
  \renewcommand{\thedatesubmit}{#2}
}{}
\ifthenelse{\equal{#1}{confer}}{
  \renewcommand{\thedateconfer}{#2}
}{}
}
% 加粗为
\renewcommand{\strong}{\bfseries}
\DeclareOption{english} {
  \newcommand{\englishbook}{}
  \renewcommand{\thechapter}{Chapter \arabic{chapter}}
  \addtolength{\cftchapnumwidth}{12pt}
  \renewcommand{\strong}{\bfseries}
}

\newcommand{\ifchinesebook}[2]{
  \ifthenelse{\isundefined{\englishbook}}{#1}{#2}
}

\DeclareOption{bachelor}{
  \def\chinesedegreename{本科}
  \def\englishdegreename{Bachelor}
  \def\chinesebooktitle{学士学位论文}
  \def\englishbooktitle{Bachelor Thesis}
  \def\display@chineseheader{\zh@thetitle}
  \def\display@englishheader{Bachelor Thesis of Hainan University of China}
}

\ProcessOptions\relax

\ifchinesebook{
  \renewcommand{\contentsname}{目\hspace{6pt}录}
  \renewcommand{\bibname}{参考文献}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\listfigurename}{图目录}
  \renewcommand{\listtablename}{表目录}
}{}

\pretocmd{\listoffigures}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont\listfigurename}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \ifchinesebook{
    \addtolength{\cftfignumwidth}{12pt}
    \renewcommand{\cftfigpresnum}{\figurename}
  }{
    \addtolength{\cftfignumwidth}{32pt}
    \renewcommand{\cftfigpresnum}{\figurename~}
  }
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\newcommand{\thesisfigurelist}{
  \listoffigures
}

\pretocmd{\listoftables}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont\listtablename}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  
  \ifchinesebook{
    \addtolength{\cfttabnumwidth}{12pt}
    \renewcommand{\cfttabpresnum}{\tablename}
  }{
    \addtolength{\cfttabnumwidth}{32pt}
    \renewcommand{\cfttabpresnum}{\tablename~}
  }
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\ifchinesebook{
  \SetAlgorithmName{算法}{算法}{算法列表}
}{
  \SetAlgorithmName{Algorithm}{Algorithm}{List of Algorithms}
}
\renewcommand\thealgocf{\arabic{chapter}-\arabic{algocf}}
\SetAlgoCaptionSeparator{\null}
\AtBeginEnvironment{algorithm}{\vspace{9pt}}
\AfterEndEnvironment{algorithm}{\vspace{9pt}}

%\renewcommand*{\glossarypreamble}{\vspace{-9pt}}
\newacronymstyle{acronym-hainanu}{
  \ifglshaslong{\glslabel}{\glsgenacfmt}{\glsgenentryfmt}
}{
  \renewcommand*{\GenericAcronymFields}{
    first={\the\glslongtok\space\protect\paren{\the\glsshorttok}},
    description={\the\glslongtok}}
  \renewcommand*{\genacrfullformat}[2]{%
    \glsentrydesc{##1}~(\glsentrylong{##1},\space%
    \glsentryshort{##1})%
  }
  \renewcommand*{\acronymentry}[1]{%
    \acronymfont{\glsentryshort{##1}}%
  }
}
\setacronymstyle{acronym-hainanu}

\newglossarystyle{hainanu-chinese}{
  \setlength{\glsdescwidth}{.3\textwidth}
  \setlength{\glspagelistwidth}{.3\textwidth}
  \renewenvironment{theglossary}%
  {\begin{longtable}{lp{\glsdescwidth}p{\glspagelistwidth}}}%
    {\end{longtable}}%
  \renewcommand*{\glossaryheader}{%
    \heiti 缩略词 &\heiti 英文全称 &
    \heiti 中文全称 \tabularnewline\endhead}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \glsentrylong{##1} & \glsentrydesc{##1}\tabularnewline
  }
  \renewcommand*{\subglossentry}[3]{
    \glossentry{##2}{##3}}
}


\newglossarystyle{hainanu-english}{
  \setlength\glsdescwidth{.7\textwidth}
  \renewenvironment{theglossary}%
    {\begin{longtable}{lp{\glsdescwidth}}}%
    {\end{longtable}}%

  \renewcommand*{\glossaryheader}{}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \ifglshaslong{##1}{\glsentrylong{##1}\ifglshasdesc{##1}{, \glsentrydesc{##1}}{}}
    {\glsentrydesc{##1}} \\
  }
  \renewcommand*{\subglossentry}[3]{
  \glossentry{##2}{##3}}
}

\defglsentryfmt{%
  \ifglshaslong{\glslabel}{%
    \glsgenacfmt%
  }{%
    \ifglsused{\glslabel}{%
      \glsgenentryfmt%
    }{%
      \glsgenentryfmt%
    }%
  }%
}

\newcommand{\thesisglossarylist}{
  \newpage 
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 缩略词表}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
    \pdfbookmark{缩略词表}{glossary}
    \printglossary[style=hainanu-chinese, title={\protect\centering 缩略词表}, nonumberlist, nogroupskip]
  }{
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont Glossary}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
    \pdfbookmark{Glossary}{glossary}
    \printglossary[style=hainanu-english, title={\protect\centering Glossary}, nonumberlist, nogroupskip]
  }
  \newpage
}

% 封面设计
% “海南大学”用宋体，一号；“毕业论文（设计）”用黑体，一号；其余文字用宋体，三号；使用A4纸篇幅。
% 学校给的一号字是26pt，三号字16pt
\newcommand{\makecover}{
\thispagestyle{empty}
\setlength{\extrarowheight}{9pt}
\ifchinesebook{\pdfbookmark{封面}{cover}}{\pdfbookmark{Cover}{cover}}
\begin{center}
  \vspace*{50pt}
  \fontsize{26pt}{29pt}\selectfont 海\hspace{13pt}南\hspace{13pt}大\hspace{13pt}学 \\
  \vspace{19pt}
  \fontsize{26pt}{29pt}\selectfont {\heiti 毕}\hspace{13pt}{\heiti 业}\hspace{13pt}{\heiti 论}\hspace{13pt}{\heiti 文（设计）} \\
  \vspace{162.5pt}
  \renewcommand{\arraystretch}{1}
  \begin{tabular}{>{\fontsize{16pt}{16pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{27pt}\selectfont}
      p{3.77in}p{15pt}}
  	题\chinesespace\chinesespace 目： & \zh@thetitle      & \\ \cline{2-2}
    学\chinesespace\chinesespace 号： & \thestudentnumber & \\ \cline{2-2}
    姓\chinesespace\chinesespace 名： & \zh@theauthor     & \\ \cline{2-2}
 	  年\chinesespace\chinesespace 级:  & \zh@thegrade      & \\ \cline{2-2}
 	  学\chinesespace\chinesespace 院： & \zh@theschool     & \\ \cline{2-2}
 	  系\chinesespace\chinesespace 别： & \zh@thedepart     & \\ \cline{2-2}
 	  专\chinesespace\chinesespace 业： & \zh@themajor      & \\ \cline{2-2}
    指导老师： & \zh@theadvisor & \\ \cline{2-2}
    完成日期： & \zh@thecomplishyear 年 \zh@thecomplishmonth 月 \zh@thecomplishday 日& \\
    %\cline{2-2}  
  \end{tabular}
\end{center}

% 添加空白页
\newpage
\null
\thispagestyle{empty}
\addtocounter{page}{-1}

\newpage
\setcounter{page}{1}
\setlength{\extrarowheight}{2pt}
}

\newcommand{\thetitlepage}{
  \newpage
  \thispagestyle{empty}

\noindent 分类号 \rule[-3pt]{2.5in}{0.5pt} 密级 \rule[-3pt]{2.5in}{0.5pt} \\[12bp]
UDC\textsuperscript{ 注1} \rule[-3pt]{2.5in}{0.5pt} \\[12bp]

\begin{center}
  \fontsize{36pt}{36pt}\selectfont{
    学\chinesespace 位\chinesespace 论\chinesespace 文
  } \\[48bp]

  \fontsize{16pt}{16pt}\selectfont{\bfseries\zh@thetitle} \\
  \vspace{-15pt}
  \rule{5.9in}{.5pt} \\
  \fontsize{12pt}{12pt}\selectfont（题名和副题名）\\[36bp]
  \fontsize{16pt}{16pt}\selectfont{\bfseries\zh@theauthor} \\
  \vspace{-15pt}
  \rule{1.63in}{.5pt} \\
  \fontsize{12pt}{12pt}\selectfont（作者姓名） \\[36bp]

  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{4.45in}}
      指导老师 & {\bfseries\zh@theadvisor} \\
    \cline{2-2}
      & {\bfseries 海南大学\chinesespace 海口} \\
    \cline{2-2}
    & \fontsize{12pt}{12pt}\selectfont（姓名、职称、单位名称）
  \end{tabular}  \\[36bp]
\end{center}

  \noindent
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{14pt}{14pt}\bfseries\selectfont}
      p{1.0in}
      >{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{14pt}{14pt}\bfseries\selectfont}
      p{2.50in}}
      申请学位级别 & \chinesedegreename &
      学科专业 & \zh@themajor \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{14pt}{14pt}\bfseries\selectfont}
      p{1.59in}
      >{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{14pt}{14pt}\bfseries\selectfont}
      p{1.59in}}
      提交论文日期 & \thedatesubmit &
      论文答辩日期 & \thedateoral \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{14pt}{14pt}\bfseries\selectfont}
      p{4.02in}}
      学位授予单位和日期 & 海南大学\chinesespace{} \thedateconfer \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{14pt}{14pt}\heiti\selectfont}
      p{2.29in}}
      答辩委员会主席 & \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{14pt}{14pt}\heiti\selectfont}
      p{5.03in}}
      评阅人 & \\
    \cline{2-2}
  \end{tabular}

\vspace{0.54in}
\noindent
\hspace{12pt}注1：注明《国际十进分类法UDC》的类号。

\newpage
\thispagestyle{empty}\null
\par{\vspace{2.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{18pt}{20pt}\selectfont
  \bfseries\centering\en@thetitle
\end{minipage}
\par{\vspace{6.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{15pt}{17pt}\selectfont
  \centering\noindent
  A \englishbooktitle{} Submitted to \\
  University of Electronic Science and Technology of China
\end{minipage}
\par{\vspace{3.2cm}}
\noindent
\begin{tabular}{>{\fontsize{16pt}{16pt}\selectfont}r
  >{\centering\arraybackslash\bfseries\fontsize{16pt}{16pt}\selectfont}
  p{10.6cm}}
  Discipline: & \multirow[t]{2}{*}{\en@themajor} \\
\cline{2-2}
& \\
\cline{2-2}
Author: & \en@theauthor \\
\cline{2-2}
Student ID: & \thestudentnumber \\
\cline{2-2}
Supervisor: & \en@theadvisor \\
\cline{2-2}
School: & \en@theschool \\
\cline{2-2}
\end{tabular}
}

\newcommand{\bindpdfcover}[1]{
  \ifchinesebook{\pdfbookmark{封面}{cover}}{\pdfbookmark{Cover}{cover}}
  \includepdf[pages=-]{#1}
  \newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
}

\newcommand{\originalitydeclaration}{
\newpage
\thispagestyle{empty}
\begin{spacing}{1.9}
  \ifchinesebook{\pdfbookmark{独创性声明}{originalitydeclaration}}
    {\pdfbookmark{Originality Declaration}{originalitydeclaration}}
  \noindent\begin{center}
  \fontsize{18pt}{20pt}\selectfont\bfseries 独创性声明
  \end{center}
    \par{\fontsize{14pt}{16pt}\selectfont\noindent\null\hspace{28pt}%
    本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。%
    据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，%
    也不包含为获得海南大学或其它教育机构的学位或证书而使用过的材料。%
    与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。}
  \\[14pt]
  \fontsize{14pt}{16pt}\selectfont\noindent\null\hspace{35pt}作者签名：\rule[-3pt]{4.1cm}{0.5pt}\hspace{42pt}%
  日期：\chinesespace\chinesespace 年\hspace{21pt}月\hspace{21pt}日 \\
  \noindent\begin{center}
    \fontsize{18pt}{20pt}\selectfont\bfseries 论文使用授权
  \end{center}
  \par{\fontsize{14pt}{14pt}\selectfont\noindent\null\hspace{28pt}%
    本学位论文作者完全了解海南大学有关保留、使用学位论文的规定，%
    的规定，同意学校有权保留并向国家有关部门或机构送交论文的复印件和数字文档，%
    允许论文被查阅。本人授权海南大学可以将学位论文的全部或部分内容编入有关数据库进行检索及下载，%
    可以采用影印、扫描等复制手段保存、汇编学位论文。
}
  \par{\fontsize{14pt}{14pt}\selectfont\noindent\null\hspace{22pt}%
  \chineseleftparenthesis%
  涉密的学位论文须按照国家及学校相关规定管理，在解密后适用于本授权%
  \chineserightparenthesis} \\[14pt]
  \fontsize{14pt}{16pt}\selectfont\noindent\null\hspace{35pt}作者签名：\rule[-3pt]{4.1cm}{0.5pt}\hspace{12pt}%
  导师签名：\rule[-3pt]{4.1cm}{0.5pt} \\[6pt]
  \null\hspace{259pt} 日期：\chinesespace\chinesespace 年\hspace{21pt}月\hspace{21pt}日
\end{spacing}
\newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
}

\newcommand{\signatureofdeclaration}[1]{
  \includepdf[pages=-]{#1}
  \newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
}

\setlength{\extrarowheight}{2pt}

\newcommand{\standardheader}{
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[CE]{\fontsize{10.5pt}{12.6pt}\selectfont\display@chineseheader}
    \fancyhead[CO]{\fontsize{10.5pt}{12.6pt}\selectfont\display@chineseheader}
  }{
    \fancyhead[CE]{\fontsize{10.5pt}{12.6pt}\selectfont\display@chineseheader}
    \fancyhead[CO]{\fontsize{10.5pt}{12.6pt}\selectfont\display@chineseheader}
  }
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
}

\pretocmd{\tableofcontents}{
  \newpage
  \checkoddpage
  \ifoddpage
      \newpage
    \else
      \blankpage
    \fi
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont \selectfont\display@chineseheader}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
    \pdfbookmark{目录}{toc}
    \renewcommand{\cfttoctitlefont}{\centering\fontsize{15pt}{15pt}\selectfont\strong} % 新增居中设置
  }{
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont Contents}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
    \pdfbookmark{Contents}{toc}
    \renewcommand{\cfttoctitlefont}{\centering\fontsize{15pt}{15pt}\selectfont\strong} % 新增居中设置
  }
}{}{}

\newcommand{\thesistableofcontents}{
  \tableofcontents
}

\renewcommand{\chaptermark}[1]{\markboth{\thechapter\hspace{5.25pt}#1}{}}

\newcommand{\thesisacknowledgement}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \setcounter{section}{0}
  \titleformat{\chapter}[block]
  {\heiti\centering\fontsize{15pt}{15pt}\selectfont\strong\thispagestyle{fancy}}{\thechapter}{7.5pt}{}
  \ifchinesebook{
    \chapter*{致\hspace{12pt}谢}
    \addcontentsline{toc}{chapter}{致\hspace{12pt}谢}
    \markboth{致谢}{致谢}
  }{
    \chapter*{Acknowledgements}
    \addcontentsline{toc}{chapter}{Acknowledgements}
    \markboth{Acknowledgements}{Acknowledgements}
  }
  \thispagestyle{fancy}
}

\newcommand{\thesiscontent}{
  \newpage
  \clearpage{\thispagestyle{empty}\cleardoublepage}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \standardheader
  \pagenumbering{arabic}
}

\pretocmd{\@chapter}{
  \ifdefined\@BODY
  \else
  \ifnum\value{chapter}=0
      \thesiscontent
    \fi
  \fi
}{}{}

\apptocmd{\@chapter}{
  \ifdefined\@BODY
  \else
    \ifnum\value{chapter}=1
      \ifchinesebook{\chaptermark{绪论}}{\chaptermark{Introduction}}
      \setcounter{page}{1}
    \fi
  \fi
  \def\@BODY{\null}
}{}{}

\newcommand{\thesischapterexordium}{
  \ifchinesebook{
    \chapter{绪\hspace{6pt}论}
  }{
    \chapter{Introduction}
  }
}

%\renewcommand*{\l@chapter}{\@dottedtocline{1}{1.5em}{2.3em}}

\newcommand{\thesisappendix}{
  \newpage
  \appendix
  \interlinepenalty=0
  \ifchinesebook{}{\addtocontents{toc}{\protect\addtolength{\cftchapnumwidth}{5em}}}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  
  % 修改附录章节编号格式为字母，并将“附录”作为标题前缀
  \renewcommand{\thechapter}{\Alph{chapter}} % 编号格式为A, B, C
  \titleformat{\chapter}[block]
    {\heiti\centering\fontsize{15pt}{15pt}\selectfont\strong\thispagestyle{fancy}}
    {\thechapter\hspace{1em}} % 将“附录”加在标题前
    {0pt} % 编号与标题之间的间距
    {}
  
  \ifchinesebook{
    \renewcommand{\appendixname}{附录}
  }{
    \renewcommand{\appendixname}{Appendix}
  }

  % 注释或删除原有的cftchapnumwidth调整，保持默认宽度
  % \addtolength{\cftchapnumwidth}{5em} 
  
  \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
  \renewcommand{\theequation}{\alph{chapter}-\arabic{equation}}
  \renewcommand{\thetable}{\alph{chapter}-\arabic{table}}
  \renewcommand{\thefigure}{\alph{chapter}-\arabic{figure}}
  \renewcommand{\thetheorem}{\alph{chapter}.\arabic{theorem}}
  \renewcommand{\theaxiom}{\alph{chapter}.\arabic{axiom}}
  \renewcommand{\thecorollary}{\alph{chapter}.\arabic{corollary}}
  \renewcommand{\thelemma}{\alph{chapter}.\arabic{lemma}}
  \renewcommand{\thedefinition}{\alph{chapter}.\arabic{definition}}
  \renewcommand{\theexample}{\alph{chapter}.\arabic{example}}
}

\newcommand{\thesissingleappendix}{
  \newpage
  \appendix
  \interlinepenalty=0
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \titleformat{\chapter}[block]
    {\heiti\centering\fontsize{15pt}{15pt}\selectfont\strong\thispagestyle{fancy}}{附\hspace{12pt}录}{7.5pt}{}
  %\renewcommand{\thechapter}{附\hspace{12pt}录}
  \ifchinesebook{
    \renewcommand{\appendixname}{附录}
  }{
    \renewcommand{\appendixname}{Appendix}
  }

  \renewcommand{\thesection}{A.\arabic{section}}
  
  \renewcommand{\theequation}{a-\arabic{equation}}
  \renewcommand{\thetable}{a-\arabic{table}}
  \renewcommand{\thefigure}{a-\arabic{figure}}
  \renewcommand{\thetheorem}{a.\arabic{theorem}}
  \renewcommand{\theaxiom}{a.\arabic{axiom}}
  \renewcommand{\thecorollary}{a.\arabic{corollary}}
  \renewcommand{\thelemma}{a.\arabic{lemma}}
  \renewcommand{\thedefinition}{a.\arabic{definition}}
  \renewcommand{\theexample}{a.\arabic{example}}
  
  \ifchinesebook{
    \chapter*{附\hspace{12pt}录}
    \addcontentsline{toc}{chapter}{附录}
    \markboth{附录}{附录}
  }{
    \chapter*{Appendix}
    \addcontentsline{toc}{chapter}{Appendix}
    \markboth{Appendix}{Appendix}
  }
}

\ifchinesebook{
  \newcommand{\translation@originaltitle}{外文资料原文}
  \newcommand{\translation@chinesetitle}{外文资料译文}
}{
  \newcommand{\translation@originaltitle}{Original Text for Translation}
  \newcommand{\translation@chinesetitle}{Translated Text in Chinese}
}

\newcommand{\thesistranslationoriginal}{
  \interlinepenalty=0
  \chapter*{\translation@originaltitle}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \renewcommand\thesection{\arabic{section}}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{\translation@originaltitle}
    \markboth{\translation@originaltitle}{\translation@originaltitle}
    \thispagestyle{fancy}
    \hypersetup{bookmarksdepth=0} 
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{Figure}
    \renewcommand{\tablename}{Table}
}

\newcommand{\thesistranslationchinese}{
  \interlinepenalty=0
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \chapter*{\translation@chinesetitle}
  \renewcommand\thesection{\arabic{section}}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{\translation@chinesetitle}
    \markboth{\translation@chinesetitle}{\translation@chinesetitle}
    \thispagestyle{fancy}
    \hypersetup{bookmarksdepth=0} 
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{图}
    \renewcommand{\tablename}{表}
}

\ifchinesebook{
  \newcommand{\thesisaccomplishtitle}{攻读\chinesedegreename{}学位期间取得的成果}
  \newcommand{\thesisbibname}{参考文献}
}{
  \newcommand{\thesisaccomplishtitle}{Research Results Obtained During the Study for \englishdegreename{} Degree}
  \newcommand{\thesisbibname}{References}
}

\renewcommand{\bibname}{\thesisbibname}
\renewcommand{\@biblabel}[1]{[#1]\hfill}

\newenvironment{thesisthebibliography}{
  \begin{thebibliography}{lo}
    \interlinepenalty=10000
    \begin{spacing}{1.5}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}
  \end{thebibliography}
}


\pretocmd{\bibliography}{
  \thispagestyle{fancy}
  \interlinepenalty=10000
  \begin{spacing}{1.5}%1.667
}{}{}

\apptocmd{\bibliography}{
  \end{spacing}
}{}{}

\newcommand{\bstlabelmark}{lo}
\newcommand{\thesisloadbibliography}[2][]{
  \ifthenelse{
    \equal{#1}{large}
  }{
    \setlength{\labelsep}{3pt}
    \renewcommand{\bstlabelmark}{loo}
    \bibliographystyle{thesis-hainanu}
    \bibliography{#2}
    \setlength{\labelsep}{6pt}
  }{
    \bibliographystyle{thesis-hainanu}
    \bibliography{#2}
  }
}

\newcommand{\thesisbibliography}{\thesisloadbibliography}

\newcites{accomplish}{\thesisaccomplishtitle}

\newenvironment{thesistheaccomplish}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \renewcommand\thesection{\arabic{section}}
  \setcounter{section}{0}
  \nociteaccomplish{*}
  \renewcommand{\bibname}{\thesisaccomplishtitle}
  \begin{thebibliography}{lo}
  \interlinepenalty=10000
  \setlength{\itemsep}{0bp}\setlength{\parskip}{0pt}
  \begin{spacing}{1.667}
  \thispagestyle{fancy}
  \small
}{
  \end{spacing}
  \end{thebibliography}
  \renewcommand{\bibname}{\thesisbibname}
}

\newcommand{\thesisloadaccomplish}[1]{
  \nociteaccomplish{*}
  \renewcommand{\bibname}{\thesisaccomplishtitle}
  \renewcommand{\bstlabelmark}{lo}
  \thispagestyle{fancy}
  \begin{spacing}{1.667}
  \bibliographystyleaccomplish{thesis-hainanu}
  \bibliographyaccomplish{#1}
  \end{spacing}
  \renewcommand{\bibname}{\thesisbibname}
}

\newcommand{\thesisaccomplish}{\thesisloadaccomplish}

\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\strong}{}{ }{}
\theoremstyle{dotless}
%\renewcommand\@upn{\selectfont\heiti@letter}

\ifchinesebook{
  \newtheorem{theorem}{定理}[chapter]
  \newtheorem{axiom}[theorem]{公理}
  \newtheorem{corollary}[theorem]{推论}
  \newtheorem{lemma}[theorem]{引理}
  \newtheorem{definition}[theorem]{定义}
  \newtheorem{example}[theorem]{例子}
  \newtheorem{proposition}[theorem]{命题}
}{
  \newtheorem{theorem}{Theorem}[chapter]
  \newtheorem{axiom}[theorem]{Axiom}
  \newtheorem{corollary}[theorem]{Corollary}
  \newtheorem{lemma}[theorem]{Lemma}
  \newtheorem{definition}[theorem]{Definition}
  \newtheorem{example}[theorem]{Example}
  \newtheorem{proposition}[theorem]{Proposition}
}


\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\renewcommand{\qedsymbol}{$\blacksquare$}
\ifchinesebook{
  \renewcommand{\proofname}{证明}
}{}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont
  \topsep0pt \partopsep0pt
  \trivlist
  \item[\hskip5\labelsep
    \strong
  #1\@addpunct{:}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}

\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}}
\setlist{noitemsep}
\setlist{nolistsep}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{8pt}
  \setlength{\belowdisplayskip}{8pt}
  \setlength{\belowdisplayshortskip}{8pt}
  \setlength{\abovedisplayshortskip}{8pt}
}

\endinput
