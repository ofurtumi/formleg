#set heading(numbering: "1.a")

= Are the statements correct
== This is false

$A != A^*$ we can proof this by counterexample, let $A = {1}$ then $A^*$ equals the regular expression $1^*$, which corresponds to every possible combination of $1$ including $epsilon$, and it is obvious that $1 != 111...$

== This is true
Since $A^*$ includes all combinations of $A$ it also includes $A$ so it does not matter whether or not it is concatinated

== This is true
The order of operations does not matter for concatination

= State diagrams
#grid(columns: (1fr, 1fr), gutter: 16pt, [
== 
#image("../imgs/h2-2a.png")
],[
==
Here is the code for the NFA tester
```
Init: q0
Accept: q1, q2

q0,0,q1
q0,1,q2
q1,0,q1
q2,1,q2
```
])
==
To do the same task as a DFA we would need to add a trap state to the NFA that catches the inputs not currently in the NFA. $S_1$ would then transition into itself on a $0$ but into $S_3$ on a $1$ and $S_2$ would transition into itself on a $1$ but into $S_t$ on a $0$. $S_T$ would transition into itself on both $0$ and $1$. So we would need 4 states in total, one more than in the NFA.

#pagebreak()

= Funnis application language
#grid(columns: ( 4fr, 1fr ), gutter: 16pt, [
== NFA
#align(center, figure(image("../imgs/h2-3a.png"), caption: [Here is a NFA for the language, this shows that the language is in fact regular]))
],[
== Simulator code
```
Init: q0
Accept: q6

q0,A,q1
q0,1,q2
q1,a,q1
q1,n,q6
q1,s,q3
q2,1,q2
q2,n,q6
q2,s,q3
q3,a,q4
q3,1,q5
q4,a,q4
q4,s,q3
q4,n,q6
q5,1,q4
q5,s,q3
q5,n,q6
q6,A,q1
q6,1,q2
```])
