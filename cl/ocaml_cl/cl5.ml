type 'a llist = LNil | LCons of 'a * (unit -> 'a llist);;

let rec ltake (n, lxs) = 
  match (n,lxs) with
  | (0,_) -> []
  | (_, LNil) -> []
  | (n, LCons(x,xf)) -> x::ltake((n-1), xf());;

let rec toLazyList xs =
  match xs with
  [] -> LNil
  | h::t -> LCons(h, function () -> toLazyList t);;

(* zad1 *)

let lrepeat (x, lxs) =
  let rec repeatHelper (count, lList) =
      match (count, lList) with
      | (_, LNil) -> LNil
      | (0, LCons(_, tail)) -> repeatHelper (x, tail())
      | (_, LCons(head, _)) -> LCons( head, function () -> repeatHelper(count - 1, lList))
  in repeatHelper (x, lxs);;

  ltake(9, lrepeat(3, toLazyList[1; 2; 3]));;
  ltake(6, lrepeat(2, toLazyList['a'; 'b'; 'c'])) = ['a'; 'a'; 'b'; 'b'; 'c'; 'c'];;

(* zad2 *)
let lfib = 
  let rec fibHelper (last, oneBefore) = 
    LCons(oneBefore, function () -> fibHelper (last+oneBefore, last))
  in fibHelper (1, 0);;

  ltake(4, (lfib));