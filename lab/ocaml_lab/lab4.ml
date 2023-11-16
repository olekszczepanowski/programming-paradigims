(* Task1 *)
let sumList list = List.fold_left (+) 0 list;;

let filterSum list value = 
  List.filter(fun sublist -> sumList sublist == value) list;;



(* Tests *)
let fs_list1 = [[1; 2; 12]; [4; 5; 6]; [7; 8; 9]; [10; 11; 12]];;
  
let fs_result1 = filterSum fs_list1 15;;
  