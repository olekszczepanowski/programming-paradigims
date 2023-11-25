type eval = Num of float | Add | Sub | Mul | Div

let rec eval expression stack =
  match expression with
  | [] -> List.hd stack
  | Num n :: tail -> eval tail (n :: stack) 
  | Add :: tail ->
      (match stack with
      | x :: y :: stack_tail -> eval tail ((y +. x) :: stack_tail) 
      | _ -> failwith "Blad w dodawnaniu")
  | Sub :: tail ->
      (match stack with
      | x :: y :: stack_tail -> eval tail ((y -. x) :: stack_tail) 
      | _ -> failwith "Blad w odejmowaniu")
  | Mul :: tail ->
      (match stack with
      | x :: y :: stack_tail -> eval tail ((y *. x) :: stack_tail) 
      | _ -> failwith "Blad w mnozeniu")
  | Div :: tail ->
    (match stack with
    | x :: y :: stack_tail ->
        if x = 0.0 then
          failwith "Dzielenie przez zero!"
        else
          eval tail ((y /. x) :: stack_tail) 
    | _ -> failwith "Blad dla dzielenia")

    (* Przykład użycia *)
let expression1 = [Num 5.0; Num 3.0; Add; Num 2.0; Mul];;
let expression2 = [Num 16.0; Num 0.0 ; Div];;
let expression3 = [Num 5.0; Num 6.0; Sub];;
let expression4 = [Num 5.0; Mul];;
let result1 = eval expression1 [];;
let result2 = eval expression2 [];;
let result3 = eval expression3 [];;
let result4 = eval expression4 [];;


