#set text(font:("Consolas", "Source Han Sans SC"))
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

== 添加图片

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

#box(height: 90pt,
  columns(2, gutter: 11pt)[
  ```typst #image("glacier.jpg", width: 70%)```

  #align(center, image("images/1-right-yulan-6.png"))
])

宽度参数( `width` )是一个 #link("https://typst.app/docs/reference/layout/relative/")[相对长度] 。在本例中，我们指定了一个百分比值，这意味着图像将占据页面宽度的 `70%` 。同样地，我们也可以指定绝对值，例如 `1cm` 或 `0.7in` 。

就像文本一样，图片默认是左对齐的。但它缺少一个标题。通过使用 #link("https://typst.app/docs/reference/model/figure/")[`figure`] 函数，我们可以解决这个问题。这个函数接受作为位置参数的图片内容和一个可选的标题作为命名参数。

在 `figure` 函数的参数列表中，Typst已经进入了代码模式。这意味着，现在你需要去掉图片函数调用前的井号。井号仅在标记中需要（用于区分文本与函数调用）。

标题可以包含任意的标记。要向函数提供标记，我们将其包围在方括号内。这种结构被称为 _内容块_ 。

#box(height: 100pt,
  columns(2, gutter: 11pt)[
  ```typst #figure(
  image("glacier.jpg", width: 70%),
  caption: [
    _Glaciers_ form an important part
    of the earth's climate system.
  ],
)```

  #align(center, image("images/1-right-yulan-7.png"))
])

你继续撰写报告，现在想要引用图表。要做到这一点，首先为图表添加标签。标签能唯一标识文档中的元素。在 #link("https://typst.app/docs/reference/model/figure/")[`figure`] 后面添加一个名字，用角度括号括起来即可。然后，在你的文本中，你可以通过写一个 `@` 符号后跟那个名字来引用图表。标题和方程式也可以被标记以使其可被引用。

#box(height: 170pt,
  columns(2, gutter: 11pt)[
  ```typst Glaciers as the one shown in
@glaciers will cease to exist if
we don't take action soon!

#figure(
  image("glacier.jpg", width: 70%),
  caption: [
    _Glaciers_ form an important part
    of the earth's climate system.
  ],
) <glaciers>```

  #align(center, image("images/1-right-yulan-8.png"))
])

#align(
  center,
  align(
    left,
    block(
      width: 90%,
      [
        *信息 INFO*  \
        \
        到目前为止，我们已经将内容块（方括号内的标记）和字符串（双引号内的文本）传递给我们的函数。两者似乎都包含文本。那么它们有什么区别呢？\
        内容块可以包含文本，但也可以包含任何其他类型的标记、函数调用等，而字符串实际上只是一系列字符，除此之外别无他物。\
        例如， `image` 函数期望一个指向图像文件的路径。它将无法通过传递一段文本或其他图像作为路径参数来获取图像。这就是为什么在这里只允许字符串的原因。相反，字符串在任何需要内容的地方都是有效的，因为文本是一种有效的内容类型。\
      ],
      fill: aqua,
      stroke : color.blue,
      radius: 8pt, 
      inset: 18pt
    )
  )
)

== 添加参考文献

在撰写报告时，你需要支持你的论点。您可以使用 #link("https://typst.app/docs/reference/model/bibliography/")[`bibliography`] 函数向文档添加参考文献。此函数期望一个指向参考文献文件的路径。

Typst原生的参考文献格式是 #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[`Hayagriva`] ，但是为了兼容性，您也可以使用 BibLaTeX 文件。由于您的同学已经进行了文献调研并向您发送了一个 `.bib` 文件，因此您将使用该文件。通过文件面板上传文件以在Typst中访问它。

一旦文档中包含参考文献，您就可以开始引用它。引用的语法与参考标签相同。一旦您第一次引用某个来源，它就会出现在文档的参考文献部分。Typst支持不同的引用和参考文献样式。有关更多详细信息，请参阅 #link("https://typst.app/docs/reference/model/bibliography/#parameters-style")[参考文献] 。

#box(height: 80pt,
  columns(2, gutter: 11pt)[
  ```typst = Methods
We follow the glacier melting models
established in @glacier-melt.

#bibliography("works.bib")```

  #align(center, image("images/1-right-yulan-9.png"))
])

== 数学

在详细阐述了方法部分之后，论文的核心部分便展现在读者眼前：你的方程式。Typst 旨在实现数学排版功能，并采用自身独特的数学符号体系。我们从一个简单的方程式开始。为了指示 Typst 准备接收数学表达式，我们用 `$` 符号将其包围起来：

#box(height: 45pt,
  columns(2, gutter: 11pt)[
  ```typst 

The equation $Q = rho A v + C$
defines the glacial flow rate.```

  #align(center, image("images/1-right-yulan-10.png"))
])

这个方程式是内嵌式排版的，与周围的文本在同一行中显示。如果您希望将其单独显示在新的一行，则需要在方程式前后各输入一个空格：

#box(height: 60pt,
  columns(2, gutter: 11pt)[
  ```typst 
The flow rate of a glacier is
defined by the following equation:

$ Q = rho A v + C $```

  #align(center, image("images/1-right-yulan-11.png"))
])

我们可以发现，Typst 对单个字母 `Q`、`A`、`v` 和 `C` 原样显示，而将 `rho` 转译为了希腊字母。数学模式会始终原样显示单个字母。然而，多个字母会被解释为符号、变量或函数名。若要表示单个字母之间的乘法，只需在它们之间加入空格。

如果你想要表示由多个字母组成的变量，可以将它们用引号括起来：

#box(height: 60pt,
  columns(2, gutter: 11pt)[
  ```typst 
The flow rate of a glacier is given
by the following equation:

$ Q = rho A v + "time offset" $```

  #align(center, image("images/1-right-yulan-12.png"))
])

