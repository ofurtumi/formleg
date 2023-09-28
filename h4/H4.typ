#import "@templates/ass:0.1.1": *

#show: doc => template(
  project: "Homework 4",
  class: "TÖL301G",
  doc
)

#set heading(numbering: "1.a")
= $"non-reg" sect "non-reg" = "reg"$

Lets use the following non-regular languages $A$ and $B$:
$
  A &= {0^n 1^n | n >= 0}\
  B &= {2^n 3^n | n >= 0}
$

These languages are irregular for the same reason, they are not closed under pumping lemma.

#box(stroke: 1pt, inset: 8pt, [
Lets suppose that $A$ is regular, let $P$ denote pumping length and $s = 0^P 1^P$. According to pumping lemma $s$ splits into $X Y^i Z$ so that rules _i-iii)_ of the pumping lemma hold.

Now $Y = 0^j | j in {1...P} $ and if we pump down and set $i = 0$ we get $s' = X Z = 0^(P-j) 1^P$ which is not in $A$.
])

Since these languages do not use the same alphabet, they are not equal and the only intersection they have, the empty string, would be regular
$ A sect B = {emptyset} $

= File trees
Lets define the language $"DIR"$ we have two major rules
+ Each file, $a$, has a corresponding pair of parenthesis
+ The root folder does not have a file name

Lets show that this language is irregular by applying pumping lemma.

#box(stroke: 1pt, inset: 8pt, [
Lets suppose DIR is regular, let $P$ denote pumping length and $s = (a^(P-2)\(\))$. According to pumping lemma $s$ splits into $X Y^i Z$ so that rules _i-iii)_ of the pumping lemma hold. 

Now $Y = a^j$ where $(j | j in {1...P}) $ and if we pump down and set $i = 0$ we get $s' = X Z = a^(P-j) \(^(P+1) \)^(P+1)$ and since $P+1 != (P-1)+1$ which is not in does not follow the rules of $"DIR"$ therefore $"DIR"$ is not regular.
])


#pagebreak()

= CRC codes
== 
The checksum of the empty string would have a draw between all the numbers: ${0,1,2}$ and since $0$ takes precedence, the checksum would be $[0,0]$.

==

Suppose that the following language is regular:
$ A={0^i 1^j 2^k | "file has valid checksum"} $

- Let $P$ denote pumping length 
- $s = 0^P 1^(P+1)2^(P-1)$

According pumping lemma $s$ splitsi into $X Y Z$ so that rules _i-iii)_ of the pumping lemma hold.
According to rules _ii)_ and _iii)_ of the pumping lemma $|x y| <= P$ this means that 
$ y = 0^j | j in {1...P} $

From rule _i)_, if we pump down and set $i = 0$ we get $s' = X Z = 0^(P-j) 1^(P+1) 2^(P-1)$

Because the checksum takes the lowest number incase of a draw, after pumping the checksum will be invalid and that is a contradiction. Therefore the language is not regular.

