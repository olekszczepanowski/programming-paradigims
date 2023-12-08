
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

let rec append list1 list2 = 
  match list1 with
  | Koniec -> list2 
  | Element (head, tail) -> Element (head, append tail list2)
;;

let rec replicateElem elem acc = 
  if elem < 0 then failwith "Blad. Lista ma ujemne wartosci"
  else
    match acc with
    | 0 -> Koniec
    | _ -> Element(elem, replicateElem elem (acc-1))
;;

let rec replicate list = 
  match list with
  |Element (hd,tl) -> append (replicateElem hd hd) (replicate tl)
  |_ -> Koniec
;;

let list = (Element(1, Element(2, Element (3, Koniec))));;
replicate list;;

(* lazylist *)

let rec lappend list1 list2 = 
  match list1 with
  | LKoniec -> list2 
  | LElement (head, tail) -> LElement (head, function () -> lappend (tail()) list2)
;;

let rec lreplicateElem elem acc = 
  if elem < 0 then failwith "Blad. Lista ma ujemne wartosci"
  else
    match acc with
    | 0 -> LKoniec
    | _ -> LElement(elem, function () -> lreplicateElem elem (acc-1))
;;

let rec lreplicate list = 
  match list with
  |LElement (hd,tl) -> lappend (lreplicateElem hd hd) (lreplicate (tl()))
  |_ -> LKoniec
;;

let ll1 = LElement(1, function () -> LElement(2, function () -> LElement(3, function () -> LKoniec)));;
let test = lreplicate ll1;;

ltake (6, (test));;

