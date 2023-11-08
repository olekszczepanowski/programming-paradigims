@main
def main(): Unit = {
  val test1 = List(1.5, 2, -3)
  val test2 = List(-1000.4,50.25,22.75,0,1);
  val test3 = List()
  println("Task 1")

  println("Tests for list1:")
  println(processList(test1,squareElem))
  println(processList(test1,expElem))
  println(processList(test1,absElem))

  println("Tests for list2:")
  println(processList(test2, squareElem))
  println(processList(test2, expElem))
  println(processList(test2, absElem))

  println("Tests for list3:")
  println(processList(test3, squareElem))
  println(processList(test3, expElem))
  println(processList(test3, absElem))

  println("Task3")
  println("Tests for id:")
  println(sum(1,3,id))
  println(sum(1,10,id))
  println(sum(4,0,id))
  println(sum(1,1,id))
  println("Tests for cubes:")
  println(sum(1, 3, cubes))
  println(sum(1, 10, cubes))
  println(sum(4, 0, cubes))
  println(sum(1, 1, cubes))
  println("Tests for factorial:")
  println(sum(1, 3, fact))
  println(sum(1, 10, fact))
  println(sum(4, 0, fact))
  println(sum(1, 1, fact))





}
def processList(list: List[Double], function: Double => Double): List[Double] = {
  list match {
    case Nil => List()
    case head :: tail => function(head) :: processList(tail, function)
  }
}

val squareElem = (x: Double) => x * x

val absElem = (x: Double) => if (x < 0) x * -1 else x

val expElem = (x: Double) => Math.exp(x) - 1

//Task3

def sum(a: Int, b: Int, function: Int => Int): Int = {
  if (a>b) 0 else  function(a) + sum((a+1),b,function)
}

val id = (x: Int) => x

val cubes = (x: Int) => x*x*x;

def fact(x: Int): Int = if (x < 1) 1 else x * fact(x - 1)

