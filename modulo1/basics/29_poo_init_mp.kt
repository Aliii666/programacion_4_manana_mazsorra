class Vehiculo(val placa: String, val propietario: String) {
    val placaNormalizada: String
    val marcaPropietario: String

    init {
        // Validamos antes de registrar el vehículo
        require(placa.isNotBlank())      { "La placa no puede estar vacía" }
        require(propietario.isNotBlank()) { "El nombre del propietario no puede estar vacío" }
        require(placa.length >= 6)        { "Placa inválida: $placa" }

        placaNormalizada  = placa.trim().uppercase()
        marcaPropietario  = propietario.trim().lowercase()
    }
}

fun main() {
    System.setOut(java.io.PrintStream(System.out, true, "UTF-8"))

    val v = Vehiculo("  abc-1234  ", "  Carlos Ramírez  ")
    println("Placa normalizada  : ${v.placaNormalizada}")   // ABC-1234
    println("Propietario        : ${v.marcaPropietario}")   // carlos ramírez

    println()

    // Casos que lanzan excepción — el init protege el objeto
    try {
        Vehiculo("", "Carlos Ramírez")          // placa vacía
    } catch (e: IllegalArgumentException) {
        println("Error: ${e.message}")
    }

    try {
        Vehiculo("AB", "Carlos Ramírez")        // placa muy corta
    } catch (e: IllegalArgumentException) {
        println("Error: ${e.message}")
    }

    try {
        Vehiculo("ABC-1234", "")                // propietario vacío
    } catch (e: IllegalArgumentException) {
        println("Error: ${e.message}")
    }
}