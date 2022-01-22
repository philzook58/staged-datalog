type t' = {mine' : int -> int} [@@ocaml.unboxed]
let x1 : t' = {mine' = fun x -> x + 42}


type t = {mine : int -> int}
let x : t = {mine = fun x -> x + 42}

let q z = z.mine
let q' z = z.mine'  
(*
Yeah
*)

let z = 93312

let a = ref 0
let () = a := 1
let () = a := 2
let () = a := 3
let w = ()
let () = a := 4
let b = ref 0
let () = b := 1
let () = b := 2
let () = b := 3
type p' = {mine' : int} [@@ocaml.unboxed]
let x1 : p' = {mine' = 55445}


type p = {mine : int}
let x : p = {mine = 433}