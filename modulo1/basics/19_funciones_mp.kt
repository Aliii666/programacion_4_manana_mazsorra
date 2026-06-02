fun main() {
    println("Taller Mecanico - Funciones del Sistema")
    
    val bienvenida = bienvenida()
    println("$bienvenida")
    
    val costoTotal: Int = calcularCosto(5, 4)
    println(costoTotal)
    
    println(restarTipoExpresion(5, 3))
    println(restarTipoInferido(5, 3))
    
    registrarCarro("Taller Mecanico Aliyha")
}

fun bienvenida(): String {
    return "Bienvenido al Sistema del Taller Mecanico"
}

fun calcularCosto(a: Int, b: Int): Int {
    return a + b
}

// Tipo expresion
fun restarTipoExpresion(a: Int, b: Int) = a - b
// Inferido
fun restarTipoInferido(a: Int, b: Int) = a - b

fun registrarCarro(taller: String) {
    println("Registrando carro en $taller")
}