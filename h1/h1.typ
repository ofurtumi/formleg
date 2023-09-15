#set heading(numbering: "1.")
#import "@preview/cetz:0.1.0"

= Proof by induction
Lets prove that:

$ (1+2+...+n)^2 > 1^2+2^2+...+n^2 "for" n >= 2 $

Let's rewrite both of the sums of $n$ numbers: 
- sum of $n$ numbers: $1+2+...+n=((n(n+1))/2)^2$ 
- square sum of $n$ numbers: $1^2+2^2+...+n^2=(n(n+1)(2n+1))/6$

Now we can try to prove that $((n(n+1))/2)^2 > (n(n+1)(2n+1))/6$ and simplify it further

== Base case: $n=2$

$ ((2(2+1))/2)^2 = 3^2 = 9 > (2(2+1)(4+1))/6 = (30\/6)/6 = 5 $


== Inductive step:
The prove holds for the base case. 
Now we can assume that the prove holds for $k$ and try to prove it for $k+1$.

$ 
(((k+1)(k+2))/2)^2 &> ((k+1)(k+2)(2(k+1)+1))/6 \ 
((k^2+3k+2)/2)^2 &> (2k^3+9k^2+13k+6)/6 \
(k^4 +6k^3 + 13k^2+12k+4)/4 &> (2k^3+9k^2+13k+6)/6
$

Since we know that $k >= 2$ we can say that $k^4 >= 4k^3$ and $k^2 >= 2k$ and $12k >= 13$ and $4 >= 6$.

= Triple $0$ state machine
#image("./imgs/h1-2.png")
Here we have a simle state machine tha only allows through itself binary strings that include a substring of _"000"_.

#pagebreak()

= Is $B$ a regular language
#grid(columns: (3fr, 1fr), gutter: 16pt, [
Suppose that $A$ is a regular language with alphabet $Sigma$. Let $B$ denote the language where we have omitted strings with an even length
$ B={w in A: |w| = 2k + 1 "for some" k = 1,2,...} $
We can show that *$B$ is regular* by creating a state machine for the language. We can only go between $S_0$ and $S_1$, and we can only end in $S_1$ if we have an odd number of letters in the input word.
],[
#align(center + horizon,
  cetz.canvas({
    import cetz.draw: *
    circle((0, 0), name: "s0", radius: 0.5)
    circle((2, 0), name: "s1", radius: 0.5)
    circle("s1.center", name: "s11", radius: 0.4)
    content("s0.center", [$S_0$])
    content("s1.center", [$S_1$])
    line("s0.right", "s1.left", name: "line", mark: (end: ">", start: ">"))
    content((1, 0.25), [$Sigma$])
  })
)]
)

= Calculating checksum
== Proofing that $w^R in A "for all" w in A$

We know that 
$ c = a_0 xor a_1 xor ... xor a_n $ 
and $w^R$, being the reverse of $w$, should correspond to 
$ c^R = a_n xor a_(n-1) xor ... xor a_0 $ 

Because of the commutitive properties of XOR we know that $a_0 xor a_1 = a_1 xor a_0$ and since $c^R$ is just $c$ reversed we can safely say that $c = c^R$ and therefore we proof that $w^R in A "for all" w in A$
