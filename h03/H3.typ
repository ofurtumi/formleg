#import "@templates/ass:0.1.1": *
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
==
#grid(columns: (1fr, 1fr), gutter: 16pt, [
#cetz.canvas({
  import cetz.draw: set-style, bezier, content
  import finite.draw: state, transition

  state((0,0), "q0", initial: true)
  state((5,0), "q1", final: true)
  state((0,5), "q2")

  transition("q1", "q0", label: 1, curve: 2)
  transition("q0", "q1", label: 1, curve: -0.5)
  transition("q0", "q2", label: 2, curve: 2)
  transition("q2", "q0", label: 2, curve: -0.5)
  transition("q2", "q1", label: 0, curve: 2)
  transition("q1", "q2", label: 0, curve: -0.5)
  transition("q2", "q2", label: 1, curve: 0)

  bezier("q0.top", "q0.right", (1, 1), mark: (end: ">"))
  content((0.8, 0.8), [0])
  bezier("q1.top-right", "q1.bottom-right", (6.5, 0), mark: (end: ">"))
  content((6.3, 0), [2])
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
])

= Mayan regex
Lets start by breaking our regex up into three parts $X$, $Y$, $Z$ where each part represents a different goal

== $X$, lets stay at home

$X$ makes sure that we can stay in the starting position, home, for as long as we want, since we can add infinate zeros to the start of our number without it changing it's obvious that $0^*$ must be one of our options. Now we can also leave for a short while so and then come back home, our options to do that would be $21^*2$ and $12^*1$.

In short $X$ is the regex $(21^*2|12^*1|0)$ and we can repeat it as many times as we want, so $X^*$

== $Y$, one foot in the grave

$Y$ lets us go to our final destination, *the grave*, so that we can stay there and possibly make some stops on the way. There are only a couple of ways to get to the end, that is without taking a path we have already declared at home or repeating ourselves.
Those paths would be $21^*0$ and simply $1$.
Since we can't go to the end multiple times we only need to declare it once, so $B$ is the regex $(21^*0|1)$

== $Z$, the silver age

Now when arriving at $Z$ we could stop, but we want to keep going for a little longer but in the end we need to go back. There are two ways we can take to get out of the grave. 
$0$ and $1$, if we take the $0$ path we can then go to multiple places, more precisely from the grave we can go $(0(1^*(20^*2)^*1^*)^*0)$ and this path we can go as many times as we want.
Similarly if we choose the other path we could go $(1(0^*(21^*2)^*0^*)^*1)$.
Lastly we can go for a very short walk through $2$.
So all in all $Z$ is the regex $(0(1^*(20^*2)^*1^*)^*0|1(0^*(21^*2)^*0^*)^*1|2)$ and same as $X$ we can repeat it as many times as we want, so $Z^*$

== $R(A)$

We have broken our regex up into small pieces now we have to put it back together. $X^*Y Z^*$ would then be:

$ (21^*2|12^*1|0)*(21^*0|1)(0(1^*(20^*2)^*1^*)^*0|1(0^*(21^*2)^*0^*)^*1|2) $

#pagebreak()

#set heading(numbering: none)
= Mayan numbers - failed try
== DFA for the Mayans
#grid(columns: 2, gutter: 16pt, [
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
})],[
This was the first attempt, it took so long that i don't want to erase it. Here we thought that the string $0112$ would be the number $4$ but actiually it would be $422$. However this state machine was similar enough that it helped alot in understanding the actual problem.
])

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
