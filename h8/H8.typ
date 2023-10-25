#import "@templates/ass:0.1.1":*

#show: doc => template(
  class: "TÖL301G",
  project: "Homework 8",
  doc
)

#set heading(numbering: "1.a.")

= DFA M
== Is $1011 in L(M)$
This string is rejected, since $q_8$ does not have a $1$ transition into an accept state

== Is $angle.l M, 1011 angle.r in A_"DFA"$
This combo of DFA and string is rejected since $M$ does not accept $1011$

== Is $angle.l M, 1010 angle.r in A_"DFA"$
Yes, this combo of DFA and string is accepted, we follow the states $q_0->q_2->q_5->q_8->q_5$

== Is $angle.l M angle.r in E_"DFA"$
No, $E_"DFA"$ rejects $M$ since we have shown that $M$ accepts atleast one string

= Is $A$ decidable
We know that we can change a regular expression into a DFA, lets define $R_"DFA"$ and $S_"DFA"$ as the DFA's for $R$ and $S$.

We create a new DFA, $R'_"DFA"$ that is the complement of $R_"DFA"$, this DFA rejects all strings accepted by $R_"DFA"$. 
Now we create a final DFA $R' S_"DFA"$ which corresponds to the intersection of $R'_" eDFA"$ and $S_"DFA"$.
Finally we put our new $R'S_"DFA"$ into $E_"DFA"$, if $E_"DFA"$ accepts then we have shown that $S$ is a sublanguage of $R$ and is therefore decidable.

= Non negative integer pairs
== show that $W$ is both infinate and countable
We can show that $W$ is infinate and countable by creating a function $ f(a,b) = p^a q^b $ where $p$ and $q$ are prime numbers where $p != q$.
This is possible because every integer can be factorized into a unique product of primes
_(see the unique factorization theorem)._

== Show that $r(y) := S(y)$ is finite for all $y$
Given the rules of $S(y)$ that $x < y$ we have two possible situations:
$ x_2 < y_2 $
$x$ has $x_2 + 1$ possible combos, in other words $y_2$, for where $x_2$ can be any integer between $0$ and $y_2 - 1$.

$ x_2 = y_2 "and" x_1 < y_1 $
now $x$ only has $y_1$ possible combos since $x_2$ does not change. 

== Closed form
#grid(columns: 2, [
For the rule $x_2 < y_2$ $x_2$ can take any value between $1$ and $y_2 - 1$, $x_1$ can take values between $0$ and $x_2 - 1$, this can be shown by the closed form
$ sum^(y_2-1)_(i=1) i = (y_2(y_2 - 1)) / 2 $
],[
For the rule $x_2 = y_2 "and" x_1 < y_1$ we have $y_1$ possible combos, this can be shown by the closed form $ sum^(y_1)_(i=1) i = y_1 $
])

Combining these closed forms we get the closed form $ R(y) = (y_2(y_2 - 1)) / 2 + y_1 $
