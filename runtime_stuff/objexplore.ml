

let x = Obj.repr 3
let y = Obj.repr ()

let t = Obj.repr true
let f = Obj.repr false

let print_info t = 
  let r = t  in
  Format.printf "int:%b tag:%d size:%d\n" (Obj.is_int r) (Obj.tag r) (Obj.size r)

let () = List.iter print_info [x;y;t;f]
