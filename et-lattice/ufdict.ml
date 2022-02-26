

type 'a semilattice = {
    x : 'a;
    bot : 'a;
    join : 'a -> 'a -> 'a
}

type ('a,'wit) semilattice = {
    x : 'a;
    bot : 'a;
    join : 'a -> 'a -> 'a
}

let meet : 'a lat -> 'a lat -> 'a lat =
    fun x y ->
        {x with x.meet x.x y.x}

module UF = struct
type t = int Int.Map.t 
(* Could also include rank, which Int.Map.t probably already has inside it. So what we're doing is already doofy. So why bother *)

(* We could do path compression during find. find : t -> int -> (int * t) option *)
let find ( uf: t) (x : int) : int option = 
    match Int.Map.find uf x with
    | None -> None
    | Some x' -> if Int.(x = x') then Some x' else find uf x'

    (* essentially a memoizaion of find. *)
let norm (uf : t) : t = 
    Int.Map.fold uf ~f:(fun ~key ~data acc ->
        let canon = find uf key in
        Int.Map.add_exn acc key canon
        )
let union uf x y : t =
    let canonx = find uf x in
    let canony = find uf y in
    Int.Map.update uf canonx canony
let empty = Int.Map.empty
let meet uf uf' : t =


let lat x : t lattice = {x ;meet; bot=empty}

end

(* 

Tuple union find (int * int) as key? Thre is nothing special about this. It might as well be string


UF.t == partitioning lattice maybe multiples?
strings : string Int.Map.t
Array.Set.t == powerset lattice (all ints, nned to lookup meaning in other tables)

type state =
{
ufs : UF.t String.Map.t
fresh : int
strings : string Int.Map.t
rels : IntArray.Set.t String.Map.t
schema : coltyp list String.Map.t
}

type coltyp = UF of string | String | Int

functional dependencies are part of the schema?
lattices : packed_lattice Key.Map.t
Or i could have a fixed set of lattices
type lat_typ = Min | Max |  


Ported Graphs.
       _____eclass
      /
id---f
     \______eclass


f are tables with functional dependencies

schem

*)

module UFDict = struct
    type 'a t = (int, 'a) either Int.Map.t
    
    let find ( uf: 'a t) (x : int) : ('a * int) option = 
        match Int.Map.find uf x with
        | None -> None
        | Some (Left x) -> find uf x
        | Some (Right v) ->  Some (x, v)
    let norm (uf : t) : t = 
        Int.Map.fold uf ~f:(fun ~key ~data acc ->
            
            ) 
    let union 
    
    let meet 
    
end

(* 
There isn't persay a reason eclass id has to be an int.
It's a very natural choice though

If you want a union find set over another type, you need to maintain isomorphism maps to int.
Annoying.


module UF(C : Comparator) = struct
    type t = (C.t, C.w) Map.t

end


*)