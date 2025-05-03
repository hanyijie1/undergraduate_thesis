
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
%
%  Copyright 2016-2025 Wen Wang <wangwen1192@outlook.com>
%
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license or (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.
%
%  This work has the LPPL maintenance status `maintained'.
%
%  The Current Maintainer of this work is Wen Wang <wangwen1192@outlook.com>.
%
%  This work consists of the files thesis-uestc.cls, thesis-uestc.bst.
%


ENTRY
{
  author
  title
  publisher
  journal
  address
  year
  date
  pages
  translator
  booktitle
  institution
  country
  url
  volume
  number
  type
  id
  note
  language
  eprint
}
{}
{label}

STRINGS { s t}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

INTEGERS{ l }
FUNCTION{ string.length }
{
    #1 'l :=
    {duplicate$ duplicate$ #1 l substring$ = not}
        {l #1 + 'l :=}
    while$
    pop$ l
}

FUNCTION {get.last.chr}
{
  duplicate$ string.length
  duplicate$ #0 = {
    pop$
  } {
    #1 substring$
  } if$
}

FUNCTION {trim.start}
{
  {duplicate$ #1 #1 substring$ " " =} {
    #2 global.max$ substring$
  } while$
}

FUNCTION {trim.end}
{
  {duplicate$ get.last.chr " " =} {
    duplicate$ string.length #1 -
    #1 swap$ substring$
  } while$
}

FUNCTION {trim}
{
  trim.start
  trim.end
}

FUNCTION {bbl.etal}
{ "et~al" }

FUNCTION {bbl.deng}
{ "等" }

FUNCTION {bib.begin}
{
    "\begin{thebibliography}{\bstlabelmark}"
    write$ newline$
    "\interlinepenalty=10000"
    write$ newline$
    "\setlength{\itemsep}{0bp}\setlength{\parskip}{0pt}\small"
    write$
    newline$
}

FUNCTION {bib.end}
{
    "\end{thebibliography}"
    write$
    newline$
}

FUNCTION {bibitem.begin}
{
    "\bibitem{" cite$ *
    "} " *
    write$
}

FUNCTION {bibinfo.check}
{ swap$
  duplicate$ missing$
    {
      pop$ pop$
      ""
    }
    { duplicate$ empty$
        {
          swap$ pop$
        }
        { swap$
          pop$
        }
      if$
    }
  if$
}

INTEGERS { nameptr namesleft numnames }


STRINGS  { bibinfo}

FUNCTION {format.names.old}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ll~}{f}{vv~}{jj}"
      format.name$
      bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              "," *
              t "others" =
                {
                  " " * bbl.etal *
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}

STRINGS{replace find text}
INTEGERS{find_length}
FUNCTION{find.replace}
{
    'replace :=
    'find :=
    'text :=
    find string.length 'find_length :=
    ""
    { text empty$ not }
        { text #1 find_length substring$ find =
            {
                replace *
                text #1 find_length + global.max$ substring$ 'text :=
            }
            {
                text #1 #1 substring$ *
                text #2 global.max$ substring$ 'text :=
            }
        if$
        }
    while$
}

FUNCTION{find.substring}
{
    'find :=
    'text :=

    find string.length 'find_length :=
    #0
    { text empty$ not }
        { text #1 find_length substring$ find =
            {
                text #1 find_length + global.max$ substring$ 'text :=
                not
            }
            {
                text #2 global.max$ substring$ 'text :=
            }
        if$
        }
    while$
}

FUNCTION {format.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ff~}{vv~}{ll}{, jj}"
      format.name$
      bibinfo bibinfo.check

      't :=
      t "\textbf" find.substring
        {
          t "\textbf" "" find.replace 't :=
          t string.length 'l :=
          t #2 l #2 - substring$ 't :=
          t #1 "{ll~}{f}{vv~}{jj}" format.name$ "." "" find.replace 't :=
          "\textbf{" t * "}" * 't :=
        }
        {
          t #1 "{ll~}{f}{vv~}{jj}" format.name$ "." "" find.replace 't :=
        }
      if$

      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              "," *
              t "others" =
                {
                  " " * bbl.etal *
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}

FUNCTION {format.chinese.names}
{ 'bibinfo :=
  duplicate$ empty$ 'skip$ {
  's :=
  "" 't :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ll}"
      format.name$
      % bibinfo bibinfo.check
      't :=
      nameptr #1 >
        {
          nameptr #3
          #1 + =
          numnames #3
          > and
            { "others" 't :=
              #1 'namesleft := }
            'skip$
          if$
          namesleft #1 >
            { ", " * t * }
            {
              s nameptr "{ll}" format.name$ duplicate$ "others" =
                { 't := }
                { pop$ }
              if$
              "others" t =
              'skip$
              { "," * }
              if$
              t "others" =
                {
                  " " * bbl.deng *
                }
                { " " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
  } if$
}

FUNCTION {format.authors}
{
  language missing$
    { author "author" format.names }
    {
      language "zh" =
        { author "author" format.chinese.names }
        { author "author" format.names }
      if$
    }
  if$
}

FUNCTION {format.title}
{
    title "t" change.case$
}

FUNCTION {format.publisher}
{
    publisher
}

FUNCTION {format.booktitle}
{
    booktitle
}


FUNCTION {format.journal}
{
    journal
}

FUNCTION {format.address}
{
    address
}

FUNCTION {format.year}
{
    year
}

FUNCTION {format.date}
{
    date
}

FUNCTION {format.country}
{
    country
}

FUNCTION {format.type}
{
    type
}

FUNCTION {format.id}
{
    id
}

FUNCTION {format.pages}
{
    pages "--" "-" find.replace
    " " "" find.replace
}

FUNCTION {format.institution}
{
    institution
}

FUNCTION {format.url}
{
    "\url{" url *
    "}" *
}
FUNCTION {add.period}
{
    ". " write$
}

FUNCTION {add.comma}
{
    ", " write$
}

FUNCTION {book}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$
    
    format.authors write$ add.period
    format.title "[M]" * write$ add.period
    translator missing$
    'skip$
    {
        "(" translator "translator" format.names *
        ")" * write$
        add.period
    } if$
    address missing$
    'skip$
    {
        format.address write$ ": " write$
    } if$
    format.publisher write$ add.comma
    format.year write$
    pages missing$
    'skip$
    {
        add.comma
        format.pages write$
    } if$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

FUNCTION {incollection}
{
    book
}

FUNCTION {conference}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$

    format.authors write$ add.period
    format.title "[C]" * write$ add.period
    journal missing$
    {
        format.booktitle write$
    } {
        format.journal write$
    } if$

    add.comma
    address missing$
    'skip$
    {
        format.address write$ add.comma
    } if$
    country missing$
    'skip$
    {
        format.country write$ add.comma
    } if$
    format.year write$
    pages missing$
    'skip$
    {
        ": " write$
        format.pages write$
    } if$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

FUNCTION {proceedings}
{
    conference
}

FUNCTION {inproceedings}
{
    conference
}

FUNCTION {article}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$
    format.authors write$ add.period
    format.title "[J]" * write$ add.period
    format.journal write$ add.comma
    format.year write$
    
    volume missing$ {
      pages missing$ 'skip$
      {
        add.comma
        format.pages write$
      } if$
    }
    { add.comma
      number missing$ { volume write$ }
      {
        volume "(" * number *
        ")" * write$
      } if$
      pages missing$ 'skip$ { ": " format.pages * write$ } if$
    } if$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

FUNCTION {thesis}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$

    format.authors write$ add.period
    format.title "[D]" * write$ add.period
    address missing$
    'skip$
    {
        format.address write$ ": " write$
    } if$
    format.institution write$ add.comma
    format.year write$ add.comma
    format.pages write$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

FUNCTION {masterthesis}
{
    thesis
}

FUNCTION {phdthesis}
{
    thesis
}

FUNCTION {newspaper}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$

    format.authors write$ add.period
    format.title "[N]" * write$ add.period
    journal missing$
    {
        format.booktitle write$
    } {
        format.journal write$
    } if$
    add.comma

    format.date write$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

FUNCTION {techreport}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$

    format.authors write$ add.period
    format.title "[R]" * write$ add.period
    address missing$
    'skip$
    {
        format.address write$ ": " write$
    } if$
    format.institution write$ add.comma
    format.date write$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

FUNCTION {patent}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$

    format.authors write$ add.period
    format.title "[P]" * write$ add.period
    format.country write$ add.comma
    format.type write$ add.comma
    format.id write$ add.comma
    format.date write$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

FUNCTION {standard}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$

    format.institution write$ add.period
    format.id write$ add.period
    format.title "[S]" * write$ add.period
    format.address write$ ": " write$
    format.publisher write$ add.comma
    format.date write$
    "." write$
    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$
    newline$
}

FUNCTION {digital}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$

    format.authors write$ add.period
    format.title write$
    "[" format.type * "]" * write$ add.period
    format.date write$ add.comma
    format.url write$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

FUNCTION {misc}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$

    format.authors write$ add.period
    format.title write$
    "[J]. CoRR abs/" eprint * write$ add.comma
    format.year write$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

FUNCTION {onlynote}
{
    bibitem.begin

    url missing$
    { }  % 无url时不做任何操作
    { "\href{" url * "}{" * write$ }  % 有url时写入\href{url}{
    if$

    note write$
    "." write$

    url missing$
      { }  % 无url时不闭合
      { "}" write$ }  % 有url时闭合
    if$

    newline$
}

READ

EXECUTE {bib.begin}

ITERATE {call.type$}

EXECUTE {bib.end}
