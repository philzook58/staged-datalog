open Core_kernel

type ctor_def = {name: string; args: string list} [@@deriving sexp]
type datatype_def = {name : string; ctors : ctor_def list} [@@deriving sexp]

type command =
 | Eq of Sexp.t * Sexp.t
 | DeclareType of datatype_def

(* 
map from function name to values
But they want the ouptut to be on the same level as the inputs?
Fully relationalize?
*)
module type Lattice = sig
  type t
  val meet : t -> t -> t
  val bot : t

end



(*
Other lattices: 
https://github.com/draperlaboratory/cbat_tools/blob/master/vsa/value_set/lib/src/cbat_lattice_intf.ml
http://binaryanalysisplatform.github.io/bap/api/odoc/bap-knowledge/Bap_knowledge/Knowledge/Domain/index.html
*)
module UF = UnionFind.Make(UnionFind.StoreMap)


module Lattice = struct
  type t = int
  let union = Int.max
end

module IAMap = Map.Make(Array.Int)
type fun_table = Lattice.t IAMap.t (* String.Map.t *)
(* Relational. IntArray includes to output eclass id. *)

type egraph = {
  uf : int UF.store;
  fun_table : fun_table
}


let is_canon uf (key : int Array.t) = 
  Array.for_all key ~f:(fun i -> UF.is_representative uf (Obj.magic i))
let canon uf (key : int Array.t) =
  Array.map key ~f:(fun i -> Obj.magic (UF.find uf (Obj.magic i)))
let step egraph =
        let {uf; fun_table} = egraph in
        let fun_table = IAMap.fold fun_table ~init:fun_table ~f:(fun ~key ~data acc ->
        if is_canon uf key then acc
        else
            let acc = Map.remove acc key in
            let key = canon uf key in
            IAMap.update acc key ~f:(function
            | None -> data
            | Some d -> Lattice.union d data)
        ) in
        {uf; fun_table}
(* But latice _also_ includes enode id? *)

(*
let step egraph = 
      let uf = egraph.uf in
      IAMap.fold egraph.fun_table ~init:IAMap.empty ~f:(fun ~key ~data acc ->
        (*  if is_canonical uf key then acc else  let acc = Map.remove acc key in up    *)
      let a = Array.Int.map key ~f:(fun i -> UF.find i)
      (* if uf.find data != data then *)
      IAMap.update ~key ~f:(function
            | None -> data
            | Some d -> Uf.union uf d data )
            
      )*)

(*
Use bigarray and fully rebuild every time?
*)


(*
Staged
let prog = "


"

Staged.run prog

Hash join over self
Resolve collisions

*)