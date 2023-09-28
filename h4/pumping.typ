Pumping lemma for regular languages

If $A$ is regular $exists "pumping length" P$ such that for any $s in A$, $|s|>=P$, string s can be split into $x y z$ so that the folowing three conditions hold:

+ $x y^i z in A "for all" i=0,1,2,3...$
+ $|y| > 0$
+ $|x y| <= P$
