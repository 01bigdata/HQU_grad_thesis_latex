% hquthesis.cls -- cleaned version for Huaqiao University thesis
% Based on a modified scutthesis template, cleaned for XeLaTeX use on TeX Live 2024+
%% Jun 19, 2010.参照现有国内各高校论文latex模板(东南，清华，北航等)，取其精华去其糟粕，写成初版
%% Jun 20, 2010,修改abstract,keywords,Appendence支持lyx的scutthesis.layout
%% Jun 22, 2010,用natbib来控制引用标的显示
%% v2.0.1, Mar 31, 2011,合并了Quansheng Guan部分修改,主要包含：草稿引入水印，加入定理环境，完善标题、表格和程序代码等格式
%% v2.1.0, Jun 20, 2015,启用pdfcover选项，修改代码区显示方式，附录页眉，去除草稿水印，lyx模板
%% Mar 6,2026,将模板修改成符合华侨大学工学院的毕业设计样式

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{hquthesis}[2026/03/07 Cleaned HQU thesis class]

% -----------------------------------------------------------------------------
% 导入全局Options
% -----------------------------------------------------------------------------
\newif\ifmasterdegree
\masterdegreefalse
\newif\ifpdfcover
\pdfcoverfalse
\newif\ifchapterx
\chapterxfalse

\DeclareOption{master}{\masterdegreetrue}
\DeclareOption{pdfcover}{\pdfcovertrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

%%正式装订版修改
%\LoadClass[12pt,a4paper,openany]{book}
%%单面的或者电子版
\LoadClass[12pt,a4paper,openany,oneside]{book}

% -----------------------------------------------------------------------------
% Metadata helpers 定义几个宏
% -----------------------------------------------------------------------------
\newcommand{\hquthesis}{\textsc{HQU Thesis}}
\def\institute#1{\gdef\@institute{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\major#1{\gdef\@major{#1}}
\def\grade#1{\gdef\@grade{#1}}
\let\graduationyear\grade
\def\studentid#1{\gdef\@studentid{#1}}
\def\authoren#1{\gdef\@authoren{#1}}
\def\instituteen#1{\gdef\@instituteen{#1}}
\def\titleEN#1{\gdef\@titleEN{#1}}
\def\majoren#1{\gdef\@majoren{#1}}
\providecommand\@institute{}
\providecommand\@supervisor{}
\providecommand\@major{}
\providecommand\@grade{}
\providecommand\@studentid{}
\providecommand\@authoren{}
\providecommand\@instituteen{College of Engineering, Huaqiao University}
\providecommand\@titleEN{Graduation Design (Thesis) Title}
\providecommand\@majoren{}

\ifmasterdegree
  \newcommand{\@degree}{硕士}
\else
  \newcommand{\@degree}{本科}
\fi

\newcommand{\thesissubject}{华侨大学\@degree{}毕业设计（论文）}
\renewcommand{\today}{\the\year~年~\the\month~月~\the\day~日}
\newcommand{\abstractheader}{华侨大学工学院毕业设计\quad \@author： \@title}

% -----------------------------------------------------------------------------
% 加载常用的几个sty Packages
% -----------------------------------------------------------------------------
\RequirePackage{ifpdf}
\RequirePackage{doc}
\RequirePackage{ifthen}
\RequirePackage{keyval}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{indentfirst}
\RequirePackage{makeidx} %索引
\RequirePackage{amssymb}
\RequirePackage[final]{pdfpages}
\RequirePackage{geometry}

%%设置页面布局
\geometry{
  a4paper,        % 使用A4纸
  left=3cm,       % 左页边距 3 cm
  right=2cm,      % 右页边距 2 cm
  top=2.5cm,      % 正文版心距离纸张顶部 2.5 cm
  bottom=2cm,     % 正文版心距离纸张底部 2 cm
  headheight=0.8cm, % 页眉本身的高度（页眉那一行文字的盒子高度）
  headsep=1cm,    % 页眉与正文之间的距离；配合 top=2.5cm，使页眉位置接近 Word 的“距顶端 1.5 cm”
  footskip=0.25cm % 正文底部到页脚页码的距离；配合 bottom=2cm，使页脚位置接近“距底端 1.75 cm”
}

% -----------------------------------------------------------------------------
% Fonts (XeLaTeX) 字体设置
% -----------------------------------------------------------------------------
\RequirePackage[BoldFont,SlantFont,CJKnumber]{xeCJK}
\RequirePackage{CJKnumb}

\setmainfont{Times New Roman}%\rmfamily 使用的字体,默认英文和数字的字体。只设置字体
\XeTeXlinebreaklocale "zh"%采用中文断行方式
\XeTeXlinebreakskip = 0pt plus 1pt %字元间可加入0pt~1pt 的弹性间距，这样才能排出左右对齐的段落。

%%设置字体
\setCJKmainfont{SimSun}
\setCJKfamilyfont{song}{SimSun}
\setCJKfamilyfont{hei}{SimHei}
\setCJKfamilyfont{kai}{KaiTi}
\setCJKfamilyfont{fang}{FangSong}
\setCJKmonofont{FangSong}

\newcommand{\songti}{\CJKfamily{song}}
\newcommand{\heiti}{\CJKfamily{hei}}
\newcommand{\kaiti}{\CJKfamily{kai}}
\newcommand{\fangsong}{\CJKfamily{fang}}

% -----------------------------------------------------------------------------
% Font sizes
% -----------------------------------------------------------------------------
\newcommand{\chuhao}{\fontsize{42pt}{46pt}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{40pt}\selectfont}
\newcommand{\yichu}{\fontsize{32pt}{36pt}\selectfont}
\newcommand{\yihao}{\fontsize{28pt}{32pt}\selectfont}
\newcommand{\erhao}{\fontsize{21pt}{24pt}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{20pt}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{18pt}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{22.5pt}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{16pt}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{14pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.95pt}{13pt}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{11pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5pt}{7.5pt}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{6.5pt}\selectfont}

% -----------------------------------------------------------------------------
% Chinese indentation 中文段首行缩进
% -----------------------------------------------------------------------------
\newlength\CJK@twochars
\def\CJK@spaceChar{\hskip \f@size \p@}
\def\CJKindent{%
  \settowidth\CJK@twochars{\CJK@spaceChar\CJK@spaceChar}%
  \parindent\CJK@twochars}
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}} % 中文破折号,added by Quansheng

