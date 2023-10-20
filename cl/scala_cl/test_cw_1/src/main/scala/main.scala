@main
def main(): Unit = {
  println("Hello world!")
  println("flatten test: "+(flatten(List(List(1,2,3),List(4,5)))))

  val myList = List(1, 2, 3, 2, 4, 2, 5, 2)
  val countOfTwos = count(2, myList)
  println("Count of 2s in the list: " + countOfTwos)
  val anotherList = List("a", "b", "a", "c", "a", "d", "a", "e")
  val countOfAs = count("a", anotherList)
  println("Count of 'a's in the list:" + countOfAs)

  val repList = replicate(3, 10)
  println(repList)

  val sqrtList = sqrList(myList)
  println(sqrtList)

  val isPalindrome = palindrome(repList)
  println(isPalindrome)

  val lenght = listLength(myList)
  println(lenght)
}
def flatten[A](xss: List[List[A]]): List[A] = {
  if xss!=Nil then xss.head:::flatten(xss.tail)
  else Nil
}
def count[A](x:A, xs:List[A]): Int = {
  if xs!=Nil
  then if xs.head == x then 1+count(x, xs.tail)
  else count(x, xs.tail)
  else 0
}
def replicate[A] (x: A, n: Int): List[A] = {
  if n>0 then
  x::replicate(x,n-1)
  else Nil
}

def sqrList(xs: List[Int]): List[Int] = {
  if xs!=Nil
    then xs.head*xs.head :: sqrList(xs.tail)
  else Nil
}
def palindrome[A] (xs: List[A]): Boolean = {
  if(xs.length<=1) then true
  else if (xs.head==xs.last) then palindrome(xs.tail.init)
  else false
}
def listLength[A](xs: List[A]): Int = {
  if xs!=Nil then
    1+listLength(xs.tail)
  else 0
}
