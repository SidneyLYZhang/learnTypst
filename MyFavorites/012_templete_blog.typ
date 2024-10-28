#import "@preview/cuti:0.2.1": show-cn-fakebold

#let szblog(
  title: none,
  authors: (),
  date: none,
  doc,
)={
  // 基础设定
  set document(title: title, author: authors.map(a => a.name))
  set text(font:("Cascadia Code", "Source Han Serif SC"))
  set text(lang: "zh", region: "cn")

  set page(
    margin: (left: 32mm, right: 32mm, top: 25mm, bottom: 25mm)
  )
  show math.equation: set text(weight: 400)
  show math.equation: set block(spacing: 0.65em)
  set math.equation(numbering: "(1)")

  show: show-cn-fakebold

  // 标题
  pad(bottom: 10pt, top: 4pt)[
    #align(center)[#text(size: 32pt, weight: "bold")[#title]]
  ]

  // 作者
  pad(bottom: 4pt, top: 4pt)[
    #align(center,..authors.map(author => [
        #set text(size: 12pt)
        #link(author.url)[#author.name] \
        #link("mailto:" + author.email)
      ]))
  ]

  // 日期
  pad(bottom: 4pt, top: 4pt)[
    #align(center)[
      #text(size: 11pt)[
        创建日期 #date \
        更新日期 #datetime.today().display()
      ]
    ]
  ]

  set text(size: 12pt)
  set par(leading: 1em, spacing: 1em, justify: true)

  set heading(numbering: "1.1")

  v(5em)

  doc
}