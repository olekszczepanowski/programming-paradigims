@main
def main(): Unit = {
  val lazyList1 = LazyList(5,6,3,2,1)
  val lazyList2= LazyList(1,2,3,4,5,6,7,8)
  val lazyList3= LazyList()
  val test1 = choose(lazyList1,2,1)
  val test2 = choose(lazyList2,3,2)
  val test3 = choose(lazyList3,2,3)

  println(test1.toList)
  println(test2.toList)
  println(test3.toList)
  // Wyrzucenie wyjatku dla zlej wartosci n
  //  val test4 = choose(lazyList1,0,3)
  //  println(test4.toList)

  // Wyrzucenie wyjatku dla zlej wartosci m
  //val test5 = choose(lazyList1, 2, -3)
  //  println(test4.toList)
}
class WrongValue extends Exception
def choose(list: LazyList[Int], n: Int, m: Int): LazyList[Int] = {
  if (n < 1)  throw new WrongValue
  else if (m < 0) throw new WrongValue
  else {
    val skippedList = skip(list, m-1)
    def chooseHelper(tmpList: LazyList[Int], tmp: Int): LazyList[Int] = {
      tmpList match {
        case LazyList() => LazyList.empty
        case h #:: tail =>
          if (tmp % n == 0) h #:: chooseHelper(tail, tmp + 1)
          else chooseHelper(tail, tmp + 1)
      }
    }
    chooseHelper(skippedList, 0)
  }
}

def skip(list: LazyList[Int], m: Int): LazyList[Int] = {
  if (m <= 0) list
  else list match {
    case LazyList() => LazyList.empty // Obsługa pustej listy
    case _ #:: tail => skip(tail, m - 1)
  }
}
