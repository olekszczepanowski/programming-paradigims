@main
def main(): Unit = {
  println("Hello world!")
  var x = true;
  var y = true
  println(and(x,y))
  println(nonrecursiveFact(4))
  println(fact(4))
}
def and(x: Boolean, y: Boolean) : Boolean = {
  (x,y) match
  case (true,true) => true
  case _ => false
}

def nonrecursiveFact (n:Int) = {
  if n>0 then n * fact(n-1)
  else 1
}
def fact (n: Int): Int = {
  if n>0 then helper(n,1)
  else 1
}

def helper (tmp: Int, acc: Int): Int = {
  (tmp,acc) match
    case (1, rest) => rest
    case (x, rest) => helper (x-1, rest*x)
}