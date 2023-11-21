(* Task1 *)
(* let sumList list = List.fold_left (+) 0 list;;
let filterSum list value = 
  List.filter(fun sublist -> sumList sublist == value) list;; *)

  let sumList list = List.fold_left (+) 0 list;;
  let rec filterSum acc list value =
    match list with
    | [] -> acc
    | hd::tl ->
      let sum = sumList hd in
      if sum = value then
        filterSum (hd::acc) tl value
      else
        filterSum acc tl value;;
  


(* Task2 *)
let rec hexadecimalHelper value acc = 
  if value = 0 then acc
  else 
    let remainder = value mod 16 in
    let newValue = value / 16 in
    hexadecimalHelper newValue (remainder::acc);;

let filterHexadecimal value = 
  if value>0 then hexadecimalHelper value []
  else if value = 0 then [0] 
  (* when value is negative return -1 *)
  else [-1];;

(* Task3 *)
(* let filterTuples list = 
  let tuplesHelper = function (a,b,c,d) -> a^b^c^d in
  List.map tuplesHelper list;; *)

let filterTuples list =
  let rec tuplesHelper acc tuplesList = 
      match tuplesList with
      | [] -> List.rev acc
      | (a, b, c, d) :: tail -> tuplesHelper ((a ^ b ^ c ^ d) :: acc) tail
  in
  tuplesHelper [] list;;



(* Tests *)
let fs_list1 = [[1; 2; 12]; [4; 5; 6]; [7; 8; 9]; [10; 11; 12]];;
let fs_list2 = [[0;0];[-1;1]];;
let fs_list3 = [[1; -2; -2]; [-1;-1;-1]; [4; 5; 6]; [7; 8; 9]; [10; 11; 12]];;
let fs_list4 = [[];[]];;
let fs_result1 = filterSum fs_list1 15;;
let fs_result2 = filterSum fs_list2 0;;
let fs_result3 = filterSum fs_list3 (-3);;
let fs_result4 = filterSum fs_list4 0;;

let hx_result1 = filterHexadecimal 31;;
let hx_result2 = filterHexadecimal 110;;
let hx_result3 = filterHexadecimal 1314;;
let hx_result4 = filterHexadecimal (-5);;
let hx_result5 = filterHexadecimal (-132);;
let hx_result6 = filterHexadecimal 0;;

let fs_list1 = [[1; 2; 12]; [4; 5; 6]; [7; 8; 9]; [10; 11; 12]];;
let fs_list2 = [[0;0];[-1;1]];;
let fs_list3 = [[1; -2; -2]; [-1;-1;-1]; [4; 5; 6]; [7; 8; 9]; [10; 11; 12]];;
let fs_list4 = [[];[]];;
let fs_result1 = filterSum [] fs_list1 (-1);;
let fs_result2 = filterSum [] fs_list2 0;;
let fs_result3 = filterSum [] fs_list3 (-3);;
let fs_result4 = filterSum [] fs_list4 0;;

let tupResult1 = filterTuples([("ala","ma","kot","a");("kot","nie","ma","ali")]);;
let tupResult2 = filterTuples([("ala","ma","kot");("kot","nie","ma","ali")]);;
let tupResult3 = filterTuples([("abcdefg","hijkl","mnopqrs","tuvwxyz");("","","","");("O","L","E","K")]);;

