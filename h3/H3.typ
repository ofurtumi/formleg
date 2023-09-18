#import "@templates/ass:0.1.0": *
#import "@preview/finite:0.1.0"
#import "@preview/cetz:0.1.1"

#show: doc => template(
  project: "Verkefni 1",
  class: "TÖL105M - Tölvugrafík",
  doc
)

#set heading(numbering: "1.a.1")

= Language 
#align(center, [Consider the following language $L(10^∗(0 union 1))$])

#grid(columns: (2fr, 1fr), gutter: 16pt, [
== NFA
  #cetz.canvas({
    import cetz.draw: set-style
    import finite.draw: state, transition

    state((0,0), "q0", initial: true)
    state((3,0), "q1")
    state((6,0), "q2", final: true)

    transition("q0", "q1", label: 1, curve: 0)
    transition("q1", "q1", label: 0, curve: 0)
    transition("q1", "q2", label: 0, curve: 0)
    transition("q1", "q2", label: 1, curve: -1)
  })
],[
== Simulation
```
Init: q0
Accept: q2

q0,1,q1
q1,0,q1,q2
q1,1,q2
```
])

= Mayan numbers
- We can lead with no or infinate zeros so we know that our regex will start with $a^*$
- The largest number that we can represent is $41 = "cb" = 2*20^1 + 1*20^0$
- The largest number possible in second place is $c$
- The only numbers we can add to $c = 40$ are $a = 0$ and $b = 1$
- The second largest number in the second place is $b = 1$
- We can add all other numbers of the alphabet to $b$

Using these rules we can construct the following regex: 

$ a^*(c[a b])|(b?[a-t]) $

Breaking it down we have zero or more a's followed by either $c a$, $c b$, $b$ followed by any letter from $a$ to $t$ or just any letter from $a$ to $t$

= Mayan numbers - continued
== DFA for the Mayans
#grid(columns: (1fr, 1fr), gutter: 16pt, [
#cetz.canvas({
  import cetz.draw: set-style, bezier, content
  import finite.draw: state, transition

  state((0,0), "q0", initial: true)
  state((5,0), "q1", final: true)
  state((0,5), "q2")

  transition("q1", "q0", label: 2, curve: 2)
  transition("q0", "q1", label: 1, curve: -0.5)
  transition("q0", "q2", label: 2, curve: 2)
  transition("q2", "q0", label: 1, curve: -0.5)
  transition("q2", "q1", label: 2, curve: 2)
  transition("q1", "q2", label: 1, curve: -0.5)
  transition("q2", "q2", label: 0, curve: 0)

  bezier("q0.top", "q0.right", (1, 1), mark: (end: ">"), label: 1)
  content((0.8, 0.8), [0])
  bezier("q1.top-right", "q1.bottom-right", (6.5, 0), mark: (end: ">"), label: 1)
  content((6.3, 0), [0])
})
],[
#align(horizon, [
  Let's start by dividing $A$ into three sublanguages, $Sigma_( 1-3 )$, where sublanguage $Sigma_n$ contains all numbers of $A$ that when divided by three give a remainer $n$.
  In our DFA we represent transitions by these remainders, so for example the numbers $0,3,6,9,12,15,18$ are all represented by the same kind of transition, $0$
    $ 
    Sigma_0 &= {0,3,6,9,12,15,18}\ 
    Sigma_1 &= {1,4,7,10,13,16,19}\
    Sigma_2 &= {2,5,8,11,14,17} 
    $
  ])
]
)

#pagebreak()
== Regex for the Mayans
$ 
  (0^*20^*10^*|0^*10^*20^*)^*(0^*10^*|0^*20^*20^*|0^*20^*10^*10^*|0^*10^*10^*20^*|0^*10^*20^*10^*)\
  (0^*10^*10^*10^*|0^*10^*20^*|0^*20^*10^*|0^*20^*20^*20^*|(0^*10^*10^*|0^*20^*){3})^* 
$

Since every state can accept numbers from $Sigma_0$ without changing state, the zeros become pretty overwhelming, so we can simplify the regex by removing them, they are still there i just don't write them out.

=== $R(A)$
The regex $A$ represents infinite or zero transitions from $q_0$ back into itself
$ (21|12) $ 

=== $R(B)$
The regex $B$ is the only necessary part of the big regex, it represents the transitions from $q_0$ to $q_1$ which is the end state
$ (1|22|211|112|121) $

=== $R(C)$
$C$ represents the transitions from $q_1$ back into itself, since we are already in the end state at this point, the only goal here is to stay.
$ (111|12|21|222|(11|2){3}) $

===
In conclusion, if we disregard the fact that the zeros are not written out, we can simplify the whole Mayan regex into 

$ A^*B C^* $ 
