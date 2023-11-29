import scala.annotation.tailrec

@main
def main(): Unit = {
  println(fib(5))
  println(fibTail(5))
  println(initSegment(List(1,2,3), List(1,2,3)))
  println(initSegment(List(1,2,3), List(1,3,3)))
  println(replaceNth(List(1,2,3,4,5), 2, 5))

}
//dziala
def fib(n:Int): Int = n match {
  case 0 => 0
  case 1 => 1
  case _ => fib (n-1) + fib (n-2)
}
def fibTail(n:Int): Int = {
  @tailrec
  def fibTailHelper(n:Int, curr: Int, prev: Int): Int = {
    n match {
      case 0 => prev
      case 1 => curr
      case _ => fibTailHelper(n-1,curr+prev,curr)
    }
  }
  fibTailHelper(n,1,0)
}
@tailrec
def initSegment[A](xs:List[A], ys:List[A]): Boolean = {
  (xs, ys) match {
    case (Nil,_) => true
    case (_,Nil) => false
    case _ => if xs.head == ys.head then initSegment(xs.tail,ys.tail)
    else false
  }
}

def replaceNth[A](xs:List[A], n:Int, x:A): List[A] = {
  (xs, n) match {
    case (Nil, _) => Nil
    case (_ :: tail, 0) => x :: tail
    case (head :: tail, _) => head :: replaceNth(tail, n - 1, x)
  }
}
