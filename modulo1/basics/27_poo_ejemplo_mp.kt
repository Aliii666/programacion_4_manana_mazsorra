class MecanicoTaller(val nombre: String, val codigo: String) {
    val nombreNormalizado: String
    val especialidad: String

    init {
        // Encapsulamiento en accion: validamos antes de construir
        require(nombre.isNotBlank()) { "El nombre no puede estar vacio" }
        require(codigo.contains("-")) { "Codigo invalido: $codigo" }

        nombreNormalizado = nombre.trim().lowercase()
        especialidad      = codigo.substringAfter("-")
    }
}

fun main() {
    val mecanico = MecanicoTaller("  Aliyha  ", "MEC-Frenos")
    println(mecanico.nombreNormalizado)  // aliyha
    println(mecanico.especialidad)       // Frenos

    // MecanicoTaller("", "invalido")   // IllegalArgumentException — require falla
}