#set text(font:("Consolas", "Source Han Sans SC"))
#set text(lang: "zh")
#show emph: text.with(font: ("Linux Libertine","STKaiti"))
#show link: text.with(fill: color.blue)

= 高级排版样式

在本教程的前两章中，你已学会了如何在 Typst 中撰写文档并更改其格式。你在过去两章中编写的报告获得了满分的好成绩，你的上司甚至想以此为基础，撰写一篇会议论文！当然，这份报告必须符合会议的风格指南。让我们来看看如何达成这一目标。

在开始之前，让我们创建一个团队，邀请你的上司加入，并将他们添加到团队中。你可以通过点击编辑器左上角的四圈图标，返回应用程序的仪表板来完成这一步骤。接着，在左侧工具栏选择加号图标，创建一个新的团队。最后，点击新团队，通过点击团队名称旁的“管理团队”进入团队设置。现在，你就可以通过电子邮件邀请你的上司加入团队了。

#align(center, image("images/3-advanced-team-settings.png", width: 95%))

接下来，将你的项目移入团队：打开项目，通过左侧工具栏的齿轮图标进入设置，然后在所有者下拉菜单中选择你的新团队。记得保存你的更改！

现在，你的上司也可以编辑这个项目，你们两人可以实时看到对方所做的改动。你可以加入我们的#link("https://discord.gg/2uDybryKPe")[Discord服务器]，找到其他用户，尝试与他们组建团队协作！

== 会议论文的规范指南

会议的排版指南已在会议网站上公布。让我们来看看这些要求：

- 字体应为`11pt`的衬线字体
- 标题应为`17pt`并加粗
- 论文包含一个单列的摘要和两列的主体文本
- 摘要应居中
- 主体文本应对齐
- 一级标题应为`13pt`、居中，并使用小写字母大写形式
- 二级标题使用行内格式，斜体，并与正文大小相同
- 最后，页面应为美国信纸大小，页码位于页脚的中间，每页的右上角应包含论文标题

我们已经知道如何完成其中的许多事项，但对于某些内容，我们需要学习一些新技巧。

== 制定正确的规则集

我们先写一些文档的设定规则。

#box(height: 200pt,
  columns(2, gutter: 11pt)[
  ```typst #set page(
  paper: "us-letter",
  header: align(right)[
    A fluid dynamic model for
    glacier flow
  ],
  numbering: "1",
)
#set par(justify: true)
#set text(
  font: "Linux Libertine",
  size: 11pt,
)

#lorem(600)```

  #align(center, image("images/3-right-yulan-1.png"))
])

你已经很熟悉这里的大部分内容了。我们将文本大小设置为`11pt`，字体设置为`Linux Libertine`。我们也开启了段落对齐并设置了纸张大小为美国信纸。

`header`参数是新的：通过它，我们可以提供内容来填充每页的上边距。在页眉中，我们按照会议风格指南的要求指定了论文标题。我们使用`align`函数将文本右对齐。

最后但同样重要的是编号参数(`numbering`)。在这里，我们可以提供一个#link("https://typst.app/docs/reference/model/numbering/")[编号模式]，定义如何对页面进行编号。通过将into设置为#text(fill:orange)[`"1"`]，Typst只显示纯文本页码。将其设置为#text(fill:orange)[`"(1/1)"`]将显示当前页和总页数，这里需要用括号包围起来。另外，我们甚至可以提供一个完全自定义的函数来按照我们的喜好格式化内容。

== 创建标题和摘要

现在让我来写标题和摘要。从标题开始，我们将其居中对齐，并通过用SS`*星号*`括起来，来增加其字体权重。

#box(height: 90pt,
  columns(2, gutter: 11pt)[
  ```typst #align(center, text(17pt)[
  *A fluid dynamic model
  for glacier flow*
])```

  #align(center, image("images/3-right-yulan-2.png"))
])

