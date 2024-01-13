(* Task 1 *)

module Equation =
struct
  type solution =
    | Zero
    | One of float
    | Two of (float * float)

  let solve a b c =
    if a = 0.0 then failwith "Zle parametry. To nie jest rownanie kwadratowe!"
    else let delta = b *. b -. 4.0 *. a *. c in
      if delta < 0.0 then Zero
      else if delta = 0.0 then One (-.b /. 2.0 *. a)
      else
        let sqrtD = sqrt(delta)in
        Two ((-.b +. sqrtD) /. (2.0 *. a), (-.b -. sqrtD) /. (2.0 *. a))
end

let main =
  let a = 0.
  and b = 1.
  and c = (-2.) in
  match Equation.solve a b c with
  | Zero -> print_endline "Brak rozwiazan"
  | One x -> print_endline ("Jedno rozwiazanie: " ^ string_of_float x)
  | Two (x0, x1) -> print_endline ("Dwa rozwiazania: " ^ string_of_float x0 ^ " i " ^ string_of_float x1)

(* Task 2 *)

module ListOperation =
struct
  
  let empty = []

  let rec length lst = 
    match lst with
    |[] -> 0
    |_::tl -> 1 + length tl
  
  let isEmpty lst = lst = []

  let sum lst = List.fold_left (+) 0 lst

  let rec filterEven lst =
    match lst with
    | [] -> []
    | hd::tl -> (if hd mod 2 = 0 then hd :: (filterEven tl) 
    else filterEven tl)

  let rec splitIntoPairs lst = 
    match lst with
    | [] -> ([],[])
    | hd::tl -> (let even, odd = splitIntoPairs tl in
    if hd mod 2 = 0 then
      (hd :: even, odd)
    else
      (even, hd :: odd))

end

let example_list =  [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

let empty_list = ListOperation.empty

let length_list = ListOperation.length example_list

let isEmptyList = ListOperation.isEmpty example_list 

let sum_list = ListOperation.sum example_list 

let even_numbers = ListOperation.filterEven example_list 

let (even_pairs, odd_pairs) = ListOperation.splitIntoPairs example_list


(* Task 3 *)

module TupleOperations = 
struct
  let elementCount (a,b,c) = b

  let sumElement (a,b,c) = a + b + c 

  let map func (a,b,c) = (func a, func b, func c)

  let minMax (a,b,c) = 
    let minValue = min (min a b) c in
    let maxValue = max (max a b) c in
    (minValue, maxValue)

  let allNegative (a,b,c) = 
     (a<0 && b<0 && c<0)
end

let example_tuple = (1, -2, 3)
let second_element = TupleOperations.elementCount example_tuple
let sum_of_elements = TupleOperations.sumElement example_tuple
let mapped_tuple = TupleOperations.map (fun x -> x * 2) example_tuple
let min_max_tuple = TupleOperations.minMax example_tuple
let are_all_negative = TupleOperations.allNegative example_tuple


