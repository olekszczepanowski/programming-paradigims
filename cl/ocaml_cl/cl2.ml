let rec fib n = 
  match n with
  | 0 -> 0
  | 1 -> 1
  | _ -> fib (n-1) + fib (n-2)
;;

let rec fibTailHelper n curr prev =
  match n with
  | 0 -> prev
  | 1 -> curr
  | _ -> fibTailHelper (n-1) (curr+prev) curr
;;

let rec fibTail n = 
  let rec fibTailHelper n curr prev =
    match n with
    | 0 -> prev
    | 1 -> curr
    | _ -> fibTailHelper (n-1) (curr+prev) curr
  in fibTailHelper n 1 0
;;

let rec initSegment xs ys =
  match xs,ys with 
  | ([],_) -> true
  | (_,[]) -> false
  | (h1::tl1,h2::tl2) -> if h1 = h2 then initSegment tl1 tl2 else false;;


let rec replaceNth xs n x = 
  match (xs,n) with 
    | ([],_) -> [x]
    | (_::tail, 0) -> x::tail
    | (head::tail, _) -> head::replaceNth tail (n-1) x
  ;;

  let resultFib = fib 5;;
let resultFibTail = fibTail 5;;
let resultIS1 = initSegment [] [1; 2; 3; 4] ;;
let resultIS2 = initSegment [1;2;3] [1;2;3];;
let list = [1;2;3;4;5];;
let resultRN = replaceNth list 2 5;;