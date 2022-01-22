let foo = [%code 2]
open Ppx_stage
let rec my_pow (n : int) (x : int code) : int code = 
  if n = 0 then
    [%code 1]
  else if n = 1 then
    x
  else
    [%code [%e x] * [%e my_pow (n - 1) x]]

