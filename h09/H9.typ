#import "@templates/ass:0.1.1": *

#show: doc => template(
  class: "TÖL301G",
  project: "Homework 9",
  doc
)

#set heading(numbering: "1.a.")
#let colred(x) = text(fill: red, $#x$)

= Even Odd TM

Define a Turing machine that performs the following function: 
$ 
  f(x) = cases(
    "odd": x + 1,
    "even": x "/" 2
  )
$

#grid(columns: 2, [
+ Scan the string to the right until we reach the last bit
+ If the last bit is 1 the number is odd
  + Flip character and move left
  + If bit under pointer is 1 goto state _2.1_
  + If bit under pointer is 0 flip bit
+ If the last bit is 0 the number is even
  + Replace the last bit with empty space
+ Move to start of string, halt

We can construct this simple turing machine that does this calculation for us
],
grid(columns: 2, gutter: 8pt, [
  ```
  Init:   q0
  Accept: qf

  q0,0
  q0,0,>
  q0,1
  q0,1,>
  q0,_
  qcomp,_,<

  qcomp,0
  qstart,_,<
  qcomp,1
  qodd,0,<
  ```],[
  ```

  qodd,1
  qodd,0,<
  qodd,0
  qstart,1,<
  qodd,_
  qf,1,-

  qstart,0
  qstart,0,<
  qstart,1
  qstart,1,<
  qstart,_
  qf,_,-
  ```]
  )
)

= Mr. Koch

== The loop
We know that both $w_1: R^3$ and $w_2: (R l R l)^3$ lead home and are therefore accepted.
Since $w_2$ is just $w_1$ after we apply the first replacement rule, we can assume the first replacement rule holds.
If we look deeper into the replacement we see that by changing $R$ into $R l R l$ we keep our direction but make the route longer. 
This can be seen because $R$ and $l$ are opposites and therefore cancel each other out.

The second replacement rule works the same way in reverse, we can assume it holds because $w_3$ is just $w_2$ after we apply the second replacement rule.

== Turing machine

Since all accepted strings are made from $R^3$ having the replacement rules applied to it. To decide if a string is acceptable we can reverse these rules until we either have $R^3$ or we reject. Let's show this on the string $w_3$:

$
  ( R l l R l R l l R l l l R l R l l R l R l l R l )^3\
  ( R colred( l l R l ) R colred( l l R l ) colred( l l R l ) R colred( l l R l ) R colred( l l R l ) )^3\
  ( R l R l l R l R l l)^3\
  (colred( R l R l )l colred( R l R l )l)^3\
  (R l R l)^3\
  (colred( R l R l ))^3\
  (R)^3
$ 

= $"EQ"_"CFG"$
Let's define a new CFG $G' = (V, Sigma, R, S)$ where $S$ is the starting variable and every token $sigma in Sigma$ has a transition rule $sigma -> sigma S$.
If $Sigma$ includes ${x,y}$ then $S -> x S, S -> y S, S -> epsilon$, therfore $L(G') = Sigma *$

Now we define $R$ as a turing machine that decides $"EQ"_"CFG"$ and construct another turing machine $S$ that decides $"ALL"_"CFG"$

$S$ follows the rules:

"On input $G$ where $G$ is a CFG:
+ Construct a CFG $angle.l G', angle.r$ as described above
+ Run $R$ on $G'$, if $R$ accepts then accept, otherwise reject"

In step 1. since $G' = Sigma *$ then $R$ needs to decide if $G = Sigma *$ which is $"ALL"_"CFG"$ and since we know $"ALL"_"CFG"$ is undecidable then $S$ is undecidable.
