@main
def main(): Unit = {
  println("Hello world!")
  val testList = List(1, 2, 3, 2, 4, 2, 5, 2)
  val testList_2 = List(1,"Hello world",true,1.5,1,"Hello world",true,1.5,1,"Hello world",true,1.5)
  val emptyList = List()
  val oneElemList = List(1)
  val twoLists = List(List(1,2),List(1,2))
  println("Testy dla funkcji z if:")
  println(listLength(testList))
  println(listLength(testList_2))
  println(listLength(emptyList))
  println(listLength(oneElemList))
  println(listLength(twoLists))
  println("--------")
  println("Testy dla funkcji z match:")
  println(listLengthWithMatch(testList))
  println(listLengthWithMatch(testList_2))
  println(listLengthWithMatch(emptyList))
  println(listLengthWithMatch(oneElemList))
  println(listLengthWithMatch(twoLists))

}
def listLength[A](xs: List[A]): Int = {
  if xs!=Nil then
    1+listLength(xs.tail)
  else 0
}
def listLengthWithMatch[A](xs: List[A]): Int = xs match
  case Nil => 0
  case _ :: tail => 1+listLengthWithMatch(tail)
