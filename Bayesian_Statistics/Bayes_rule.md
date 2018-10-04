# Byes' Rule

## Definition (Axioms of Probability)

### Definition One

The set,$S$, of all possible outcomes of a particular experiment is called the **sample space** for the experiment.

### Definition Two

An **event** is any collection of possible outcomes of an experiment, that is , any subset of $S$ (including $S$ itself).

### Example on One and Two
We have a Six-sided die-tossing example:
* $S = \{1,2,3,4,5,6\}$
* Event:
  * A: an odd number is rolled
  * B: a number less than 4 is rolled
  * C: 1,2,3,4,5,6 is rolled

### Definition Three

Two events $A_1$ and $A_2$ are **disjoint** (or **mutually exclusive**) if both $A_1$ and $A_2$ cannont occur simultaneouly. The events $A_1, A_2,\dots$ are **pairwise disjoint** ( or **mutually exclusive**) if $A_i$ and $A_j$ cannot occur simultaneously for any $i \neq j$.

### Example on three
We have a Six-sided die-tossing example:
* $A_1$: an odd number is rolled, $A_2$ an even number is rolled
* $A_i$: $i$ is rolled for $i = 1,2,\dots,6$

### Definition Four

Given a sample space $S$, a **probability function** is a function $P$ that satisfies:
1. $P(A) > 0$
2. $P(S) = 1$
3. If $A_1,A_2,\dots$ are pairwise disjoint, then $P(A_1\text{ or }A_2,\dots) = \displaystyle{\sum^{\infty}_{i=1}P(A_i)}$

### Example of Four:
Six-sided die-tossing example:
* $A_i$:is rolled for $i = 1,2,\dots,6$
* $P(A_i) = \frac{1}{6}$

### Definition Five

If $A$ and $B$ are events in $S$, and $P(B) > 0$, then the **conditional probability of $A$ given $B$**, written $P(A|B)$, is:$P(A|B) = \frac{P(A \cap B)}{P(B)}$
