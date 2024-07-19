#set text(font:("FiraCode Nerd Font Mono", "Source Han Sans SC"))
#set text(lang: "zh")
#show emph: text.with(font: ("Linux Libertine","STKaiti"))
#show link: text.with(fill: color.blue)

= 用Typst写作

让我们开始吧！假设你被分派写一篇大学的技术报告。它将包含一些段落、数学公式、标题和图表。为了处理这项工作，你在Typst应用程序上创建了一个新项目。创建完成后，你会被带到编辑器界面，在那里会看到两个面板：一个源面板，用来编写你的文档；一个预览面板，用来看到渲染后的文档。

#align(center, image("images/1-writing-app.png", width: 70%))

你已经对报告的角度有了一个很好的想法。那么让我们开始写引言。在编辑面板中输入一些文本。你会注意到文本立即出现在预览页面上。

#box(height: 70pt,
  columns(2, gutter: 11pt)[
  ```typst In this report, we will explore the various factors that influence fluid dynamics in glaciers and how they contribute to the formation and behaviour of these natural structures.```

  #align(center, image("images/1-right-yulan.png"))
])

#emph[在本教程中，我们将展示像这样的代码示例。就像在应用程序中一样，第一个面板包含标记，第二个面板显示预览。我们缩小了页面以适应示例，这样你就可以看到发生了什么。]

下一步是添加标题并强调一些文本。Typst 使用简单的标记来完成最常见的格式化任务。要添加标题，请输入 ``` =``` 字符；要用斜体强调一些文本，请将其置于 ``` _下划线_``` 之间。

#box(height: 70pt,
  columns(2, gutter: 11pt)[
  ```typst = Introduction
In this report, we will explore the various factors that influence _fluid dynamics_ in glaciers and how they contribute to the formation and behaviour of these natural structures.```

  #align(center, image("images/1-right-yulan-2.png"))
])

太简单了！要添加一个新的段落，就在两行文本之间添加一行空白。如果那个段落需要一个副标题，就输入 `==` 而不是 `=` 。等号的数量决定了标题的嵌套级别。

现在，我们要列出几个影响冰川动力学的情况。为此，我们使用编号列表。对于每个列表项，我们在行的开头输入一个 `+` 字符。Typst会自动为每个项编号。

#box(height: 70pt,
  columns(2, gutter: 11pt)[
  ```typst 

+ The climate
+ The topography
+ The geology```

  #align(center, image("images/1-right-yulan-3.png"))
])

如果我们想要添加带项符号的列表，我们会使用 `-` 符号而不是 `+` 符号。我们也可以嵌套列表：例如，我们可以通过缩进来为上面的列表的第一个项目添加一个子列表。

#box(height: 70pt,
  columns(2, gutter: 11pt)[
  ```typst + The climate
  - Temperature
  - Precipitation
+ The topography
+ The geology```

  #align(center, image("images/1-right-yulan-4.png"))
])

== 添加一张图片

如果你认为你的报告会因为一张图片更出色，让我们来添加一张吧。Typst支持PNG、JPEG、GIF和SVG格式的图片。要把你项目中的一个图片文件添加进来，首先点击左侧边栏中的盒子图标来打开文件面板。在这里，你可以看到你项目中的所有文件。目前只有一个：你正在写的主Typst文件。要上传另一个文件，点击右上角带有箭头的按钮。这会打开一个上传对话框，你可以从中选择电脑中的文件进行上传。为你的报告选择一张图片。

#align(center, image("images/1-writing-upload.png", width: 90%))

我们之前已经看到，特定的符号（称为标记）在Typst中有着特定的含义。我们可以使用 `=`，`-`，`+`，和 `_` 来创建标题、列表和强调文本。但是，如果我们想要将文档中的每一个想要插入的内容都使用一个特殊的符号，很快就会变得难以理解且不易操作。出于这个原因，Typst只保留标记符号来处理最常见的情况。其他所有内容都是通过函数插入的。为了使图片出现在页面上，我们使用Typst的 #link("https://typst.app/docs/reference/visualize/image/")[`image`] 函数。

#box(height: 150pt,
  columns(2, gutter: 11pt)[
  ```typst #image("glacier.jpg")```

  #align(center, image("images/1-right-yulan-5.png"))
])

一般来说，一个函数会为给定的_参数集_产生一些输出。当你在标记中使用函数时，你需要提供参数，Typst会将函数的_返回值_插入到文档中。在我们的情况下，`image`函数需要提供一个参数：图片文件的路径。在标记中使用函数时，我们首先需要输入`#`字符，紧接着输入函数的名称。然后，我们将参数用括号括起来。Typst可以识别参数列表中的许多不同类型的数据。我们的文件路径是一个#link("https://typst.app/docs/reference/foundations/str/")[短字符串]，因此我们需要将其用双引号括起来。

插入的图片使用了整个页面的宽度。要更改该宽度，可以将`width`参数传递给`image`函数。这是一个命名参数，因此应该以`name: value`对的形式指定。如果有多个参数，它们应该用逗号分隔，所以我们需要在路径后面先添加一个逗号。

#box(height: 70pt,
  columns(2, gutter: 11pt)[
  ```#image("glacier.jpg", width: 70%)```

  #align(center, image("images/1-right-yulan-6.png"))
])

