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

通过合适的缩进，嵌套列表可以轻松实现。
之间添加一个空行将生成一个更#link("https://typst.app/docs/reference/model/list/#parameters-tight")[宽松]的列表。

要获取一个#link("https://typst.app/docs/reference/model/enum/")[有序列表]（即，enumerate） ，只需使用 `+` 号代替连字符（`-`）。
对于#link("https://typst.app/docs/reference/model/terms/")[术语列表]（即，description），使用 `/ 术语：解释` 来创建（即，`/ Term: List`）。

== 如何使用命令？

LaTeX还是大量使用命令（以反斜线开头）。这些宏命令用于影响排版过程并插入和对内容的操纵。
一些命令接受参数，通常用花括号括起来：```latex \cite{rasmus}```。

Typst区分了#link("https://typst.app/docs/reference/scripting/#blocks")[markup模式和代码模式]。默认情况下是markup模式，您可以组合文本并应用语法结构，
例如使用星号 `*` 来加粗文本(*```typst *星号加粗文本* ```*)。代码模式则类似编程语言，例如Python，提供输入和执行代码段的选项。

在Typst的markup中，您可以使用井号（`#`）转换到代码模式以调用单个命令（或表达式）。
例如，您可以使用函数来将项目分割成不同的#link("https://typst.app/docs/reference/scripting/#modules")[文件]
或根据某些#link("https://typst.app/docs/reference/scripting/#conditionals")[条件]渲染文本。
在代码模式中，您可以使用方括号（`[ ]`）括起来的普通markup内容。 在代码模式中，这些内容将被视为变量的普通值。

#box(height: 200pt,
  columns(2, gutter: 11pt)[
  ```typst 
First, a rectangle:
#rect()

Let me show how to do
#underline([_underlined_ text])

We can also do some maths:
#calc.max(3, 2 * 4)

And finally a little loop:
#for x in range(3) [
  Hi #x.
]
```

  #align(center, image("images/5-right-yulan-3.png"))
])

函数调用始终涉及到函数名称（如 #link("https://typst.app/docs/reference/visualize/rect/")[`rect`]、
#link("https://typst.app/docs/reference/text/underline/")[`underline`]、
#link("https://typst.app/docs/reference/foundations/calc/#functions-max")[`calc.max`]、
#link("https://typst.app/docs/reference/foundations/array/#definitions-range")[`range`]），
后跟*圆括号*（与LaTeX不同，LaTeX中如果宏不需要参数，方括号和花括号是可选的）。
圆括号中的参数列表取决于具体函数，更多细节可以参看#link("https://typst.app/docs/reference/")[Typst的参考指导]。

=== 参数 / Arguments

一个函数可以有多个参数。一些参数是位置参数，即您只需提供值：
例如，函数 ```typst #lower("SCREAM")``` 将其参数转换为小写。
许多函数使用命名参数而不是位置参数来提高可读性。例如，矩形的尺寸和描边是使用命名参数定义的：

#box(height: 100pt,
  columns(2, gutter: 11pt)[
  ```typst 
#rect(
  width: 2cm,
  height: 1cm,
  stroke: red,
)

```

  #align(center, image("images/5-right-yulan-4.png"))
])

你可以通过首先输入参数的名称（在这里是宽度`width`、高度`height`和笔划`stroke`），然后是一个冒号`:`，接着是值（`2cm`、`1cm`、`red`）。
你可以在每个函数的#link("https://typst.app/docs/reference/")[参考页面]或自动补全面板中找到可用的命名参数。
命名参数类似于LaTeX环境的配置方式，例如，你可以键入 ```latex \begin{enumerate}[label={\alph*)}]``` 来启动一个带有 `a）`、`b）`等标签的列表。

通常，你想向函数添加一些#link("https://typst.app/docs/reference/foundations/content/")[文本内容]。
例如，LaTeX命令 ```latex \underline{备选 A}``` 在Typst中是 ```typst #underline([备选 A])```。
方括号表明是一个值是#link("https://typst.app/docs/reference/foundations/content/")[文本内容]。在这些括号中，你可以使用普通标记。
然而，对于这样一个简单的构造来说，括号就有些太多了。这就是为什么你也可以在括号后面移动尾随内容参数（并且如果它们变得空了，可以省略括号）。

#box(height: 100pt,
  columns(2, gutter: 11pt)[
  ```typst 
Typst is an #underline[alternative]
to LaTeX.

#rect(fill: aqua)[Get started here!]
```

  #align(center, image("images/5-right-yulan-5.png"))
])

=== 数据类型

可能你已经发现这些参数具有明显的数据类型。Typst支持许多#link("https://typst.app/docs/reference/foundations/type/")[数据类型]。
下面是一个表格，其中包含一些最重要的数据类型以及如何编写它们。为了指定这些类型的值，您必须处于代码模式！

#table(
  columns: (1fr,2fr), 
  stroke: none,
  table.header[*数据类型*][*例子*],
  table.hline(),
  [#link("https://typst.app/docs/reference/foundations/content/")[内容/content]],[```typst [*fast* typesetting] ```],
  [#link("https://typst.app/docs/reference/foundations/str/")[字符串/string]],[```typst "Pietro S. Author" ```],
  [#link("https://typst.app/docs/reference/foundations/int/")[整数/integer]],[```typst 23 ```],
  [#link("https://typst.app/docs/reference/foundations/float/")[浮点数/float]],[```typst 1.459 ```],
  [#link("https://typst.app/docs/reference/layout/length/")[绝对长度]],[```typst 12pt, 5in, 0.3cm, ... ```],
  [#link("https://typst.app/docs/reference/layout/ratio/")[相对长度]],[```typst 65% ```],
)

