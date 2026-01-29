#import "@preview/touying:0.6.1": *
#import "lib.typ": *

#show: tub-theme.with(
  aspect-ratio: "16-9",
  department: [Faculty of Electrical Engineering and Computer Science],
  logo: image("assets/logos/tu_berlin.svg"),
  progress-bar: true,
  config-info(
    title: [Research Methods in Computer Science],
    subtitle: [An Introduction to Academic Presentations],
    author: [Dr. Example Author],
    date: datetime.today(),
    institution: [Technische Universität Berlin],
  ),
)

#title-slide()

#outline-slide()

= Introduction

== Motivation

- Academic presentations communicate research findings effectively
- A consistent visual identity strengthens institutional recognition
- This template follows the TU Berlin corporate design guidelines
#pause
- Built on *Touying*, a modern presentation framework for Typst
- Supports animations, multi-column layouts, and structured slides

== Agenda

+ Introduction and motivation
+ Research methodology
+ Results and discussion
+ Conclusion and future work

= Methodology

== Research Approach

We employ a mixed-methods approach combining:

+ *Quantitative analysis* --- statistical evaluation of experimental data
+ *Qualitative review* --- expert assessment of design patterns
+ *Comparative study* --- benchmarking against existing solutions

#pause

The methodology follows established best practices in the field.

#speaker-note[Mention that the methodology was peer-reviewed by two independent experts.]

== Comparison of Approaches

#slide(composer: (1fr, 1fr))[
  === Traditional Methods
  - Manual data collection
  - Limited scalability
  - High cost per sample
  - Established validity
][
  === Modern Methods
  - Automated pipelines
  - Horizontally scalable
  - Reduced marginal cost
  - Requires validation
]

= Results

== Key Findings

#alert-box[
  *Main Result:* The proposed approach achieves a 35% improvement over the baseline while maintaining statistical significance ($p < 0.01$).
]

#v(0.5cm)

Supporting observations:
- Consistent performance across all test conditions
- Robust to variations in input parameters
- Generalizes well to unseen data distributions

== Detailed Analysis

#highlight-box[
  The combination of automated data collection and rigorous statistical testing enables reproducible research at scale.
]

#v(0.5cm)

The analysis reveals three key factors:
+ *Data quality* has the strongest effect on outcomes
+ *Sample size* matters beyond $n = 100$
+ *Method selection* has diminishing returns after optimization

== Mathematical Framework

The optimization objective#slide-cite[Boyd & Vandenberghe, _Convex Optimization_, Cambridge University Press, 2004.] is defined as:

$
  min_(theta) cal(L)(theta) = 1/N sum_(i=1)^N ell(f_theta (x_i), y_i) + lambda norm(theta)_2^2
$

where:
- $f_theta$ is the parameterized model
- $ell$ is the loss function
- $lambda$ controls regularization strength

== Formal Definitions

#tub-theorem[
  For any convex function $f: RR^n -> RR$, a local minimum is also a global minimum.
]

#v(0.4cm)

#tub-definition[
  A function $f$ is *convex* if for all $x, y in "dom" f$ and $0 <= theta <= 1$: $ f(theta x + (1 - theta) y) <= theta f(x) + (1 - theta) f(y) $
]

#v(0.4cm)

#tub-example[
  The function $f(x) = x^2$ is convex on $RR$, since $f''(x) = 2 > 0$ everywhere.
]

== Perspectives

#quote-block(attribution: [Albert Einstein])[
  If we knew what it was we were doing, it would not be called research, would it?
]

#v(0.5cm)

#quote-block(attribution: [Donald Knuth])[
  Premature optimization is the root of all evil.
]

= Conclusion

== Summary

#slide(composer: (1fr, 1fr))[
  === Contributions
  - Novel methodology for data analysis
  - Open-source implementation
  - Reproducible experimental setup
  - Comprehensive evaluation
][
  === Future Work
  - Extension to larger datasets
  - Cross-domain validation
  - Real-time processing pipeline
  - Community benchmarking
]

#ending-slide(title: [Thank You!])[
  #text(size: 0.9em)[Dr. Example Author]

  #v(0.3cm)

  #text(size: 0.75em, fill: tub-gray)[
    Faculty of Electrical Engineering and Computer Science \
    Technische Universität Berlin \
    #link("mailto:author@tu-berlin.de")[author\@tu-berlin.de]
  ]

  #v(0.5cm)

  #text(size: 0.7em)[_Questions?_]
]