% -----------------------------------------------------------------------------
% Global typography / warnings
% -----------------------------------------------------------------------------
%不要拉大行距使得页面充满
% 去掉表格中的badboxes报警,看着不爽
\raggedbottom
\hbadness=10000
\tolerance=10000
\hfuzz=150pt

% My fonts for HQU thesis %%%%TODO%%%% %修改字体
\renewcommand{\normalsize}{\xiaosihao\songti\normalfont} % Normal font size 小四号宋体
\newcommand{\absnamecn}{\heiti\sihao}         % 中文“摘要”字样的字体
\newcommand{\abskeycn}{\heiti\sihao}       % 中文摘要“关键字”字样的字体
\newcommand{\abskeyscn}{\songti\xiaosihao\normalfont} % 中文摘要关键字的字体
\newcommand{\absnameen}{\rmfamily\bfseries\xiaosihao}               % 英文“Abstract”字样的字体
\newcommand{\absbodyen}{\rmfamily\wuhao\normalfont}                 % 英文摘要正文五号 TNR
\newcommand{\abskeyen}{\rmfamily\bfseries\xiaosihao}   % 英文“Key words”字样的字体
\newcommand{\abskeysen}{\rmfamily\wuhao\normalfont}        % 英文关键字的字体
\newcommand{\headfont}{\songti\wuhao\normalfont} 	% 页眉字体
\newcommand{\toctitlefont}{\heiti\bfseries\sihao}            % “目录”字样的字体：四号黑体加粗
\newcommand{\tocchapterfont}{\songti\xiaosihao\normalfont} % 目录章条目：中文宋体小四，英文数字Times New Roman小四，不加粗
\newcommand{\tocsectionfont}{\songti\xiaosihao\normalfont}         % 目录节条目：中文宋体小四，英文数字Times New Roman小四，不加粗
\newcommand{\tocsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
\newcommand{\tocsubsubsectionfont}{\normalsize}      % 目录上X.Y.Z小节的字体
%\newcommand{\textchapterfont}{\centering\heiti\sihao\linespacing{1.5}} % 正文上第X章的字体：四号黑体居中，不加粗，1.5倍行距
%\newcommand{\textsectionfont}{\songti\sihao\linespacing{1.5}}            % 正文上X.Y节的字体：四号宋体左起，不加粗，1.5倍行距
%\newcommand{\textsubsectionfont}{\heiti\xiaosihao\linespacing{1.5}}     % 正文上X.Y.Z小节的字体：小四黑体左起，不加粗，1.5倍行距
\newcommand{\textchapterfont}{\centering\heiti\bfseries\sihao\linespacing{1.5}}% 正文上第X章的字体：四号黑体居中，加粗，1.5倍行距
\newcommand{\textsectionfont}{\songti\bfseries\sihao\linespacing{1.5}}% 正文上X.Y节的字体：四号宋体左起，加粗，1.5倍行距
\newcommand{\textsubsectionfont}{\heiti\bfseries\xiaosihao\linespacing{1.5}}% 正文上X.Y.Z小节的字体：小四黑体左起，加粗，1.5倍行距
\newcommand{\textsubsubsectionfont}{\heiti\xiaosihao}     % 正文上X.Y.Z.K小节的字体
\newcommand{\footnotefont}{\songti\xiaowuhao\normalfont}     % 脚注字体
\newcommand{\ftcaptionfont}{\songti\xiaosihao\normalfont}         % 图标题字体：小四，中文宋体，英文数字 Times New Roman
\newcommand{\tbcaptionfont}{\songti\xiaosihao\normalfont}         % 表标题字体：小四，中文宋体，英文数字 Times New Roman
\newcommand{\reftitlefont}{\heiti\xiaoerhao}      % “参考文献”字样的字体
\newcommand{\refbodyfont}{\songti\wuhao\normalfont}          % 参考文献字体
\newcommand{\thanktitlefont}{\heiti\sanhao}    % “致谢”字样的字体
\newcommand{\appendixtitlefont}{\heiti\sanhao} % “附录”字样的字体

% -----------------------------------------------------------------------------
% Figures and tables 图表环境
% -----------------------------------------------------------------------------
\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png} % 如果插入的图片没有指定扩展名,那么依次搜索下面的扩展名所对应的文件
\RequirePackage{subfig} % config兼容subfigure命令
\RequirePackage{float} % 可以使用［H］命令
\RequirePackage{caption} % 定义图的标题格式：居中. 使用caption3.0
\DeclareCaptionFont{capFont}{\ftcaptionfont} % 图名
\DeclareCaptionFont{tabCapFont}{\tbcaptionfont} % 表名
\DeclareCaptionLabelSeparator{twospace}{~~}
\captionsetup{ % 去掉图标签后的冒号
  labelsep=twospace,
  belowskip=0bp,
  aboveskip=0bp,
  font={capFont},
  figurename=图,
  tablename=表,
  listfigurename=插图目录,
  listtablename=表格目录
}
\captionsetup[figure]{position=bottom,justification=centering,singlelinecheck=true}
\captionsetup[table]{position=top,justification=centering,singlelinecheck=true,font={tabCapFont},aboveskip=14pt,belowskip=0pt}
\captionsetup[subfloat]{captionskip=6bp,nearskip=0bp,farskip=0bp,topadjust=0bp,justification=centering}

