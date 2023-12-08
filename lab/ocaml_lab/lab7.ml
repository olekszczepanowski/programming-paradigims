
(* Zadanie 1 *)
let rec insert list x = 
  if isSorted list then
  match list with
  | [] -> [x]
  | hd::tl -> if x <= hd then x::list
  else hd::insert tl x
else failwith "Lista nie jest posortowana"
;;

let rec isSorted list = 
  match list with
  | [] -> true 
  | [_] -> true
  | x :: y :: tl -> x <= y && isSorted (y::tl)
;;

let list1 = [1;2;3;5;6];;
let list2 = [1;1;1;1;1;1];;
let list3 = [1;2;3;4;5;6;7];;
let unsortedList = [1;4;2;5;3];;
let emptyList = [];;
let oneElemList = [2];;
let test1 = insert list1 4;;
let test2 = insert list2 1;;
let test3 = insert list3 (-1);;
let test4 = insert list3 8;;
let test5 = insert unsortedList 9;;
let test6 = insert emptyList 2;;
let test7 = insert oneElemList 3;;

(* Zadanie 2 *)
type 'a nlist = Koniec | Element of 'a * ('a nlist);;
type 'a llist = LKoniec | LElement of 'a * (unit -> 'a llist);;

let rec ltake = function 
(0, _) -> []
|(_,LKoniec) -> []
|(n,LElement(x,xf)) -> x::ltake(n-1,xf())
;;

let rec powiel list =
  let rec powtorz n elem =
    if n <= 0 then Koniec
    else Element (elem, fun () -> powtorz (n - 1) elem)
  in
  match list with
  | Koniec -> Koniec
  | Element (hd, tl) -> powtorz hd hd @ powiel tl ()
;;

let list1 = Element(1, Element(2, Element(3, Koniec)));;
powiel list1;;

