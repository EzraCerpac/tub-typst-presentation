// TU Berlin Presentation Theme for Touying
// Unofficial template based on TU Berlin Corporate Design Manual
// License: MIT

#import "@preview/touying:0.6.1": *

// --- TU Berlin Color Constants ---

#let tub-red = rgb("#c50e1f")
#let tub-gray = rgb("#717171")
#let tub-black = rgb("#000000")
#let tub-white = rgb("#ffffff")
#let tub-light-gray = rgb("#f5f5f5")

// --- Content Helpers ---

#let alert-box(content) = {
  block(
    width: 100%,
    fill: rgb("#ffe6e6"),
    stroke: (left: 3pt + tub-red),
    inset: 0.5cm,
    content,
  )
}

#let highlight-box(content) = {
  block(
    width: 100%,
    fill: tub-light-gray,
    stroke: (left: 3pt + tub-red),
    inset: 0.5cm,
    {
      set text(weight: "bold", fill: tub-red)
      content
    },
  )
}

#let emphasis(body) = {
  text(fill: tub-red, weight: "bold", body)
}

// --- Slide Functions ---

#let slide(
  title: auto,
  header: auto,
  footer: auto,
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  if header != auto {
    self.store.header = header
  }
  if footer != auto {
    self.store.footer = footer
  }
  let new-setting = body => {
    show: setting
    body
  }
  touying-slide(
    self: self,
    config: config,
    repeat: repeat,
    setting: new-setting,
    composer: composer,
    ..bodies,
  )
})

#let title-slide(config: (:), ..args) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none),
  )
  let info = self.info + args.named()
  let body = {
    set align(center + horizon)

    if info.logo != none {
      set image(height: 1.5cm)
      info.logo
      v(0.8cm)
    }

    text(
      size: 1.6em,
      weight: "bold",
      fill: self.colors.primary,
      info.title,
    )

    if info.subtitle != none {
      v(0.3cm)
      text(size: 1.1em, fill: self.colors.neutral-dark, info.subtitle)
    }

    v(1.2cm)

    if info.author != none {
      text(size: 0.8em, fill: self.colors.neutral-darkest, info.author)
    }

    if self.store.department != none {
      v(0.2cm)
      text(size: 0.7em, fill: self.colors.neutral-dark, self.store.department)
    }

    if info.date != none {
      v(0.4cm)
      text(size: 0.65em, fill: self.colors.neutral-dark, utils.display-info-date(self))
    }
  }
  touying-slide(self: self, config: config, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(header: none, footer: none),
  )
  let main-body = {
    set align(center + horizon)
    block(
      width: 100%,
      inset: 2em,
      {
        text(
          size: 1.8em,
          weight: "bold",
          fill: self.colors.primary,
          utils.display-current-heading(level: 1),
        )
      },
    )
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(config: (:), body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-common(freeze-slide-counter: true),
    config-page(
      fill: self.colors.primary,
      margin: 2em,
      header: none,
      footer: none,
    ),
  )
  set text(fill: self.colors.neutral-lightest, weight: "bold", size: 1.5em)
  touying-slide(self: self, config: config, align(horizon + center, body))
})

// --- Main Theme Function ---

#let tub-theme(
  aspect-ratio: "16-9",
  department: none,
  logo: none,
  footer-a: self => self.info.author,
  footer-b: self => if self.info.short-title == auto {
    self.info.title
  } else {
    self.info.short-title
  },
  footer-c: self => {
    utils.display-info-date(self)
    h(1fr)
    context utils.slide-counter.display() + " / " + utils.last-slide-number
  },
  ..args,
  body,
) = {
  let _header(self) = {
    set align(top)
    block(
      width: 100%,
      inset: (x: 0.8em, y: 0.6em),
      fill: tub-light-gray,
      grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        {
          if self.store.title != none {
            text(
              size: 1.1em,
              weight: "bold",
              fill: self.colors.primary,
              utils.call-or-display(self, self.store.title),
            )
          } else {
            text(
              size: 1.1em,
              weight: "bold",
              fill: self.colors.primary,
              utils.display-current-heading(level: 2),
            )
          }
        },
        {
          if self.store.logo != none {
            set image(height: 0.8cm)
            self.store.logo
          }
        },
      ),
    )
  }

  let _footer(self) = {
    set align(bottom)
    set text(size: 0.5em, fill: self.colors.neutral-lightest)
    grid(
      columns: (1fr, 1fr, 1fr),
      rows: 1.5em,
      rect(
        width: 100%, height: 100%, fill: self.colors.neutral-darkest,
        inset: (x: 0.8em), stroke: none,
        align(horizon, utils.call-or-display(self, self.store.footer-a)),
      ),
      rect(
        width: 100%, height: 100%, fill: self.colors.primary,
        inset: (x: 0.8em), stroke: none,
        align(horizon, utils.call-or-display(self, self.store.footer-b)),
      ),
      rect(
        width: 100%, height: 100%, fill: self.colors.neutral-darkest,
        inset: (x: 0.8em), stroke: none,
        align(horizon, utils.call-or-display(self, self.store.footer-c)),
      ),
    )
  }

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      header: _header,
      footer: _footer,
      header-ascent: 0em,
      footer-descent: 0em,
      margin: (top: 3.5em, bottom: 2em, x: 1.5em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-methods(
      init: (self: none, body) => {
        set text(
          font: ("Arial", "Helvetica Neue", "Helvetica"),
          size: 20pt,
          fill: self.colors.neutral-darkest,
        )
        set list(marker: ("•", "◦", "▪"))
        show heading: set text(fill: self.colors.primary)
        body
      },
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: tub-red,
      primary-dark: rgb("#9a0b18"),
      secondary: tub-gray,
      tertiary: tub-light-gray,
      neutral-lightest: tub-white,
      neutral-light: tub-light-gray,
      neutral-dark: tub-gray,
      neutral-darkest: tub-black,
    ),
    config-store(
      title: none,
      department: department,
      logo: logo,
      footer-a: footer-a,
      footer-b: footer-b,
      footer-c: footer-c,
    ),
    ..args,
  )

  body
}
