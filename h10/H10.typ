#import "@templates/ass:0.1.1": *

#show: doc => template(
  class: "TÖL301G",
  project: "Homework 10",
  doc
)

= Which of the following are true?
Let $f(n) = 4n(n+2log_2 n^2) + e^(-n) + 8sin((2 pi n)/256)$

We can show that $f(n) = o(g(n))$ if: $ lim_(n->infinity) f(n)/g(n) = 0 $

We can show that $f(n) = O(g(n))$ if:

== $f(n) = o(n log_2 n)$
This is false since $f(n)$ grows faster than $g(n)$
- for $n = 100$: $ f(100)/g(100) = ( ~41605 )/200 = ~208 $
- for $n = 10000$: $ f(10000)/g(10000) = ( ~400320003 )/132877= ~3012 $

== $f(n) = o(2^n)$
This is true since $f(n)$ grows more slowly than $g(n)$

== $f(n) = o(n^4)$
This is true since $f(n)$ grows more slowly than $g(n)$

== $f(n) = O(n log_2 n^n)$
$n log_2 n^n = n^2 log_2 n$

This is false since for every $n > 2$ then $f(n)$ grows faster than $g(n)$

== $f(n) = O(2^n + 1)$
This is true because $2^n+1 >= n^2$

= $M_2$ modified
$ f(n) = (2k+1)(n+1), "where" k="ceil"(log_2 n) $
- $f(8) = 63$ my turing machine does the check in $44$ steps
- $f(10) = 99$ my turing machine does the check in $70$ steps
- $f(30) = 341$ my turing machine does the check in $262$ steps
- $f(60) = 793$ my turing machine does the check in $634$ steps
- $f(100) = 1515$ my turing machine does the check in $1264$ steps

= _"a reasonable time"_
== Brute force
We run Dijkstra's algorithm for all permutations of every transportation request and if there are no feasable solutions we return false otherwise we return the shortest path.
This would be a very slow algorithm since we would have to run Dijkstra's algorithm $n!$ times.

== Better algorithm

