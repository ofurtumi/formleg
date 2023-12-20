#import "@templates/ass:0.1.1": *
#import "@preview/truthfy:0.2.0": generate-table, generate-empty

#show: doc => template(
  class: "TÖL301G",
  project: "Homework 11",
  doc
)

= Are the formulae satisfiable

== $(x_1 or x_2) and (overline(x)_1 or overline(x)_2)$
This is satisfiable for the following values ${x_1 = 1, x_2 = 0}$ or ${x_1 = 0, x_2 = 1}$ 

== $(x_1 or x_2) and (x_1 or overline(x)_2) and (overline(x)_1 or x_2) and (overline(x)_1 or overline(x)_3)$

Lets create a small truth table:
#align(center, generate-table($x_1 or x_2$, $x_1 or not x_2$, $not x_1 or x_2$, $not x_1 or not x_3$))

We can see that in the next to last line, $x_1=1, x_2=1, x_3=0$, we have a satisfiable solution

== $(x_1 or ̄overline(x)_2) and (overline(x)_1 or x_2 or x_3) and (x_1 or ̄overline(x)_3)$

Again, let's create a truth table:
#align(center, generate-table($x_1 or not x_2$, $not x_1 or x_2 or x_3$, $x_1 or not x_3$))

Here we have four satisfiable solutions, the first and also the three last $ {x_1, x_2, x_3} = cases({0,0,0}, {1,0,1}, {1,1,0}, {1,1,1}) $

= Show that $P$ is closed under union, concatenation and complement

== Union
Since both languages are in $P$ we know that they will run in polynomial time. Let's construct a turing machine that will decide on the union of two languages $L_1$ and $L_2$, we call this machine $M_union$. $M_union$ functions as follows:

+ On some input $i$ we run $M_1$ (turing machine for $L_1$) on input $i$
+ If it accepts, we accept
+ If it rejects, we run $M_2$ (turing machine for $L_2$) on input $i$
+ If it accepts, we accept
+ If it rejects, we reject

== Concatenation
We can show this in a similar fashion as for union, here we construct a turing machine $M_+$ that decides on the concatenation of two languages $L_1$ and $L_2$ that are both in $P$, now $M_+$ functions as follows:

+ On some input $i$ we run $M_1$ (turing machine for $L_1$) on input $i$
+ If $M_1$ rejects, we reject
+ If $M_1$ accepts, we run $M_2$ (turing machine for $L_2$) on input $i$
+ If $M_2$ accepts, we accept otherwise we reject

== Complement
This is the easiest to show, now we have only on language $L_1$ that is in $P$ we create a turing machine $M_-$ that decides on the complement of $L_1$, $M_-$ functions as follows:

+ On some input $i$ we run $M_1$ (turing machine for $L_1$) on input $i$
+ If $M_1$ accepts we reject
+ If $M_1$ rejects we accept


