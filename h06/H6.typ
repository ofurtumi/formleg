#import "@templates/ass:0.1.1": *
#import "@preview/finite:0.3.0"
#import "@preview/cetz:0.1.1"
#import cetz.draw: set-style
#import finite.draw: state, transition, loop


#show: doc => template(
  project: "Homework 6",
  class: "TÖL301G",
  doc
)

#set heading(numbering: "1.a)")
#set enum(numbering: "i.")

= Four languages
Let $Sigma = {x,y}$
== ${x y x | n > 0}$
Since neither $x$ or $y$ rely on $n$ we can draw a very simple *DFA*, therefore the language is regular:
#align(center,
  cetz.canvas({ 
    state((0,0), "q0", initial: true)
    state((2,0), "q1")
    state((4,0), "q2")
    state((6,0), "q3", final: true)

    transition("q0", "q1", label: "x", curve: 0)
    transition("q1", "q2", label: "y", curve: 0)
    transition("q2", "q3", label: "x", curve: 0)
  })
)

== ${x^n y x^n | n>=0}$
This language requires knowledge about the first $x$ group to guarantee the later $x$ group is the same size, let's make a simple *CFG* for this non-regular language:

$ S -> x S x | y $

== ${x y^n x | n>=0}$
This language is very clearly regular and we can use a sligthly modified *DFA* from *a)* to show this:
#align(center,
  cetz.canvas({ 
    state((0,0), "q0", initial: true)
    state((3,0), "q1")
    state((6,0), "q2", final: true)

    transition("q0", "q1", label: "x", curve: 0)
    transition("q1", "q1", label: "y",)
    transition("q1", "q2", label: "x", curve: 0)
  })
)

== ${(x y x)^n | n>=0}$
This language is regular and we can use a *DFA* to show this:
#align(center,
  cetz.canvas({
    state((0,0), "q0", initial: true, final: true)
    state((3,0), "q1")
    state((6,0), "q2")

    transition("q0", "q1", label: "x", curve: 0)
    transition("q1", "q2", label: "y", curve: 0)
    transition("q2", "q0", label: (text: "x", dist: -0.33), curve: -1)
  })
)

#pagebreak()
= Stacks on stacks

For ease of both reading and writing i'll be using $lambda$ to represent both $a$ and $b$, since i won't ever be using them both in the same transition. The transitions will always be some version $a, (epsilon, epsilon) -> (a, epsilon)$ and never $a, (epsilon, epsilon) -> (b, epsilon)$

#align(center,
  cetz.canvas({
    state((0,0), "q0", initial: true)
    state((0,5), "q1")
    state((5,5), "q2")
    state((10,5), "q3")
    state((10,0), "q4")

    transition(
      "q0", "q1",
      curve: 0,
      label: (
        text: $epsilon, (epsilon, epsilon) -> (\$,epsilon)$,
        dist: -0.3,
        angle: 270deg
      )
    )
    loop(
      "q1",
      label: (
        text: $lambda, (epsilon, epsilon) -> (lambda, epsilon)$,
      )
    )
    transition(
      "q1", "q2",
      curve: 0,
      label: (
        text: $epsilon, (epsilon, epsilon) -> (epsilon, \$)$,
        dist: -0.3
      )
    )
    loop(
      "q2",
      label: (
        text: $epsilon, (lambda, epsilon) -> (epsilon, lambda)$,
      )
    )
    transition(
      "q2", "q3",
      curve: 0,
      label: (
        text: $epsilon, (\$, epsilon) -> (epsilon, epsilon)$,
        dist: -0.3
      )
    )
    loop(
      "q3",
      label: (
        text: $epsilon, (epsilon, lambda) -> (epsilon, epsilon)$,
      )
    )
    transition(
      "q3", "q4",
      curve: 0,
      label: (
        text: $epsilon, (epsilon, \$) -> (epsilon, epsilon)$,
        dist: -0.3,
        angle: 90deg
      )
    )
  })
)

The transition $q_1->q_2$ is a _magic_ transition that happens when we have finished the first half of tokens

= Checksum continuation

Suppose that *A* is a *CFL*, then there exists a number $p$ where, if $S$ is any string in *A* of length $p$, then $S$ may be divided into five pieces $S = u v x y z$ satisfying the following rules: 

+ $u v^i x y^i z in A$ for each $i >= 0$
+ $|v y| > 0$
+ $|v x y| <= p$

== pump it up (or down)
- We let $p$ denote the pumping length 
- We let $S = 0^p 1^i 1^(p-2i) 1^i 2^p 00$

According to pumping lemma $S$ splits into $u v x y z$ so that i-iii. hold 

$ u:0^p, v:1^i, x:1^(p-2i), y:1^i, z:2^p 00 $

+ We offset the number of $x$'s by the number of both $v$'s and $y$'s so our string holds for each $i >= 0$
+ $| v y |$ is $2 > 0$
+ We make $|v x y| = i + (p-2i) + i = p$ 

Now we pump down and set $i = 0$ then $S' = 0^p 1^(p-2) 2^p 00 in.not A$ and since the checksum should now be $10$ the language $A$ is not context free
