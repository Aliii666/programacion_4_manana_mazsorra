

fun main() {
  println("Controles de Flujo")
  println("Condicional If - Multiples Condicionales")
  println("Presion sistolica mmHg")
  val sistolica=readLine()?.toIntOrNull()?:0
  
  val clasificacion= if(sistolica<=90){
      "Hipotension"
  } else if(sistolica<=119){
      "Normal"
  } else if(sistolica<=119){
      "Elevada"
  } else if(sistolica<=119){
      "Hipertension Grado 1"
  } else if(sistolica<=119){
      "Hipertension Grado 2"
  } else {
      "Crisis Hipertensiva"
  }
  
  println("Clasificacion: $clasificacion")
}