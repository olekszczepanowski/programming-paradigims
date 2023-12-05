@main
def main(): Unit = {
  val lazyList1 = 5 #:: 6 #:: 3 #:: 2 #:: 1 #:: Stream.empty
  val lazyList2=  1 #:: 2 #:: 3 #:: 4 #:: 5 #:: 6 #:: 7 #:: 8 #:: Stream.empty
  val lazyList3= Stream.empty
  val test1 = choose(lazyList1,2,1)
  val test2 = choose(lazyList2,3,2)
  val test3 = choose(lazyList3,2,3)

  println(test1.toList)
  println(test2.toList)
  println(test3.toList)

  val test4 = choose(lazyList1,0,3)
  val test5 = choose(lazyList1, 2, -3)

}
class WrongValue extends Exception
def choose(list: Stream[Int], n: Int, m: Int): Stream[Int] = {
  if (n < 1)  throw new WrongValue
  else if (m < 1) throw new WrongValue
  else {
    val skippedList = skip(list, m-1)
    def chooseHelper(tmpList: Stream[Int], tmp: Int): Stream[Int] = {
      tmpList match {
        case Stream() => Stream.empty
        case h #:: tail =>
          if (tmp % n == 0) h #:: chooseHelper(tail, tmp + 1)
          else chooseHelper(tail, tmp + 1)
      }
    }
    chooseHelper(skippedList, 0)
  }
}

def skip(list: Stream[Int], m: Int): Stream[Int] = {
  if (m <= 0) list
  else list match {
    case Stream() => Stream.empty
    case _ #:: tail => skip(tail, m - 1)
  }
}
