let id x = x;;

let cubes x = x*x*x;;

let fact x =
  let rec factHelper x acc =
    if x < 1 then acc
    else factHelper (x - 1) (x * acc)
  in
  factHelper x 1;;


  let sum func a b =
    let rec sumHelper acc a b =
      if a > b then acc
      else sumHelper (acc + func a) (a + 1) b
    in
    sumHelper 0 a b;;
  

(* tests *)
let testid1 = sum id 1 3;;
let testid2 = sum id 1 10;;
let testid3 = sum id 4 0;;
let testid4 = sum id 1 1;;

let testcub1 = sum cubes 1 3;;
let testcub2 = sum cubes 1 10;;
let testcub3 = sum cubes 4 0;;
let testcub4 = sum cubes 1 1;;

let testfact1 = sum fact 1 3;;
let testfact2 = sum fact 1 10;;
let testfact3 = sum fact 4 0;;
let testfact4 = sum fact 1 1;;
