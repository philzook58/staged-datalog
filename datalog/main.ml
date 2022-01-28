open Core_kernel


module ASet = Set.Make(Array.Int)

type state = {
  path : ASet.t;
  edge : ASet.t
}

let init = {
  path = ASet.empty;
  edge = ASet.empty
}

(*
Yeah it's always a good idea to write out concretly the thing you're trying to do.
*)
let sub1 {path; edge} = 
  let edge = ASet.add edge [|1 ; 2|] in
  let edge = ASet.add edge [|2 ; 3|] in
  let edge = ASet.add edge [|3 ; 4|] in
  let edge = ASet.add edge [|7 ; 8|] in
  {path; edge}
let exclusive_range s ~low ~high =
    let _, _optionlow, above = ASet.split s low in
    let good, _optionhigh ,_ = ASet.split above high in
    good
let sub2 st =
  let new_path = ASet.fold ~init:ASet.empty st.edge ~f:(fun new_path edge_row ->
      let [@warning "-8"]  [|x ; y |] = edge_row in
      let path_range = exclusive_range ~low:[| y; Int.min_value |] ~high:[| y + 1; Int.min_value |] st.path in
      ASet.fold path_range ~init:new_path ~f:(fun new_path path_row ->
        let [@warning "-8"]  [| _y ; z |] = path_row in
        ASet.add new_path [|x ; z|]
        )
    ) in
    let path = ASet.union st.path new_path in
    {st with path}

let sub2' edge =
  let rec loop delta_path path =
    let new_path = ASet.empty in
    (* We could perhaps iterate over delta_path first *)
    let new_path = ASet.fold ~init:new_path edge ~f:(fun new_path edge_row ->
        let [@warning "-8"]  [|x ; y |] = edge_row in
        let path_range = exclusive_range ~low:[| y; Int.min_value |] ~high:[| y + 1; Int.min_value |] delta_path in
        ASet.fold path_range ~init:new_path ~f:(fun new_path path_row ->
          let [@warning "-8"]  [| _y ; z |] = path_row in
          ASet.add new_path [|x ; z|]
          )
      ) in
      (* swap sort of *)
      let delta_path = ASet.diff new_path path in
      let path = ASet.union path delta_path in
      if ASet.is_empty delta_path then
        path
      else
        loop delta_path path
    in
    let delta_path = edge in
    let path = delta_path in
    loop delta_path path

