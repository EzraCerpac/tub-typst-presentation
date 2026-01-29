# TU Berlin Typst Presentation Template

## Overview

An **unofficial** Typst presentation template following TU Berlin's corporate design, built on [Touying](https://touying-typ.github.io/) 0.6.1 — a modern presentation framework for Typst with support for animations, multi-column layouts, and structured slide types.

### Features

- Official TU Berlin colors (Red `#c50e1f`, Gray `#717171`)
- Slide types: title, content, section, focus
- Two-column and multi-column layouts via `composer`
- Slide animations with `#pause` and `#meanwhile`
- Header with slide title and logo, 3-column footer with author/title/date+page
- Content helpers: `alert-box`, `highlight-box`, `emphasis`

## Quick Start

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/tub-presentation:0.2.0": *

#show: tub-theme.with(
  aspect-ratio: "16-9",
  department: [Department of Computer Science],
  logo: image("assets/logos/tub_logo.png"),
  config-info(
    title: [My Presentation Title],
    subtitle: [Optional Subtitle],
    author: [Author Name],
    date: datetime.today(),
    institution: [Technische Universität Berlin],
  ),
)

#title-slide()

= Section Heading        // auto-generates a section slide

== Slide Title            // auto-generates a content slide
- First point
- Second point

#pause                    // animation: reveals next content on click

- Third point (appears after pause)

#focus-slide[Questions?]  // full-screen red slide
```

## Installation

### Option 1: Typst Universe

```typst
#import "@preview/touying:0.6.1": *
#import "@preview/tub-presentation:0.2.0": *
```

### Option 2: Local Development

```bash
git clone https://github.com/yourusername/tub-typst-presentation
cd tub-typst-presentation
typst watch main.typ
```

## Slide Types

### Title Slide

```typst
#title-slide()
```

Centered layout with logo, title, subtitle, author, department, and date. No header/footer. Metadata is pulled from `config-info(...)`.

### Content Slide (default)

Content slides are created automatically from `== Heading` markup, or explicitly:

```typst
#slide[
  Content goes here.
]
```

Each content slide has a header bar (title + logo) and a 3-column footer.

### Section Slide

Auto-generated when using `= Heading` (level-1 heading). Displays the section name centered in TU Berlin red. No header/footer.

### Focus Slide

```typst
#focus-slide[Questions?]
```

Full-screen red background with large white text. Use for key takeaways or closing slides.

## Multi-Column Layout

Use the `composer` parameter to create column layouts:

```typst
#slide(composer: (1fr, 1fr))[
  Left column content
][
  Right column content
]
```

For unequal columns:

```typst
#slide(composer: (2fr, 1fr))[
  Wider left column
][
  Narrower right column
]
```

## Animations

Touying supports sub-slide animations:

```typst
== Animated Slide
First point is always visible.

#pause

This appears on the second sub-slide.

#pause

This appears on the third sub-slide.
```

Use `#meanwhile` to show content on all sub-slides simultaneously in a different area.

## Content Helpers

### Alert Box

```typst
#alert-box[Important information with red left border.]
```

### Highlight Box

```typst
#highlight-box[Key takeaway in bold red text with gray background.]
```

### Emphasis

```typst
#emphasis[Bold red inline text.]
```

## Customization

### Theme Parameters

```typst
#show: tub-theme.with(
  aspect-ratio: "16-9",       // or "4-3"
  department: [Your Dept],
  logo: image("your-logo.png"),
  footer-a: self => self.info.author,    // left footer
  footer-b: self => self.info.title,     // center footer
  footer-c: self => {                     // right footer
    utils.display-info-date(self)
    h(1fr)
    context utils.slide-counter.display() + " / " + utils.last-slide-number
  },
  config-info(
    title: [...],
    subtitle: [...],
    author: [...],
    date: datetime.today(),
    institution: [...],
  ),
)
```

### Color Override

```typst
#show: tub-theme.with(
  config-colors(
    primary: rgb("#00FF00"),       // override accent color
    neutral-darkest: rgb("#222"),  // override text color
  ),
  config-info(title: [My Talk]),
)
```

### Available Colors

| Color | Hex | Usage |
|-------|-----|-------|
| TU Berlin Red | `#c50e1f` | Primary accent, headings |
| Gray | `#717171` | Secondary text, subtitles |
| Black | `#000000` | Body text |
| White | `#ffffff` | Backgrounds, focus slide text |
| Light Gray | `#f5f5f5` | Header background, highlight boxes |

## File Structure

```
tub-presentation/
├── lib.typ              # Theme library (Touying-based)
├── main.typ             # Example presentation
├── typst.toml           # Package metadata
├── assets/
│   └── logos/
│       └── tub_logo.png # TU Berlin logo
├── README.md
└── DISCLAIMER.md
```

## Disclaimer

This is an **unofficial** template created by the community. It is not endorsed by or affiliated with TU Berlin. Verify compliance with your department's requirements before using for official presentations.

For official guidelines, contact:
- TU Berlin Communication & Public Relations
- [tu.berlin/en/communication](https://www.tu.berlin/en/communication)

## License

MIT License
