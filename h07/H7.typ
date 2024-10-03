#import "@templates/ass:0.1.1":*
#import "@preview/finite:0.3.0": *
#import "@preview/cetz:0.1.1": *

#show: doc => template(
  class: "TÖL301G",
  project: "Homework 7",
  doc
)

= Odd Square Machine
Let us consider language $S$ consisting of binary representations of _"odd squares"_, $1^2, 3^2, 5^2,...,$

"On input string $x$:
+ We add a delimiter to keep track of our input
+ After our delimiter we add 1 and another delimeter
+ We square the number behind our first delimiter, and store it after the second delimeter
+ We check if our squared number is equal to our input string, if so we accept
+ We check if our squared number is greater than our input string, if so we reject
+ We remove our squared number
+ We add two to our middle number, and go to state 3"

This implementation tests every odd squared number against our input string and halts if we go over our original input.

= Directory structure
We made this turing machine using only a measly 10 states, originally we drew it up using a state machine where each node transition was denoted by \<token read\>, \<token written \>, \<movement\>

#automaton((
  q0: (q1: "(,(,>"),
  q1: (q2: "a,a,>", q4: "),x,<"),
  q2: (q2: "a,a,>", q3: "(,(,>"),
  q3: (q2: "a,a,>", q7: "x,x,>", q4: "),x,<"),
  q4: (q4: "x,x,<", q5: "(,x,<"),
  q5: (q8: "_,_,>", q6: "a,x,<"),
  q6: (q6: "a,x,< / x,x,<", q3: "(,(,>"),
  q7: (q2: "a,a,>", q7: "x,x,>", q4: "),x,<"),
  q8: (q8: "x,_,>", qf: "_,_,-", ),
  qf: ()
),style: (
  q1-q2: (curve: 0),
  q3-q2: (curve: 0),
  q3-q4: (curve: 0),
  q4-q5: (curve: 0),
  q5-q6: (curve: 0),
  q8-qf: (curve: 0),
  q7-q2: (curve: 2),
  q6-q3: (curve: -2, dist: 0.33),
  q1-q4: (curve: 2, dist: 0.5),
))

This is not the original, i forgot to take a picture of it, but it is close enough

= Pop3 Turing
When we started working on this i think we were too stuck in the state machine mindset, we were able to create a state machine using the grammar above however it was huge, then we read the problem description again and found out that we did not need to check for the least common number.

This is the state machine we ended up with, there are some small bugs in it that we fixed directly in the code, but it is mostly correct.

#figure(image("../imgs/h7-v3-a.png"), caption: "This part creates a delimiter between the string and the checksum")

#figure(image("../imgs/h7-v3-b.png"), caption: "This part does all of the rest")
