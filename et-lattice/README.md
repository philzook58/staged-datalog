
What are the semantics of this language


(declare-sort AExpr 0)
(declare-fun mul (AExpr AExpr) AExpr)
(declare-fun add (AExpr AExpr) AExpr)
(declare-fun lit (Int) AExpr)



(declare-fun var (String) AExpr)

type interp = (string -> int) -> int
[[`var`]] : (String -> Int) -> Int
[[mul]] : interp -> interp -> interp

This is tight interpetation
But herbrand universe ish thing is at play
interp Set.t

L -> L -> L
L -> L -> L
propagators
constraint programming

union(id1,id2) as meet. Not the ids though. We're unioning the sets?
What _is_ id1. A (possibly infinite) set of terms?





Could I embed egraph into
SAT solver, yes. absolutely. Ematching is hard though
CSP solver, maybe

https://en.wikipedia.org/wiki/Cancellation_property
https://en.wikipedia.org/wiki/Integral_domain


Propagators - monotone operators between lattices

Same thing here, except we also require that term labelled  "foo" plays right with it's hebrand sets.
foo is overloaded. It is both term constructor, but also lattice function.
We can lift foo as term to default lattice function possibly
But we can always determine foo as term from lattice function
{ [f] t \in f T | forall t in T  }

The disjointness condition is weird.


Herband universe

interp :: id -> egraph -> Set in herband uyniverse
[[egraph]] = set of disjoint sets of herbrand universe



a = 1 makes my rho interpetation not make sense

monotone?

Coq relation between egraph and 
Literally use coq condinductives?
If the egraph unfolding process bisimulated the coniductive then the coinductive "belongs to" that set.
A condiuctive term is a trace of the egraph, then it is in it's set.

```coq
It's like a search process.

Conductive term :=
   Add : term -> term -> term
   (* Lit : nat -> term *)
    Var : term

CoInductive eterm :=
    Add : enode -> enode -> eterm
    Lit : nat -> eterm
    and
    enode := list eterm.

Definition egraph = list enode.

(a + a) = a

Cofixpoint enode1 and enode2 and enode3 adn eterm1 and eterm2 := [ Add [enode1  enode2    ]

Coindutive is garbage though.

Inductive egraph1 a :=
    | AIn : egraph1 a
    | 

Inductive enode i a :=
    | A : enode 0 A
    | Add : forall x y, enode 0 x -> enode 0 y -> enode 0 (Add x y)

Coq inductives are prolog rules.

realtional presentation
Add a b c := 

```




dreal ~ ICP + 

I almost feel like we are kind of heading down an intuitionistic smt solver.
