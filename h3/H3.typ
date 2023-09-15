#set heading(numbering: "1.")

= Language 
Consider the following language $L(10^∗(0 union 1))$

#grid(columns: (2fr, 1fr), gutter: 16pt, [
== NFA
#image("../imgs/h3-1a.png")
],[
== Simulation
#align(horizon,
```
Init: q0
Accept: q2

q0,1,q1
q1,0,q1,q2
q1,1,q2
```)
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
#grid(columns: (1fr, 1fr), gutter: 16pt, [
#image("../imgs/h3-3a.png")
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

