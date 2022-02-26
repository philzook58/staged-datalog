
open Core_kernel


module ASet = Set.Make(Array.Int)

type state = {
  tables : ASet array;
  uf : unit
}

(* name and arity of tables *)
type schema = (string * int) list

let build (schema : schema) : state =
  {
    tables = Array.make (List.length schema);
    uf = ()
  }

type reg = int
type table_id = int

let table_pattern = string * string list (* named table and named *)



type pattern = table_id * reg array


type compile_env = {
  table_id : int String.Map.t;
  reg_id : int String.Map.t
  nregs : int
}
let compile ((name, args) : table_pattern)  (env : compile_env): compile_env * pattern =
  String.Map.find_exn env.table_id name, List.fold args ~init:env ~f:(fun env arg ->
      match String.Map.find reg_id with
      | None ->
      | Some r -> r
    )
type multi_pattern =  pattern array




type uf_id = int
type bind_env = uf_id array

let nregs ((_name, args) : pattern) = Int.Set.length @@ Int.Set.of_list (Array.to_list args)
let nreg_multi (ps : patterns) = let allregs = Array.fold_left Int.Set.empty ps ~f:(fun acc (_name, args) ->
  Int.Set.add_multi acc (Array.to_list args)) in
  Int.Set.length allregs

(*
We statically know which registers are known and which aren't.


*)