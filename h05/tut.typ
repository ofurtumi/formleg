#import "@templates/ass:0.1.1": *

#show: doc => template(
  project: "Tutorial 5",
  class: "Töl301G",
  doc
)

#set heading(numbering: "1a.")

= Sýnið eftirfarandi regex sem hægri regluleg mál

_terminal:_ Tákn sem hefur ekki reglu útfrá sér

== *$R_1 = 10^*1$*
$
  A &-> 1B \
  B &-> 0B \
  B &-> 1
$

== *$R_2=1(1011)^*0$*

$
  A &-> 1B\
  B &-> 1C_1\
  B &-> 0\
  C_1 &-> 0C_2\
  C_2 &-> 1C_3\
  C_3 &-> 1B\
$

= Sýnið að eftirfarandi mál séu context free

== {0^n 10110^n}
Þurfum bara þrjár reglur til að fá jafn magna af núllum með "1011" á milli

$
  S &-> A \
  A &-> 0 A 0 \
  A &-> 10110
$

== {0^i 1^j 2^k | i = j or j = k}

Við skiptum málinu í tvær týpur:
$ 
  {0^n 1^n 2^k}\
  {0^n 1^k 2^k}
$
sem eru bæði context free, og við vitum að union af context free tungumálum er context free

== *${0^n 1^m | n >= m}$*
Við getum endurskrifað þessa mállýsingu sem ${0^n 0^m 1^m | n >= 0, m >= 0}$

= Show that the class of context-free languages is closed under the regular operations, union, concatenation, and star.
_Hint: given two CFLs A and B, there exists the correspoinding CFGs, say $G_1$ and $G_2$ with start variables $S_1$ and $S_2$ respectively._

== Union
Skilgreinum nýja upphafsbreytu S og tvær nýjar reglur

$ 
  S &-> S_1 \
  S &-> S_2
$

Þá ef við höfum málin $G_1, G_2$ þar sem

$
  G_1: A &-> a\
  G_2: B &-> b
$

Bætum við reglum við $G_1, G_2$ að $S_1 -> A, S_2 -> B$ þá getum við úr $S$ farið í bæði $a$ og $b$

== Concatenation
Eins hér bætum við nýrri breytu $S$ og reglu

$ S -> S_1 S_2 $

== Star operation
Nú höfum við bara $G_1$, látum $S$ vera nýja start breytan okkar og bætum við það reglum

$
  S &-> S_1 S\
  S &-> epsilon
$

Þá sjáum við að við getum endurtekið S endalaust