这看起来正确。我们使用了`text`函数来局部覆盖先前设置的文本规则，将函数参数的字体大小增加到`17pt`。让我们也添加作者列表：由于我们是与导师一起撰写这篇论文，我们将添加自己的名字和导师的名字。

#box(height: 160pt,
  columns(2, gutter: 11pt)[
  ```typst #grid(
  columns: (1fr, 1fr),
  align(center)[
    Therese Tungsten \
    Artos Institute \
    #link("mailto:tung@artos.edu")
  ],
  align(center)[
    Dr. John Doe \
    Artos Institute \
    #link("mailto:doe@artos.edu")
  ])```

  #align(center, image("images/3-right-yulan-3.png"))
])

两个作者块并排布局。我们使用#link("https://typst.app/docs/reference/layout/grid/")[`grid`]函数来创建这种布局。通过grid网格，我们可以精确控制每列的大小以及哪些内容放入哪个单元格。`columns`参数接受一个#link("https://typst.app/docs/reference/layout/relative/")[相对长度（_relative lengths_）]或#link("https://typst.app/docs/reference/layout/fraction/")[分数（_fractions_）]的数组。在这种情况下，我们传入了两个相等的分数大小，告诉它将可用空间分成两个相等的列。然后我们向`grid`函数传递了两个内容参数。第一个包含我们自己的详细信息，第二个包含我们导师的信息。我们再次使用`align`函数来使内容在列中居中。网格接受任意数量的内容参数来指定单元格。行会自动添加，但也可以通过`rows`参数手动设置大小。

现在，让我们添加摘要。请记住，会议要求摘要设置为相对居中对齐。

#box(height: 100pt,
  columns(2, gutter: 11pt)[
  ```typst ...

#align(center)[
  #set par(justify: false)
  *Abstract* \
  #lorem(80)
]```

  #align(center, image("images/3-right-yulan-4.png"))
])

很好！需要注意的是，我们在`align`的内容参数中使用了一个设置规则，以关闭摘要的对齐。这不会影响文档的其余部分，即使它是在第一个设置规则之后指定的，因为内容块只在限定的范围内被样式化处理。在内容块中设置的任何内容都只会影响该块内的内容。

另一个可能的调整是将论文标题保存在变量中，以便我们不必两次输入，用于标题和页眉。我们可以使用`let`关键字来完成此操作：

#box(height: 300pt,
  columns(2, gutter: 11pt)[
  ```typst #let title = [
  A fluid dynamic model
  for glacier flow
]

...

#set page(
  header: align(
    right + horizon,
    title
  ),
  ...
)

#align(center, text(17pt)[
  *#title*
])

...
]```

  #align(center, image("images/3-right-yulan-5.png"))
])

在我们将内容绑定到`title`变量之后，我们可以在函数中使用它，也可以在标记中使用它（前缀为`#`，就像函数一样）。这样，如果我们决定使用另一个标题，我们可以很容易地在一个地方进行更改。

== 增加列和标题

有点糟糕的是，上面的论文看起来像糅在一起的一整坨铅块。为了解决这个问题，让我们添加一些标题并将我们的论文更改为两列布局。#link("https://typst.app/docs/reference/layout/columns/")[`columns`]函数接受一个数字和内容，并将内容布局到指定的列数中。由于我们希望摘要之后的所有内容都在两列中，因此我们需要将`columns`函数应用于整个文档。

我们不需要将整个文档包装在一个巨大的函数调用中，而是可以使用 _“everything”_ `show`规则。要编写这样的`show`规则，请在`show`关键字后面直接放置一个冒号，然后提供一个函数。此函数将作为参数传递给文档的其余部分。我们在这里称它为`rest`，但你可以自由选择任何名称。然后，该函数可以对此内容执行任何操作。在我们当前这个例子里，它将其传递给`columns`函数。

#box(height: 300pt,
  columns(2, gutter: 11pt)[
  ```typst ...

#show: rest => columns(2, rest)

= Introduction
#lorem(300)

= Related Work
#lorem(200)```

  #align(center, image("images/3-right-yulan-6.png"))
])

