type 'a nlist = Koniec | Element of 'a * ('a nlist);;
type 'a llist = LKoniec | LElement of 'a * (unit -> 'a llist);;

let lhd = function 
  |LKoniec -> failwith "lhd"
  |LElement(x,_) -> x
;;

let ltl = function 
  |LKoniec -> failwith "ltl"
  |LElement(_,xf) -> xf ()
;;

let rec obliczenie op list1 list2 = 
  let result a b = 
    match op with
    | '+' -> a+b
    | '-' -> a-b
    | '*' -> a*b

let rec ldzialanie op list1 list2 = 
  match (list1,list2) with 
  |