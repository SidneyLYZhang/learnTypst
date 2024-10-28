#import "@preview/pointless-size:0.1.0": zh
#import "@preview/numbly:0.1.0": numbly
#import "@preview/cuti:0.2.1": show-cn-fakebold

#let weekreport(
  department: none,
  employee:none,
  doc,
)={
  set page(
    margin: (left: 31.7mm, right: 31.7mm, top: 25.4mm, bottom: 25.4mm)
  )
  show: show-cn-fakebold
  // Title
  pad(
    bottom: 4pt,
    top: 4pt,
    align(center)[
      #block(text(font: "SimSun", weight: "bold", size: zh("-0"),"工作周报"))
    ]
  )

  pad(
    bottom: 0pt,
    top: 0pt
  )[
    #set par(leading: 0.02em, spacing: 0.3em)
    #line(length: 100%, stroke: 4pt + rgb("#5B9BD5"))
    #line(length: 100%, stroke: 0.5pt + rgb("#5B9BD5"))
  ]
  pad(
    bottom: 0pt,
    top: 0pt,
  )[
    #let td = datetime.today()
    #set par(leading: 0.5em, spacing: 0.5em)
    #block(text(font: "SimSun", weight: "bold", size: zh(5),"汇报部门："+department))
    #block(text(font: "SimSun", weight: "bold", size: zh(5),"汇报人："+employee))
    #text(font: "SimSun", weight: "bold", size: zh(5),"汇报日期："+td.display("[year]年[month]月[day]日")+" 第"+td.display("[week_number]")+"周")
  ]
  pad(
    bottom: 0pt,
    top: 0pt
  )[
    #set par(leading: 0.02em, spacing: 0.3em)
    #line(length: 100%, stroke: 0.5pt + rgb("#5B9BD5"))
    #line(length: 100%, stroke: 4pt + rgb("#5B9BD5"))
  ]

  set par(justify: true, leading: 1.5em, spacing: 1.5em)
  set text(font:"SimSun", size: zh(4))

  set heading(numbering: numbly("{1:一}、","{2:1}."))
  show heading: it => [
    #set align(left)
    #set text(size:zh(4), weight: "bold")
    #block(it)
]
  doc
}

#let wr_part(name)={
  pad(
    bottom: 4pt,
    top: 4pt,
    align(left)[
      #block(text(font: "SimHei", weight: "bold", size: zh(3),"【"+name+"】"))
    ]
  )
}

#let wr_work(
  name:none,
  content
)={
  pad(
    bottom: 4pt,
    top: 4pt,
    align(left)[
      #text(size: zh(4))[*#name：*#content]
    ]
  )
}

#show: weekreport.with(
  department: "数据部",
  employee: "张良益"
)

#wr_part()[摘要]

1.#lorem(20) \
2.#lorem(20) \
3.#lorem(20)

\

#wr_part()[本周亮点及重点工作]

= 第一部分

== 工作内容第一项

#wr_work(name: "本周进度")[#lorem(45)]
#wr_work(name: "下周计划")[#lorem(10)]

== 工作内容第二项

#wr_work(name: "本周进度")[#lorem(45)]
#wr_work(name: "下周计划")[#lorem(10)]

\

= 第二部分

== 工作内容第3项

#wr_work(name: "本周进度")[#lorem(45)]
#wr_work(name: "下周计划")[#lorem(10)]