#set text(font:("Consolas", "Source Han Sans SC"))
#set text(lang: "zh")
#show emph: text.with(font: ("Linux Libertine","STKaiti"))
#show link: text.with(fill: color.blue)

= 把文档格式化处理

到目前为止，你已经写了一份包含一些文字、几个方程式和图片的报告。然而，它看起来仍然非常朴素。你的助教还不知道你正在使用一个新的排版系统，而你希望你的报告能够与其他学生的提交作业相匹配。在本章中，我们将学习如何使用Typst的样式系统来格式化你的报告。

== 设定规则

正如我们在上一章中所看到的，Typst有一些函数用于_插入_内容（例如 #link("https://typst.app/docs/reference/visualize/image/")[`image`] 函数），还有一些函数用于_操作_接收到的内容参数（例如 #link("https://typst.app/docs/reference/layout/align/")[`align`] 函数）。当你想要，比如说，使报告两端对齐时，你的第一反应可能是寻找一个能够实现这一功能的函数，并用它包裹整个文档。

#box(height: 150pt,
  columns(2, gutter: 11pt)[
  ```typst #par(justify: true)[
  = Background
  In the case of glaciers, fluid
  dynamics principles can be used
  to understand how the movement
  and behaviour of the ice is
  influenced by factors such as
  temperature, pressure, and the
  presence of other fluids (such as
  water).
]```

  #align(center, image("images/2-right-yulan-1.png"))
])

等等，函数的所有参数不是应该都在圆括号内指定吗？为什么在圆括号之后还有一组方括号包含内容？答案是，由于在Typst中向函数传递内容是如此常见的操作，因此有一种特殊的语法：不必将内容放在参数列表内，你可以直接在常规参数后的方括号中写入内容，这样可以节省标点符号。

如上所示，这种方法确实有效。#link("https://typst.app/docs/reference/model/par/")[`par`] 函数使其中的所有段落两端对齐。然而，用无数函数包裹文档并选择性地在原地应用样式很快就会变得繁琐。

幸运的是，Typst有一个更优雅的解决方案。通过 _设置规则_ ，你可以将样式属性应用于所有出现的内容上。要写一个设置规则，你需要输入 `set` 关键字，后跟你想要设置属性的函数名，然后在圆括号中列出参数。

#box(height: 150pt,
  columns(2, gutter: 11pt)[
  ```typst #set par(justify: true)

= Background
In the case of glaciers, fluid
dynamics principles can be used
to understand how the movement
and behaviour of the ice is
influenced by factors such as
temperature, pressure, and the
presence of other fluids (such as
water).```

  #align(center, image("images/2-right-yulan-1.png"))
])

#align(
  center,
  align(
    left,
    block(
      width: 90%,
      [
        *信息 INFO*  

        想要用更专业的术语了解这里发生了什么吗？\
        \
        设置规则可以被理解为对某个函数的部分参数设定默认值，
        这些默认值将应用于该函数的所有后续使用中。
      ],
      fill: aqua,
      stroke : color.blue,
      radius: 8pt, 
      inset: 18pt
    )
  )
)