%%%%%%%%%%定义双标题命令
\newcommand{\FigureBicaption}[2]{%
  \renewcommand{\figurename}{图}%
  \vspace{8pt}%
  \caption{#1}%
  \addtocounter{figure}{-1}%
  \renewcommand{\figurename}{Fig.}%
  \captionsetup{list=false}%
  \vspace{6pt}%
  \caption{#2}%
  \captionsetup{list=true}%
  \renewcommand{\figurename}{图}%
}

\newcommand{\SubfloatCaption}[4]{%
  \subfloat[#2]{%
    \label{#3}%
    \addtocounter{subfigure}{-1}%
    \subfloat[\vspace{-5pt}#1]{#4}%
  }%
}

%% 表格
\RequirePackage{array} % 扩展了 array 和 tabular 环境功能
\RequirePackage{booktabs} % 增加对三线表格的支持 % \toprule，\midrule，\bottomrule
\RequirePackage{longtable} % 长表格支持，截断跨页
\RequirePackage{ctable, threeparttable} % 支持表格注释,复杂表格，一般用不上
%\RequirePackage{tabularx}
\AtBeginEnvironment{table}{%
  \renewcommand{\arraystretch}{1.2}% 表格内容 1.2 倍行距
  \songti\wuhao\normalfont% 表格内容：五号宋体，英文数字由 Times New Roman 处理
  \centering%
}
\AfterEndEnvironment{table}{\par\vspace{14pt}}% 表格结束后与正文之间空一行（宋体小四号）
\AtBeginEnvironment{longtable}{%
  \renewcommand{\arraystretch}{1.2}% 长表格内容 1.2 倍行距
  \songti\wuhao\normalfont% 长表格内容：五号宋体，英文数字由 Times New Roman 处理
}
\setlength{\LTpost}{14pt}% 长表格结束后与正文之间空一行（宋体小四号）
\newcommand{\ContinuedTableCaption}{%
  \caption[]{\hfill\tbcaptionfont 续表\thetable}\\
}
%定义双标题命令

\newcommand{\TableBicaption}[2]{%
  \renewcommand{\tablename}{表}%
  \caption{#1}%
  \addtocounter{table}{-1}%
  \renewcommand{\tablename}{Table}%
  \captionsetup{list=false}%
  \caption{#2}%
  \captionsetup{list=true}%
  \renewcommand{\tablename}{表}%
}

%伪代码  %%TODO
%\RequirePackage{algorithm}
%\RequirePackage{algpseudocode}
%% algorithm2e 中文标题定制
%\renewcommand{\algorithmicname}{算法}
%\renewcommand\thealgocf{\csname the\algocf@within\endcsname-\@arabic\c@algocf}%
%\renewcommand{\algorithmicrequire}{\textbf{Input:}}  % Use Input in the format of Algorithm
%\renewcommand{\algorithmicensure}{\textbf{Process:}} % Use Output in the format of Algorithm

\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}

\renewcommand{\thefootnote}{注\arabic{footnote}}
\setcounter{footnote}{0}

\renewcommand\fps@figure{htbp}% 设置图浮动的默认参数
\renewcommand\fps@table{htbp}
\renewcommand{\textfraction}{0.07}
\renewcommand{\topfraction}{0.9}
\renewcommand{\bottomfraction}{0.8}
\renewcommand{\floatpagefraction}{0.85}

% -----------------------------------------------------------------------------
% Lists and bibliography 列表和参考文献
% -----------------------------------------------------------------------------
\RequirePackage{paralist} % 修改列表格式
\setdefaultenum{1)}{a)}{i.}{A.} % 设置列表模式,for \enumerate
\setdefaultleftmargin{4ex}{}{}{}{}{}

\RequirePackage[numbers,super,square,sort&compress]{natbib} % 修改引用参考文献格式

% -----------------------------------------------------------------------------
% Listings
% -----------------------------------------------------------------------------
\RequirePackage{listings}
\definecolor{mygray}{RGB}{245,245,245}
\lstset{
  tabsize=4,
  frame=tb,
  commentstyle=\color{red!50!green!50!blue!50},
  rulesepcolor=\color{red!20!green!20!blue!20},
  keywordstyle=\color{blue!90}\bfseries,
  backgroundcolor=\color{mygray},
  showstringspaces=false,
  stringstyle=\ttfamily,
  basicstyle={\footnotesize\ttfamily},
  breaklines=true,
  keepspaces=true,
  flexiblecolumns=true,
  lineskip=-0.1pt,
  fontadjust,
  captionpos=t,
  framextopmargin=1pt,
  framexbottommargin=1pt,
  abovecaptionskip=-1pt,
  belowcaptionskip=1pt,
  extendedchars=false,
  columns=flexible,
  mathescape=false,
  breakautoindent=true
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头 added by Guan

%参考文献bibi style
\RequirePackage[nottoc]{tocbibind}
\renewcommand{\bibname}{参考文献}

% -----------------------------------------------------------------------------
% TOC and headings 设置目录
% -----------------------------------------------------------------------------
\RequirePackage{titletoc}
\renewcommand\contentsname{{\toctitlefont 目\hspace{1em}录}}

% 目录：仅保留章、节两级；章标题后空一格，节标题后不空格
% 二级目录（section）采用类似 Word TOC2 的样式：左侧缩进 2 个汉字宽度
\titlecontents{chapter}[0em]{\tocchapterfont}{%
    第\CJKnumber{\thecontentslabel}章\hspace{1em}}{}{%
    \titlerule*[5pt]{$\cdot$}\contentspage}
\titlecontents{section}[2em]{\tocsectionfont}{%
    \thecontentslabel}{}{%
    \titlerule*[5pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[4em]{\tocsubsectionfont}{%
    \thecontentslabel}{}{%
    \titlerule*[5pt]{$\cdot$}\contentspage}
\titlecontents{subsubsection}[6em]{\tocsubsubsectionfont}{%
    \thecontentslabel}{}{%
    \titlerule*[5pt]{$\cdot$}\contentspage}

% 设定章节深度和目录深度
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{1}

% Text style
\RequirePackage[pagestyles,rm]{titlesec}
\renewcommand{\chaptername}{第\thechapter 章}
\titleformat{\chapter}[hang]{\textchapterfont}{第\thechapter 章}{0.5em}{}
\titleformat{\section}[hang]{\textsectionfont}{\thesection}{0em}{}
\titleformat{\subsection}[hang]{\textsubsectionfont}{\thesubsection}{0em}{}
\titleformat{\subsubsection}[hang]{\textsubsectionfont}{\thesubsubsection}{1ex}{}% 小四黑体居左

%\titlespacing{\chapter}{0pt}{3ex plus .5ex minus .5ex}{3ex plus .5ex minus .5ex} % 缩短章节标题的上边距
\setlength{\parskip}{0ex}% 正文段前段后距：无空行
\titlespacing{\chapter}{0pt}{14pt}{14pt} % 章标题前后各空 1 行（按小四宋体行高 14pt）
\titlespacing{\section}{0pt}{1pt}{1pt}  % 标题间距
\titlespacing{\subsection}{0pt}{4pt}{0pt}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}

\newcommand{\linespacing}[1]{\linespread{#1}\selectfont}% 行距命令

% -----------------------------------------------------------------------------
% Unnumbered chapters and appendix helper
% -----------------------------------------------------------------------------
%有些章节名如“致谢”、“附录”，无需章节编号，相当于chapter*，但需要把章节名加入目录，相应的页眉也要改动
%通过\chapterx和\chapterxname来完成。
\def\chapterxname#1{\gdef\@chapterxname{#1}}
\newcommand{\chapterx}[1]{%
  \chapterxtrue
  \chapter*{#1}%
  \chapterxname{#1}%
  \addcontentsline{toc}{chapter}{#1}%
}

% Kept for compatibility with the old template.
\renewcommand{\appendix}[1]{%
  \cleardoublepage
  \renewcommand{\thesection}{{#1}\arabic{section}}%
  \chapter*{#1}%
  \chapterxname{#1}%
  \addcontentsline{toc}{chapter}{#1}%
  \setcounter{section}{0}%
}

\renewenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@
           \itemindent-1.5em%
           \listparindent\itemindent
           \rightmargin\leftmargin
           \advance\leftmargin 1.5em}%
   \item\relax}
  {\endlist}

\renewenvironment{quotation}
  {\list{}{\listparindent 1.5em%
           \itemindent\listparindent
           \rightmargin\leftmargin
           \parsep\z@ \@plus\p@}%
   \item\relax}
  {\endlist}

\renewenvironment{quote}
  {\list{}{\rightmargin\leftmargin}%
   \item\relax}
  {\endlist}

% -----------------------------------------------------------------------------
% Page style
% -----------------------------------------------------------------------------

\newpagestyle{revtitlestyle}{
 \ifchapterx
  \sethead{}{{\headfont{}\@chapterxname}}{}
 \else
  \sethead{}{{\headfont{}\chaptertitlename\quad\chaptertitle}}{}%显示章节标题，五号字体，居中
 \fi
  \setfoot{}{\headfont{}\thepage}{} %页码五号宋体居右
  \headrule%上横线
  \setheadrule{1.5pt}%设置横线粗细
}

\newpagestyle{abstractstyle}{
  \sethead{}{{\headfont{}\abstractheader}}{}
  \setfoot{}{\headfont{}\thepage}{}
  \headrule
  \setheadrule{1.5pt}
}

\newpagestyle{tocstyle}{
  \sethead{}{{\headfont{}目录}}{}
  \setfoot{}{\headfont{}\thepage}{}
  \headrule
  \setheadrule{1.5pt}
}

\let\orig@bibliography=\bibliography
\renewcommand{\bibliography}[1]{%
  \cleardoublepage % 使参考文献使用 seunolabel 页面样式
  \refbodyfont
  \chapterxtrue % 改变页眉标题方式
  \chapterxname{\bibname}
  \let\ps@plain=\ps@revtitlestyle
  \pagestyle{revtitlestyle}
  \orig@bibliography{#1}%
  \normalsize
}

% -----------------------------------------------------------------------------
% Front/main/back matter  主要模块
% -----------------------------------------------------------------------------
\renewcommand\frontmatter{% %标题之后，开始中英文摘要，目录
  \pagenumbering{Roman}% % Roman style page number
  \pagestyle{plain}%
  \@mainmatterfalse
}

\renewcommand{\tableofcontents}{%
  \clearpage
  \chapterxname{目录}%
  \chapterxtrue
  \thispagestyle{tocstyle}%
  \pagestyle{tocstyle}%
  {\parindent=0pt
   \centering
   \vspace*{14pt}% 前空 1 行（小四宋体行高）
   {\contentsname\par}%
   \vspace{14pt}% 后空 1 行（小四宋体行高）
  }
  \begingroup
    \linespacing{1.5}\selectfont
    \@starttoc{toc}%
  \endgroup
}

\renewcommand\mainmatter{%
  \@mainmattertrue
  \chapterxfalse % 改变页眉标题方式
  \ifodd\value{page} % 目录后如果是奇数页结尾，则插入一个无页码空白页
    \clearpage
    \pagestyle{empty}
    \mbox{} %空白占位符
  \fi
  \clearpage
  \pagenumbering{arabic}
  \makeatletter
  \let\ps@plain=\ps@revtitlestyle
  \makeatother
  \pagestyle{revtitlestyle}
}

% 开始正文部分

\renewcommand\backmatter{}

\AtBeginDocument{%
  \CJKindent
  \makeindex
  \normalsize %正文字体格式
  \linespacing{1.5} % 主行距 1.5 倍
}
\AtEndDocument{}

% -----------------------------------------------------------------------------
% Title page and abstracts
% -----------------------------------------------------------------------------
% 空一行：统一按“小四号宋体”的基线距离控制
\newcommand{\HQUblankline}{\par\vspace{14pt}}
% 单行换行间距：统一按“小四号宋体”的行距控制
\newcommand{\HQUmetalinegap}{\vspace{14pt}}
\newcommand{\HQUauthorinfoCN}{%
  \@major\quad \@grade\ 届\quad \@author\quad \@studentid%
}
\newcommand{\HQUtitleENfont}{\rmfamily\bfseries\sihao}
\newcommand{\HQUauthorENfont}{\rmfamily\xiaosihao}
\newcommand{\HQUformatCNAbstractStart}{%
  \clearpage
  \chapterxtrue
  \chapterxname{摘要}
  \thispagestyle{abstractstyle}%
  \pagestyle{abstractstyle}%
  \begin{center}%
    {\heiti\sanhao \@title\par}%
    {\songti\sihao \@institute\par}%
    {\songti\sihao \HQUauthorinfoCN\par}%
  \end{center}%
  \par\vspace{14pt}%
  \noindent{\absnamecn 摘要\hspace{1em}}%
  \begingroup\songti\xiaosihao\linespacing{1.5}\selectfont
}
\newcommand{\HQUformatCNAbstractEnd}{%
  \par\endgroup
}
\newcommand{\HQUformatENAbstractStart}{%
  \clearpage
  \chapterxtrue
  \chapterxname{Abstract}
  \thispagestyle{abstractstyle}%
  \pagestyle{abstractstyle}%
  \begin{center}%
    \vspace*{\baselineskip}%
    {\HQUtitleENfont \@titleEN\par}%
    \vspace{\baselineskip}%
    {\HQUauthorENfont \@authoren\par}%
    {\HQUauthorENfont \@studentid, \@majoren\ Major, \@grade\par}%
    {\HQUauthorENfont \@instituteen\par}%
  \end{center}%
  \par\vspace{14pt}%
  \noindent{\absnameen Abstract:\ }%
  \begingroup\absbodyen\linespacing{1.5}\selectfont
  \rightskip=0pt\relax
  \leftskip=0pt\relax
  \spaceskip=0.3333em plus 0.1667em minus 0.1111em\relax
  \xspaceskip=0.5em\relax
  \parfillskip=0pt plus 1fil\relax
}
\newcommand{\HQUformatENAbstractEnd}{%
  \par\endgroup
}
\renewcommand{\maketitle}{%
  \ifpdfcover
    \includepdf[pages=1]{thesis_cover.pdf}%pdf文件路径为主文件tex或lyx的当前目录
  \else
    \begin{titlepage}
      \raggedleft
      \null
      \vskip 4em
      \centerline{\songti\erhao \thesissubject}
      \vskip 4em
      \centerline{\heiti\yihao \@title}
      \vskip 2em
      \centerline{\songti\erhao \@author}
      \bigskip
      \centerline{\songti\erhao \@supervisor}
      \vfill
      \centerline{\songti\normalsize\@institute}
      \centerline{\songti\normalsize\@date}
    \end{titlepage}
  \fi
}

\newenvironment{abstractCN}
{
  \HQUformatCNAbstractStart
}{
  \HQUformatCNAbstractEnd
}

%%摘要分中英文页，而且有两者排版方式：
%一种是采用\abstractCN和\abstractEN方式以“摘要”和“Abstract”为页标题
%另一种采用研究报告的标题为摘要页的标题，这时使用\charpter*{报告中文或英文标题}和\chapterx{摘要或Abstract}

\newenvironment{abstractEN}
{
  \HQUformatENAbstractStart
}{
  \HQUformatENAbstractEnd
}

% 中文关键词固定间隔：两个英文空格宽度（近似）
% 说明：LaTeX 会压缩连续普通空格，因此在 tex 中直接敲两个空格通常不会生效。
% 这里定义为约 0.67em，接近 Times/宋体环境下两个英文空格的视觉宽度。
\newcommand{\HQUCNKeywordSep}{\hspace{0.67em}}
% 在 tex 中请用 \kwsep 手动分隔各个关键词
\newcommand{\kwsep}{\HQUCNKeywordSep}

\newcommand{\keywordsCN}[1]{%
  \par\HQUblankline
  {\noindent\abskeycn 关键词\hspace{0.67em}}{\abskeyscn #1\par}%
  \clearpage
}

\newcommand{\keywordsEN}[1]{%
  \par\HQUblankline
  {\noindent\abskeyen Key words:\ }{\abskeysen #1\par}%
  \clearpage
}

\newcommand{\abstractx}[1]{%
  \begin{center}#1\par\end{center}%
  \addcontentsline{toc}{chapter}{#1}%
}

% -----------------------------------------------------------------------------
% Math and theorem environments
% -----------------------------------------------------------------------------
\RequirePackage{bm} % 数学符号粗体
\RequirePackage{amsmath,amsthm,mathrsfs}
%允许公式换页显示,否则大型推导公式都在一页内，
%一页显示不下放到第二页，导致很大的空白空间，很不好看
\allowdisplaybreaks[4]
%\setlength\jot{1pt} %公式之间的距离,TODO

%%定义数学类环境
\newtheoremstyle{definition}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{definition}
\newtheorem{definition}{定义~}[chapter]
\newtheorem{example}{例~}[chapter]
\newtheorem{remark}{说明~}[chapter]


\newtheoremstyle{plain}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {\itshape}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
\newtheorem{proposition}{命题~}[chapter]
\newtheorem{lemma}{引理~}[chapter]
\newtheorem{theorem}{定理~}[chapter]
\newtheorem{axiom}{公理~}[chapter]
\newtheorem{corollary}{ 推论~}[chapter]
\newtheorem{case}{情形~}[chapter]
\newtheorem{conjecture}{猜想~}[chapter]
\newtheorem{property}{性质~}[chapter]

\renewenvironment{proof}{\vskip 1pt\indent \itshape 证明:~\normalfont}{\hfill$\square$\vskip 0.01\baselineskip} %$\blacksquare$
%\renewcommand{\proofname}{\hskip 2em 证明:~} %
%%%%%%%%%%%%%%%%%   end of 定理环境
\setlength\abovedisplayskip{4pt}
\setlength\belowdisplayskip{4pt}

\endinput
%% End of file `hquthesis.cls'.