(* 
Does split cost too much. Am I better off with sequence? min_value max_value

What are te operations here.

type table = ASet.t
type table_env = table String.Map.t

let path = define_table ~name:"path" [int;int]
let edge = define_table ~name:"edge" [int;int]

embedded syntax
let* (x,y) = edge in
let* (y,z) = path in
if x == 
emit path (x,z)

type machine = 
  | AddTable of string (* is also clear *)
  | Seq of machine * machine
  | SwapTable of string * string
  | Scan of {low ; high; row -> machine}
  | Insert of string * rowexpr 
  | Set of table_expr

type table_expr =
  | Diff of table_expr * table_expr
  | Union of table_expr * table_expr
  | Var of string
  | Lit of table
  | Insert of table_expr row_expr

type row_expr = item_expr list
type item_expr= Const of int | Var of ? |



type machine =
  | Scan : table -> (row -> machine) -> machine
  | Insert : row -> table -> (table -> machine) -> machine
  | Union : table -> table -> (table -> machine) -> machine
  | Return : table -> machine

implementing scan usingSet.t? Kind of feels like a more powerful construct.
table -> (row -> 'b) -> 'b

Maybe I can't?
Suppose it were list?

| Scan t f ->  let rec loop = function 
                | [] -> Done
                | t :: ts -> interp (f t)  ??? (fun r -> loop ts)

let tablecopy t1 t2 = Scan t1 (fun row1 -> 
    Insert (row1, t2, fun t2 -> ? )
  )



*)

let main () =
    let st = sub1 init in
    let st = {st with path = st.edge} in
    let st = sub2 st in
    Format.printf "edge: %a@;path: %a@;" Sexp.pp_hum (ASet.sexp_of_t st.edge) Sexp.pp_hum (ASet.sexp_of_t st.path);
    let st = sub2 st in
    Format.printf "edge: %a@;path: %a@;" Sexp.pp_hum (ASet.sexp_of_t st.edge) Sexp.pp_hum (ASet.sexp_of_t st.path);
    let st = sub2 st in
    Format.printf "edge: %a@;path: %a@;" Sexp.pp_hum (ASet.sexp_of_t st.edge) Sexp.pp_hum (ASet.sexp_of_t st.path);
    let st = sub1 init in
    let path = sub2' st.edge in
    Format.printf "Semi naive edge: %a@ path: %a@;" Sexp.pp_hum (ASet.sexp_of_t st.edge) Sexp.pp_hum (ASet.sexp_of_t path);
    ()
let () = main ()
(* ASet.to_sequence ~greater_or_equal_to ~less_or_equal_to *)
(*
Array of int is a fairly compact universal representation for a row.
Anything that has a valid to_int from_in representation
Also can intern ino hash tables

*)




(* 
type _ typ = 
  | Int : int typ
  | More : 'a typ -> (int * 'a) typ 

type table = Table : {typ : 'a typ; table : ('a, 'cmp) Set.t  } -> table
type row = Row : {typ : 'a typ ; row : 'a} -> row 
type (_,_) eq = Refl : ('a, 'a) eq

type relenv = table String.Map.t

let myfun : 't -> ('a list as 't) -> 't = fun y x -> x
(* as signatures in types. Wacky. *)
type ('a,'b) t = 'a * 'b constraint 'a = 'b constraint 'b = 'b
*)

(*
I should use 
int array as my row type

*)

(* let x : ('a,'b) t = (1,"foo")  (* fails *) *)

(* Note the differeence*)
let x : 'a = 3
(*
let x : type a. a = 3
*)

(*
unboxed attributes. Kind of interesting. 
https://ocaml.org/manual/attributes.html#ss:builtin-attributes
https://godbolt.org/z/4sYaGq6W7 Yeah, it's true.


*)
(*
Spiwack datalog https://github.com/aspiwack/randomizer-engine/blob/datalog/src/datalog.ml
*)

(*
I am using functional data structures out of convenience. 
I don't suppose there might be somethng useful there?
Additional quantifier 
or negation?

speculative or data deletion?
*)

(*
Could going tagless get rid of tags?
(fun ~field1 ~field2 ~field3 -> )
named parameters are kind of similar to record fields. Isn't that fun?
What data type are optional paramters?
I guess a construcotr that can take an argument or not. Weird.

Can I combine records in a way that doesn't have indirection if I go finally tagless?

type t
(a -> b -> t)

module (T1, T2) =
  type t
  T1.t -> T2.t -> t

But what, I'm going to store these closures in a map?
*)
(*
let x : 'a -> 'a = fun x -> x
let foo = x 3

let x : ('a,'b) t -> ('a,'b) t = fun x -> x

(*https://ocaml.org/releases/4.10/htmlman/gadts.html *)

let rec equal_typ : type a b. a typ -> b typ -> (a,b) eq option =
    fun x y -> match x, y with
    | Int, Int -> Some Refl
    | More ty, More ty' -> begin
                            match equal_typ ty ty' with
                           | Some Refl -> Some Refl
                           | None -> None end
    | _ , _ -> None

let lookup : row -> table -> bool option =
 fun (Row {typ;row}) (Table {typ=typ'; table})  ->
  match equal_typ typ' typ with
  | None -> None
  | Some Refl -> Some (Set.mem table row)
*)

(*
Ivan uses typed keys.
I think this hurts us? Eh maybe not


If I had an
KB.objects cls 
fields -> 

cls [slots] ->
KB.objects objs

 :- observe rhs, searchfor obj to insert rhs.
We could observe changes to build an index to objects.
obersve(K) >>= add_to_index.

Yes, the KB is weak at finding objects

*)

(*
let rec equal_typ' (type a b) : a typ -> b typ -> (a,b) eq option =
      fun (x : a typ) (y : b typ) -> match x, y with
      | Int, Int -> Some Refl
      | More ty, More ty' -> begin
                              match equal_typ' ty ty' with
                             | Some Refl -> Some Refl
                             | None -> None end
      | _ , _ -> None

      let rec equal_typ'' (type a b) (x : a typ) (y : b typ) : (a,b) eq option =
        fun x, y -> match x, y with
        | Int, Int -> Some Refl
        | More ty, More ty' -> begin
                                match equal_typ'' ty ty' with
                               | Some Refl -> Some Refl
                               | None -> None end
        | _ , _ -> None

*)


(*
Set.to_sequence ~greater_or_equal_to: ~less_or_equal_to: table
*)

(* 
type file = clause list
(** Toplevel statement *)
and clause =
| Clause of literal * literal list
and literal =
| Atom of string * term list
and term =
| Var of string
| Const of int
| Quoted of string
and query =
| Query of term list * literal list * literal list
(** Query: projection, positive lits, negative lits *)


(* It is difficult making this well typed.
  Or giving it a place to insert 'code'
*)
type table = More of table Int.Map.t | Done
type table = More of int Int.Map.t * table | Done
type table = Empty | OneCol of Int.Set.t | More of Int.Set.t Int.Map.t * table
(* kind of a monoidal presentation *)
type table = Join of table * table | Empty | Unit of Int.Set.t Int.Map.t
*)
(* A pile of different indices. Implicitly the join of a bunch of morphism columns.
Is this representation even possible? No way.
All of what I said is wrong.

Could do a row index to value.
type table = table Empty |  Col of int Int.Map.t code * table
But then the number of rows isn't constrained right
this is
type table = col list

type 'n table = 'n vec * 'n table | Done
type row 
*)
(* 
type table = (string * string, Int.Set.t Int.Map.t, 'cmp) Map.t

type table' = More of (int Int.Map.t code) * table | Done
(* A binarized table *)

type tables = 
  | One of int list
  | Two of int * int list
  | Three of int * int * int list
  | Four of int * int * int * int list
(* Bigarray
Yeah. Maybe just screw it.
Bigarrya has a runtime size, but whatever/

*)

type table = row list (* Can't make rows homogenous *)
type match_env = term String.Map.t
type table_env = table String.Map.t
*)

(*
We _need_ to make a hetergenous collection.
There's no 
{ ty : 'a typ ;  ('a, 'cmp) Set.t }

*)


