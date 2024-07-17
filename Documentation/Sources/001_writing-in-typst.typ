#set text(font:"Source Han Sans SC")
#set text(lang: "zh")

= 用Typst写作

让我们开始吧！假设你被分派写一篇大学的技术报告。它将包含一些段落、数学公式、标题和图表。为了处理这项工作，你在Typst应用程序上创建了一个新项目。创建完成后，你会被带到编辑器界面，在那里会看到两个面板：一个源面板，用来编写你的文档；一个预览面板，用来看到渲染后的文档。

#align(center, image("images/1-writing-app.png", width: 70%))

你已经对报告的角度有了一个很好的想法。那么让我们开始写引言。在编辑面板中输入一些文本。你会注意到文本立即出现在预览页面上。

#box(height: 70pt,
  columns(2, gutter: 11pt)[
  In this report, we will explore the various factors that influence fluid dynamics in glaciers and how they contribute to the formation and behaviour of these natural structures.
  #image("images/1-right-yulan.png")
])

