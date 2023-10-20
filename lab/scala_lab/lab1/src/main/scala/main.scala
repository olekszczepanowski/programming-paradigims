@main
def main(): Unit = {
  println("Test sumy: ")
  println(suma(List(1,2,2.5)))
  println(suma(List(3.5,2.25,2.5)))
  println(suma(List(8,8,0.5,0,12)))

  println()
  println("Test dla łączenia")
  val lista1 = List("ala","ma","kota")
  val lista2 = List("ala")
  val pustaLista = List()
  println(polacz(lista1,""))
  println(polacz(lista2,""))
  println()
  println("Test dla pustych list:")
  println(suma(pustaLista))
  println(polacz(pustaLista,""))
}
def suma(xs:List[Double]): Double = {
  if(xs.nonEmpty) then xs.head+suma(xs.tail)
  else 0.0
}
def polacz(xs:List[String],x: String): String = {
  if(xs.nonEmpty) then
  if(xs.length>1) then xs.head+x+polacz(xs.tail,x)
  else xs.head
  else "Lista jest pusta"
}