现在只剩下一件事要做了：为我们的标题设置样式。我们需要将它们居中对齐并使用小写字母大写形式。由于`heading`函数没有提供设置这些选项的方法，我们需要编写自己的_heading_ `show`规则。

#box(height: 300pt,
  columns(2, gutter: 11pt)[
  ```typst #show heading: it => [
  #set align(center)
  #set text(12pt, weight: "regular")
  #block(smallcaps(it.body))
]

...```

  #align(center, image("images/3-right-yulan-7.png"))
])

这看起来很棒！我们使用了一个适用于所有标题的`show`规则。我们为其提供了一个函数，该函数将标题的参数作为参数传递。该参数可以用作内容，但它还有一些字段，如`title`、`numbers`和`level`，我们可以从中组合出自定义的外观。在这里，我们正在居中对齐、将字体粗细设置为#text(fill:orange)["regular"(正常)]，因为默认情况下标题是粗体的，并使用#link("https://typst.app/docs/reference/text/smallcaps/")[`smallcaps`]函数将标题的标题呈现为小写字母大写形式。

最后一个问题是所有标题看起来都一样了。“Motivation”和“Problem Statement”子标题应该以斜体设定标题，但现在它们看起来与上级标题无法区分。我们可以通过在我们设定规则使用`where`选择器来解决这个问题：这是一个我们可以在标题（和其他元素）上调用的方法，它允许我们按照它们的级别过滤它们。我们可以使用它来区分各级标题：

#box(height: 300pt,
  columns(2, gutter: 11pt)[
  ```typst #show heading.where(
  level: 1
): it => block(width: 100%)[
  #set align(center)
  #set text(12pt, weight: "regular")
  #smallcaps(it.body)
]

#show heading.where(
  level: 2
): it => text(
  size: 11pt,
  weight: "regular",
  style: "italic",
  it.body + [.],
)```

  #align(center, image("images/3-right-yulan-8.png"))
])

这看起来很棒！我们写了两个`show`规则，每个规则都选择性地应用于第一级和第二级标题。我们使用`where`选择器按照它们的级别过滤标题。然后，我们将子部分标题呈现为*行内标题*（_run-ins_）。我们还自动在下级标题末尾添加一个句号。

让我们回顾一下会议的样式指南：

- 字体应该是`11pt`的衬线字体✓
- 标题应该是`17pt`并加粗✓
- 论文包含一个单列的摘要和双列的主要文本✓
- 摘要应居中✓
- 主要文本应对齐✓
- 第一级部分标题应居中，呈现为小写字母大写形式并为`13pt`✓
- 第二级标题是行内标题，斜体并与正文大小相同✓
- 最后，页面应为美国信纸大小，页码居中，每页的右上角应包含论文的标题✓

我们现在符合所有这些样式，可以将论文提交给会议！完成的论文如下所示：

#align(center, image("images/3-advanced-paper.png", width: 95%))

== 回顾 Review

你现在已经学会了如何创建页眉和页脚，如何使用函数和作用域来在局部覆盖样式，如何使用#link("https://typst.app/docs/reference/layout/grid/")[`grid`]函数创建更复杂的布局，以及如何为单个函数和整个文档编写`show`规则。你还学会了如何使用#link("https://typst.app/docs/reference/styling/#show-rules")[`where`选择器]根据它们的级别过滤标题。

这篇论文取得了巨大的成功！在会议上，你遇到了许多志同道合的研究人员，并正在计划一个项目，希望在明年的同一场所发表。但是，你需要使用相同的样式指南编写一篇新的论文，因此也许现在你想为你和你的团队创建一个节省时间的模板？

在下一节中，我们将学习如何创建可在多个文档中重复使用的模板。这是一个更高级的主题，所以如果你现在不想深入研究，可以随时回来。