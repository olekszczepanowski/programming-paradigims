(* zad1 *)
let f1 x y z = x y z;; 
(* dowolny typ *)
let f2 x y = function z -> x::y;;
(* typ a' list *)

(* zad3 *)
type 'a bt = Empty | Node of 'a * 'a bt * 'a bt;;
let tt = Node(1,
 Node(2,
 Node(4,
 Empty,
Empty
 ),
 Empty
 ),
 Node(3,
 Node(5,
 Empty,
Node(6,
 Empty,
Empty
 )
 ),
 Empty
 )
 );; 

 let rec breathBT bt =
  let rec bfsHelper queue =
    match queue with
    | [] -> []
    | Node (v, l, r)::rest ->
        v :: bfsHelper (rest @ [l; r])  
    | Empty::rest -> bfsHelper rest  
  in
  bfsHelper [bt]
;;

let result = breathBT tt;;

(* Zad4 *)

let inner_path bt = 
  let rec pathingHelper bt acc = 
    match bt with
    | Empty -> failwith "empty"
    | Node(_, Empty, Empty) -> acc
    | Node(_, l, Empty) -> acc + (pathingHelper l (acc + 1))
    | Node(_, Empty, r) -> acc + (pathingHelper r (acc + 1))
    | Node(_, l, r) -> acc + (pathingHelper l (acc + 1) + pathingHelper r (acc + 1))
  in 
  pathingHelper
   bt 0;;

inner_path tt;;

let outer_path bt = 
  let rec pathingHelper
   bt acc = 
    match bt with
    | Empty -> acc
    | Node(_, Empty, Empty) -> 2 * (acc + 1)
    | Node(_, l, Empty) -> (acc + 1) + (pathingHelper l (acc + 1))
    | Node(_, Empty, r) -> (acc + 1) + (pathingHelper r (acc + 1))
    | Node(_, l, r) -> pathingHelper
     l (acc + 1) + pathingHelper
     r (acc + 1)
  in 
  pathingHelper
   bt 0
  ;;

outer_path tt;;
  

(* zad5 *)
type 'a graph = Graph of ('a -> 'a list)

let g = Graph
(function
0 -> [3]
| 1 -> [0;2;4]
| 2 -> [1]
| 3 -> []
| 4 -> [0;2]
| n -> failwith ("Graph g: node "^string_of_int n^" doesn't exist")
);;
let breadthSearch (Graph succ) startNode =
  let rec search visited queue =
  match queue with
  [] -> []
  | h::t -> if List.mem h visited then search visited t
  else h :: search (h :: visited) (t @ succ h)
  in search [] [startNode];;

  breadthSearch g 4;; 