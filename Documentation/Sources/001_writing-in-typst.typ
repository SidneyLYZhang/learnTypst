#set text(font:("FiraCode Nerd Font Mono", "Source Han Sans SC"))
#set text(lang: "zh")
#show emph: text.with(font: ("Linux Libertine","STKaiti"))

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

