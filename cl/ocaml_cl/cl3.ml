(* zad1 *)
let f1 x = x 2 2;; 
(* (int -> int -> 'a) -> 'a = <fun> *) 
(* to bedzie funkcja typu dowolnego *)
let f2 x y z = x ( y ^ z );;
(* (string -> 'a) -> string -> string -> 'a = <fun> *)
(* to bedzie funkcja typu string *)

(* zad2 *)
(* Z lukrem syntaktycznym *)
let lcurry3 f x y z = f(x,y,z);;
let plus (x,y,z) = x+y+z;;
lcurry3 plus 4 5 1;;
let luncurry3 f (x,y,z)= f x y z;;
let add x y z = x+y+z;;
luncurry3 add (4,5,1);;

(* bez lukru syntatkycznego *)
let curry3 = fun f -> fun (x,y,z) -> f x y z;;
let uncurry3 = fun f -> fun x -> fun y -> fun z -> f(x,y,z);;

(* to sa dowolne typy *)

(* zad3 *)
let sumProd xs = List.fold_left (fun(sum,prod) x -> (sum+x,sum*x)) (0,1) xs;;
sumProd [1;2;3;4];;

(* zad4 *)
(* W implementacji a), niepoprawnie tworzone są listy small i large
, a w implementacji b) błąd polega na przekazaniu nieprawidłowego argumentu do funkcji quicksort. *)

(* zad5 *)
let rec quicksort = function
  | [] -> [] 
  | [x] -> [x]
  | x :: xs ->
    let small = List.filter (fun y -> y < x) xs in 
    let large = List.filter (fun y -> y >= x) xs in
    quicksort small @ [x] @ quicksort large


quicksort [4;2;3;8;9];;