import scala.annotation.tailrec

@main def main(): Unit = {
  val tree1: BT[Int] = Node(1, Node(2, Empty(), Node(3, Empty(), Empty())), Empty())
  val tree2: BT[Int] = Node(1, Node(2, Node(4, Empty(), Empty()), Empty()), Node(3, Node(5, Empty(),
    Node(6, Empty(), Empty())), Empty()))
  val tree3: BT[Int] = Node(0,Empty(),Empty())
  val result1: Int = tree_my(tree1)
  val result2: Int = tree_my(tree2)
  val result3: Int = tree_my(tree3)

  println("Result for tree1: " + result1)
  println("Result for tree2: " + result2)
  println("Result for tree3: " + result3)

}

sealed trait BT[A]
case class Empty[A]() extends BT[A]
case class Node[A](elem: A, left: BT[A], right: BT[A]) extends BT[A]

@tailrec
def tree_myHelper(bt: List[BT[Int]], acc: Int): Int = bt match {
  case Nil => acc
  case Node(value,left,right) :: tail => tree_myHelper(left::right::tail, value+acc)
  case Empty() :: tail => tree_myHelper(tail,acc)
}

def tree_my(bt: BT[Int]): Int = {
  tree_myHelper(List(bt),0)
}


