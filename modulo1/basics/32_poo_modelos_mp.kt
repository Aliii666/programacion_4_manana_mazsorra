data class Carro(
    val id:          Int,
    val placa:       String,
    val kilometraje: Double,
    val tipoServicio: String,
    val activo:      Boolean = true
)

fun main() {
    val c1 = Carro(1, "ABC-1234", 85000.0, "Cambio de aceite")
    val c2 = Carro(1, "ABC-1234", 85000.0, "Cambio de aceite")
    val c3 = Carro(2, "XYZ-5678", 120000.0, "Revision de frenos")

    // toString() automatico
    println(c1)  // Carro(id=1, placa=ABC-1234, ...)

    // equals() por valor
    println(c1 == c2)   // true
    println(c1 == c3)   // false

    // copy() — nuevo objeto con cambios puntuales
    val carroNuevo    = c1.copy(kilometraje = 12000.0)
    val carroInactivo = c1.copy(activo = false)

    // Desestructuracion
    val (id, placa, kilometraje) = c1
    println("$id: $placa — $kilometraje km")

    // En bucles
    listOf(c1, c3).forEach { (id2, placa2, km2) ->
        println("[$id2] $placa2: $km2 km")
    }
}