type 'a nlist = Koniec | Element of 'a * ('a nlist);;
type 'a llist = LKoniec | LElement of 'a * (unit -> 'a llist);;
let operatorError = "Operator error.";;

let operator a b op = 
    match op with
    | "+" -> b-a
    | "-" -> b-a
    | "*" -> b*a
    | _ -> failwith operatorError
;;

let rec dzialanie list1 list2 op = 
  match (list1,list2) with
  | (Element (h1,t1), Element (h2,t2)) -> begin
    let result = operator h1 h2 op in
    Element (result, dzialanie t1 t2 op)
  end
  | (Element (h1,t1), Koniec) -> begin
    let result = operator h1 0 op in
    Element(result, dzialanie t1 Koniec op)
  end
  | (Koniec, Element (h2,t2)) -> begin
    let result = operator 0 h2 op in
    Element(result, dzialanie Koniec t2 op)
  end
  | (Koniec,Koniec) -> Koniec
;;

let rec ltake = function 
(0, _) -> []
|(_,LKoniec) -> []
|(n,LElement(x,xf)) -> x::ltake(n-1,xf())
;;

let rec ldzialanie list1 list2 op = 
  match (list1,list2) with
  | (LElement (h1,t1), LElement(h2,t2)) -> begin
    let result = operator h1 h2 op in
    LElement(result, function () -> ldzialanie (t1 ()) (t2 ()) op)
  end
  | (LElement (h1,t1), LKoniec) -> begin
    let result = operator h1 0 op in
    LElement(result, function () -> ldzialanie (t1 ()) LKoniec op)
  end
  | (LKoniec, LElement (h2,t2)) -> begin
    let result = operator 0 h2 op in
    LElement(result, function () -> ldzialanie LKoniec (t2 ()) op)
  end
  | (LKoniec,LKoniec) -> LKoniec
;;

(* Testy *)

let result1 = dzialanie (Element(1, Element(2,Element(3,Koniec)))) (Element(1, Element(2,Element(3,Koniec)))) "+";;
let result2 = dzialanie (Element(1, Element(2,Element(3,Koniec)))) (Element(2,Element(3,Element(4,Element(5,Koniec))))) "*";;
let result3 = dzialanie (Element(1, Element(2,Element(3,Element(4,Koniec))))) (Element(2,Element(3,Element(4,Koniec)))) "-";;
let result4 = dzialanie Koniec Koniec "+";;
let result5 = dzialanie (Element(1, Element(2,Element(3,Koniec)))) (Element(1, Element(2,Element(3,Koniec)))) "/";;

let ll1 = LElement(1, function () -> LElement(2, function () -> LElement(3, function () -> LKoniec)));;
let ll2 = LElement(2, function () -> LElement(3, function () -> LElement(4, function () -> LElement(5, function () -> LKoniec))));;
let emptyll = LKoniec;;
let lresult1 = ldzialanie ll1 ll2 "+";;
let lresult2 = ldzialanie ll1 ll2 "-";;
let lresult3 = ldzialanie ll1 ll2 "*";;
let lresult4 = ldzialanie emptyll emptyll "+";;
let lresult5 = ldzialanie ll1 ll2 "/";;
ltake (4, (lresult1));;
ltake (4, (lresult2));;
ltake (4, (lresult3));;
ltake(1, (lresult4));;


