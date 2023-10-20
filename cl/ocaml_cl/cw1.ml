let rec count (x, xss) =
  if xss = [] then 0
  else (if List.hd xss = x then 1 else 0) + count (x, List.tl xss);;

let rec replicate x n =
  if n=0 then []
  else x :: replicate x (n-1) ;;

let rec sqrList xs = 
  if xs = [] then []
  else List.hd xs * List.hd xs :: sqrList (List.tl xs);;

let rec palindrome xs = 
  List.rev xs = xs;;

let rec listLength xs = 
  if xs = [] then 0 
  else 1+listLength(List.tl xs);;


let testCount = count (1, [1;2;3;1;3;5]);;
let testReplicate = replicate 3 10;; 
let testSqr = sqrList [1;2;3;4];;
let testPalindrome = palindrome[1;1;1;1];;
let testListLength = listLength[1;1;1;1];; 

