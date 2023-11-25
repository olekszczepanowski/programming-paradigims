@main def main(): Unit = {
  val tree: BT[Int] = Node(1, Node(2, Empty[Int](), Node(3, Empty[Int](), Empty[Int]())), Empty[Int]())
  val testTree: BT[Int] = Node(1, Node(2, Node(4, Empty[Int](), Empty[Int]()), Empty[Int]()), Node(3, Node(5, Empty[Int](), Node(6, Empty[Int](), Empty[Int]())), Empty[Int]()))

  val resultTree: Int = tree_my(tree)
  val resultTestTree: Int = tree_my(testTree)

  println("Result for tree: " + resultTree)
  println("Result for testTree: " + resultTestTree)
}

sealed trait BT[A]
case class Empty[A]() extends BT[A]
case class Node[A](elem: A, left: BT[A], right: BT[A]) extends BT[A]

def tree_my(bt: BT[Int]): Int = bt match {
  case Empty() => 0
  case Node(v, l, r) => v + tree_my(l) + tree_my(r)
}


