@main
def main(): Unit = {
  val lista = LazyList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  val skipList = skipM(lista,4)
  println(skipList.toList)
}


def skipM(list: LazyList[Int], count: Int): LazyList[Int] = {
  if (count <= 0) list
  else list match {
    case LazyList() => LazyList.empty // Obsługa pustej listy
    case _ #:: tail => skipM(tail, count - 1)
  }
}
