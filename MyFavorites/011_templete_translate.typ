#let translate(
  title: none,
  authors: (),
  translators: (),
  oriurl: none,
  abstract: [],
  date: none,
  updateData: none,
  doc,
) = {
  // 基础设定
  set text(font:("Consolas", "Source Han Serif SC"))
  set text(lang: "zh")

  set page(
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 30mm),
    numbering: "1",
    number-align: center,
  )

  show math.equation: set text(weight: 400)
  show math.equation: set block(spacing: 0.65em)
  set math.equation(numbering: "(1)")

  show emph: text.with(font: ("Linux Libertine","LXGW Heart Serif"))
  show link: text.with(fill: blue)

  set heading(numbering: "1.1")
  show heading: it => {
    // H1 and H2
    if it.level == 1 {
      pad(
        bottom: 10pt,
        it
      )
    }
    else if it.level == 2 {
      pad(
        bottom: 8pt,
        it
      )
    }
    else if it.level > 3 {
      text(11pt, weight: "bold", it.body + " ")
    } else {
      it
    }
  }

  // Title
  pad(
    bottom: 4pt,
    top: 4pt,
    align(center)[
      #block(text(weight: 500, 2.75em, title))
    ]
  )

  let count = authors.len()
  let ncols = calc.min(count, 3)

  //原作者
  if (translators != none) {
    pad(
      align(center)[#text(13pt)[*原作者*]]
    )
  }
  grid(
      align: center,
      columns: (1fr,) * ncols,
      row-gutter: 24pt,
      ..authors.map(author => [
        #author.name \
        #author.affiliation \
        #link("mailto:" + author.email)
      ]),
  )

  // 译者
  if (translators != none) {
    let tcount = translators.len()
    let tncols = calc.min(tcount, 3)
    pad(
      align(center)[#text(13pt)[*译者*]]
    )
    grid(
        align: center,
        columns: (1fr,) * tncols,
        row-gutter: 24pt,
        ..translators.map(author => [
          #author.name \
          #author.affiliation \
          #link("mailto:" + author.email)
        ]),
    )
  }

  if (oriurl != none) {
    pad(
      bottom: 2pt,
      top: 2pt,
    )[
      #align(center)[原文来源： #oriurl]
    ]
  }

  // 时间
  if (updateData == none) {
    pad(
      bottom: 6pt,
      top: 6pt)[
        #align(center)[#date]
    ]
  } else {
    pad(
      bottom: 6pt,
      top: 6pt)[
        #align(center)[
        原文发布时间： #date \
        翻译时间： #updateData
      ]
    ]
  }

  // 摘要
  pad(
    x: 3em,
    top: 1em,
    bottom: 0.4em,
    align(center)[
      #heading(
        outlined: false,
        numbering: none,
        text(0.85em, smallcaps[摘要/Abstract]),
      )
      #set par(justify: true)
      #set text(hyphenate: false)

      #abstract
    ],
  )

  set align(left)
  set par(justify: true)
  set text(hyphenate: false)

  doc
}