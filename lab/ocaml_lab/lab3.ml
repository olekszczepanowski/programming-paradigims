let id x = x;;

let cubes x = x*x*x;;

let rec fact x = 
  if x < 1 then 1
  else x * fact (x-1);;

let rec sum func a b = 
  if a>b then 0
  else func a + sum func (a+1) b;;


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
