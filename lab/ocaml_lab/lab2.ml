let rec polacz lista1 lista2 = 
 match lista1 with
 | [] -> lista2
 | hd::lista1 -> hd::polacz lista2 lista1;;

(* let rec podziel lista = 
    match lista with 
| [] -> ([],[])
| hd::tl when hd mod 2 = 0 -> let (even, odd) = podziel tl in (hd::even, odd)
| hd::tl -> let (even, odd) = podziel tl in (even, hd::odd)
  ;; *)

  let rec podziel lista = 
    match lista with 
    | [] -> ([],[])
    | hd::tl -> 
        (match hd mod 2 with
        | 0 -> let (even, odd) = podziel tl in (hd::even, odd)
        | _ -> let (even, odd) = podziel tl in (even, hd::odd))
  ;;


  let testp1 = polacz [1;2;3] [4;5;6];;
  let testp2 = polacz [5;4;3;2] [1;2;3;4;5;6];;
  let testp3 = polacz [][];;
  let testp4 = polacz [1;2][];;
  let testp5 = polacz [][1;2];;

  let testp6 = polacz [[1;2];[3;4]]  [[1;2];[3;4]];;

  let testpod1 = podziel [1;2;3];;
  let testpod2 = podziel [1;1;1;1;1;1];;
  let testpod3 = podziel [2;2;2;4;4;4];;
  let testpod4 = podziel [];;
