#set text(font:("Consolas", "Source Han Sans SC"))
#set text(lang: "zh")
#show emph: text.with(font: ("Linux Libertine","STKaiti"))
#show link: text.with(fill: color.blue)

= LaTeX用户指南

#v(2.5em)

如果您之前使用过LaTeX，现在想尝试Typst，这个指南是一个良好的起点。我们将从用户的角度探讨这两个系统之间的主要区别。
尽管Typst并不基于LaTeX，并且语法不同，但您将学习如何利用您之前的LaTeX技能来获得先机。

与LaTeX一样，Typst也是基于标记的排版系统：在文本文件中撰写文档，并用命令和其他语法进行标记。
然后，使用一个编译器将源文件排版成PDF。然而，Typst在多个方面也与LaTeX不同：
首先，Typst为常见任务使用了更专用的语法（类似于您可能在Markdown中知道的那样）。 
Typst的命令也更加统一：它们的运作方式相同，因此与LaTeX不同的是，您只需理解几个基本概念，而无需为每个包学习不同的约定。
此外，Typst的编译速度比LaTeX快：编译通常以毫秒为单位，而非秒，因此网络应用和编译器均可提供即时预览。

接下来，我们将解答用户从LaTeX切换到Typst时在撰写文档时最常见的一些问题。如果您更喜欢分步介绍Typst，
请查看我们的#link("https://typst.app/docs/tutorial/")[教程]。

== 安装

有两种方式使用Typst：在我们的#link("https://typst.app/signup/")[网络应用程序]中或在您的计算机上#link("https://github.com/typst/typst/releases")[安装编译器]。
当使用网络应用程序时，我们提供了一个包含所有组件的协作编辑器，在浏览器中运行Typst，并且无需安装。

如果选择在计算机上使用Typst，您可以下载编译器，而且只是一个小巧的二进制文件，任何用户都可以运行，无需root权限。
与LaTeX不同，包将在第一次使用时下载，然后缓存在本地，从而保持Typst安装的轻便性。
使用本地编译器，您可以使用自己的编辑器，并选择文件存储位置。

== 如何创建一个新的空白文档？

很简单。只需创建一个新的空白文本文件（文件扩展名为`.typ`）。无需任何样板代码就可以开始。只是开始编写您的文本，它将被设置在一个空白的A4尺寸页面上。
如果您使用网络应用程序，单击“`+ Empty document`”以创建一个新的项目，包括文件，并进入编辑器。
#link("https://typst.app/docs/reference/model/parbreak/")[段落换行]与在LaTeX中相同，只需使用一个空白行。

#box(height: 80pt,
  columns(2, gutter: 11pt)[
  ```typst 

Hey there!

Here are two paragraphs. The
output is shown to the right.
```

  #align(center, image("images/5-right-yulan-1.png"))
])

如果您已经拥有一个现有的LaTeX文档想要使用Typst，您可以使用 #link("https://pandoc.org/")[Pandoc] 将源代码转换为Typst标记语言。
这种转换也已经集成到我们的网络应用程序中，所以可以直接上传 `.tex` 文件就可以开始Typst的项目。

== 如何创建标题、强调、……?

LaTeX使用命令 `\section` 创建标题。嵌套标题使用 `\subsection`、`\subsubsection` 等，具体取决于文档类别，还有 `\part` 或 `\chapter`。

在Typst中，#link("https://typst.app/docs/reference/model/heading/")[标题语法（`heading`）]更简洁：
您可以在标题行前添加一个等号和一个空格来获取一级标题：`= 介绍`。如果您需要二级标题，可以使用两个等号：`== 下一个标题`。
您可以通过添加更多等号来嵌套任意深度的标题。

强调（Emphasis，通常呈现为斜体文本）可以通过将文本括在下滑线中来表示（`_下划线_`），
而强烈强调（strong emphasis， 通常呈现为粗体文本）可以通过使用星号来标记（`*加粗*`）。

以下是LaTeX中常见的标记命令及其Typst等效命令的对照表。
您也可以查看#link("https://typst.app/docs/reference/syntax/")[完整的语法速查表]来了解详情。

#table(
  columns: (0.75fr,1.4fr,1.2fr,1fr),
  stroke: none,
  table.header[*元素*][*LaTex*][*Typst*][*详情*],
  table.hline(),
  [文本加粗],[```latex \textbf{strong}```],[```typst *strong*```],[#link("https://typst.app/docs/reference/model/strong/")[加粗（strong）]],
  [斜体],[```latex \emph{emphasis}```],[```typst _emphasis_```],[#link("https://typst.app/docs/reference/model/emph/")[斜体（emph）]],
  [程序源码],[```latex \texttt{print(1)}```],[```typst `print(1)` ```],[#link("https://typst.app/docs/reference/text/raw/")[源码（raw）]],
  [链接],[```latex \url{https://typst.app}```],[```typst https://typst.app```],[#link("https://typst.app/docs/reference/model/link/")[链接（link）]],
  [标签],[```latex \label{intro}```],[```typst <intro>```],[#link("https://typst.app/docs/reference/foundations/label/")[标签（label）]],
  [参考],[```latex \ref{intro}```],[```typst @intro```],[#link("https://typst.app/docs/reference/model/ref/")[参考（ref）]],
  [引文],[```latex \cite{humphrey97}```],[```typst @humphrey97```],[#link("https://typst.app/docs/reference/model/cite/")[引文（cite）]],
  [无序列表],[```latex itemize 环境```],[```typst - item```],[#link("https://typst.app/docs/reference/model/strong/")[无序列表（list）]],
  [有序列表],[```latex enumerate 环境```],[```typst + item```],[#link("https://typst.app/docs/reference/model/strong/")[有序列表（enum）]],
  [术语列表],[```latex description 环境```],[```typst / Term: List```],[#link("https://typst.app/docs/reference/model/terms/")[术语列表（terms）]],
  [图片],[```latex figure 环境```],[`figure` 函数],[#link("https://typst.app/docs/reference/model/figure/")[图片（figure）]],
  [表格],[```latex table 环境```],[`table` 函数],[#link("https://typst.app/docs/reference/model/table/")[表格（table）]],
  [公式],[```latex $x$, align / equation 环境```],[```typst $x$, $ x = y $ ```],[#link("https://typst.app/docs/reference/math/equation/")[公式（equation）]]
)

Typst中的#link("https://typst.app/docs/reference/model/list/")[列表(Lists)]不依赖于环境，而是使用轻量级语法，类似于标题。
要创建一个无序列表（`itemize`），您可以在每个项目项前添加一个连字符（`-`）：

#box(height: 200pt,
  columns(2, gutter: 11pt)[
  ```typst 
To write this list in Typst...

···latex
\begin{itemize}
  \item Fast
  \item Flexible
  \item Intuitive
\end{itemize}
···

...just type this:

- Fast
- Flexible
- Intuitive
```

  #align(center, image("images/5-right-yulan-2.png"))
])

