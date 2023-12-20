#set heading(numbering: "1.a.")

=
Big-O: $f(n) <= c g(n) for n >= n_0$
Small-o: $lim_n inf (f(n))/(g(n)) = 0$

=
Many problems require one to read the whole input, i.e. the running time is at least $O(n)$. An example of non-trivial language is, e.g., $A = {w:|w| >= 42}$ as that can be decided within $42$ steps. In fact, if a language can be deciden in n steps, then it must be regular, why?

=
== 
$O(n^2)$ þurfum að fara yfir strenginn í hverju skrefi og halda utan um carry bita eða state

==
$O(n^2)$ basically sama nema núna þurfum við ekki að spá í carry

= Leiðinlegt, beila

=
==
Fyrir hvern bíl þurfum við farþega og við höfum sama fjölda farþega og bíla svo leitarsvæðið gæti verið n-tuples, eða allar mögulegar samsetningar af $(1,...,n)$. Fyrri möguleikinn hefur stærði $n^n$ og seinni $n!$ 

== Kostnaðurin 
