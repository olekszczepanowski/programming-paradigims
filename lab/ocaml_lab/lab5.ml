type eval = Num of float | Add | Sub | Mul | Div;;
let expressionError = "Blad w wyrazeniu";;
let divisionError = "Blad. Dzielenie przez 0";;

let eval expression =
  let rec evalHelper expression stack =
    match expression, stack with
    | [], result :: _ -> result
    | Num n :: expressionTail, _ -> evalHelper expressionTail (n :: stack)
    | Add :: expressionTail, x :: y :: stack_tail -> evalHelper expressionTail ((x +. y) :: stack_tail)
    | Sub :: expressionTail, x :: y :: stack_tail -> evalHelper expressionTail ((x -. y) :: stack_tail)
    | Mul :: expressionTail, x :: y :: stack_tail -> evalHelper expressionTail ((x *. y) :: stack_tail)
    | Div :: expressionTail, x :: y :: stack_tail ->
        if y = 0.0 then failwith divisionError
        else evalHelper expressionTail ((x /. y) :: stack_tail)
    | _ :: _, _ -> failwith expressionError
    | _, [] -> failwith expressionError
  in
  evalHelper expression [];;

let expression1 = [Num 5.0; Num 3.0; Add; Num 2.0; Add];;
let expression2 = [Num 0.0; Num 16.0 ; Div];;
let expression3 = [Num 5.0; Num 6.0; Sub];;
let expression4 = [Num 5.0; Mul];;
let expression5 = [Num 72.; Num 3.; Add; Num 2.; Num 1.; Div; Add; Num 10.; Mul];;
let expression6 = [Num 5.; Num 6.; Add; Num 7.;Sub];;
let result1 = eval expression1 ;;
let result2 = eval expression2 ;;
let result3 = eval expression3 ;;
let result4 = eval expression4 ;;
let result5 = eval expression5 ;;
let result6 = eval expression6 ;;
let result7 = eval [];;
let result8 = eval [Div];;
let result9 = eval [Num 5.; Num 3.; Num 4.; Add; Num 5. ; Add];;