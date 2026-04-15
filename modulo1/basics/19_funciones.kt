// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
    println("Funciones")
    val saludo = saludar()
    println(saludo)
    val suma = sumar(5, 4)
    println(suma)
    println(restarTipoExpresion(5,3))
    println(restarTipoInferido(5,3))
    saludar("Pedro")
}

fun saludar(): String {
    return "Hello desde una funcion"
}

fun sumar(a: Int, b: Int): Int {
    return a + b
}

//tipo expresion
fun restarTipoExpresion(a: Int, b:Int): Int = a - b
fun restarTipoInferido(a: Int, b:Int) = a - b


fun saludar(nombre: String){
    println("Hola $nombre")
}