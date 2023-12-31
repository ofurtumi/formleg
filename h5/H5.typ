#import "@templates/ass:0.1.1": *

#show: doc => template(
  project: "Homework 5",
  class: "Töl301G",
  doc
)

#set heading(numbering: "1a.")

= Parse trees and derivations

==
#align(center + horizon, [#image("../imgs/h5-v1-a.png", height: 100pt) $E -> T -> F -> a$])

==
#align(center + horizon, [#image("../imgs/h5-v1-b.png", height: 100pt) $E -> E + T -> T + F -> F + a -> a + a$])

==
#align(center + horizon, [#image("../imgs/h5-v1-c.png", height: 100pt) $E -> E + T -> E + T + F -> T + F + a -> F + a + a -> a + a + a$])

==
#align(center + horizon, [#image("../imgs/h5-v1-d.png", height: 100pt) $E -> T -> F -> (E) -> (T) -> (F) -> ((E)) -> ((T)) -> ((F)) -> ((a))$])


#pagebreak()
= Chomsky

#grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 16pt,
  [ Lets start by adding a new state $A_0$ and a rule $A_0 -> A$ we now have the states: ],
  [ Now we remove $B->epsilon$ and get: ],
  [ Now we remove $A->epsilon$ and get: ],
  [ Now we eliminate $A->A$ and get: ],[
  $
    A_0 &-> A\
    A &-> B A B\
    A &-> 1\
    A &-> epsilon\
    B &-> 00\
    B &-> epsilon
  $],[
  $
    A_0 &-> A\
    A &-> B A B\
    A &-> 1\
    A &-> epsilon\
    A &-> B A\
    A &-> A B\
    A &-> A\
    B &-> 00\
  $],[
  $
    A_0 &-> A\
    A &-> B A B\
    A &-> 1\
    A &-> B A\
    A &-> A B\
    A &-> A\
    A &-> B B\
    A &-> B\
    B &-> 00\
  $],[
  $
    A_0 &-> A\
    A &-> B A B\
    A &-> 1\
    A &-> B A\
    A &-> A B\
    A &-> B B\
    A &-> B\
    B &-> 00\
  $],
  [Now we eliminate $A->B$ and get:],
  [Now we eliminate $A_0->A$ and get:],
  [Now we eliminate all right hand variables longer than 2 and get:],
  [Finally we replace terminals longer than 1 with variables and get:],[
  $
    A_0 &-> A\
    A &-> B A B\
    A &-> 1\
    A &-> B A\
    A &-> A B\
    A &-> B B\
    A &-> 00\
    B &-> 00\
  $],[
  $
    A_0 &-> B A B\
    A_0 &-> 1\
    A_0 &-> B A\
    A_0 &-> A B\
    A_0 &-> B B\
    A_0 &-> 00\
    A &-> B A B\
    A &-> 1\
    A &-> B A\
    A &-> A B\
    A &-> B B\
    A &-> 00\
    B &-> 00\
  $],[
  $
    A_0 &-> B X\
    A_0 &-> 1\
    A_0 &-> B A\
    A_0 &-> A B\
    A_0 &-> B B\
    A_0 &-> 00\
    A &-> B X\
    A &-> 1\
    A &-> B A\
    A &-> A B\
    A &-> B B\
    A &-> 00\
    B &-> 00\
    X &-> A B\
  $],[
  $
    A_0 &-> B X\
    A_0 &-> 1\
    A_0 &-> B A\
    A_0 &-> A B\
    A_0 &-> B B\
    A_0 &-> 00\
    A &-> B X\
    A &-> 1\
    A &-> B A\
    A &-> A B\
    A &-> B B\
    A &-> Y Y\
    B &-> Y Y\
    X &-> A B\
    Y &-> 0
  $]
)

Final form:
$
  A_0 &-> B X | B A | A B | B B | Y Y | 1\
  A &-> B X | B A | A B | B B | Y Y | 1\
  B &-> Y Y\
  X &-> A B\
  Y &-> 0
$

#pagebreak()
= Show that i,j,k apples are context free

We can show that this is context free by creating a CFG that generates the language.

We start by creating a CFG for the left hand side apples, we want to be able to get infinate or none apples and finally end on a plus that leads into the right hand side. Well say that $S -> a A$ and $A -> a A | B$

Now lets do the right hand side, it's similar to the left side, infinate or none apples but now we want the number of apples to match or be greater than the right side of $=$. We start by defining a new transition $S -> + a B$ and define $B -> a B a | a B | =$ 

We end up with the following CFG:

$
  S &-> a A\
  S &-> + a B\
  A &-> a A\
  A &-> + B\
  B &-> a B\
  B &-> a B a \
  B &-> =
$
