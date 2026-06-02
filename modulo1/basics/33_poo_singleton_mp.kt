object ConfiguracionTaller {
    val nombre:    String = "Taller Mecanico Aliyha"
    val telefono:  Int    = 2234567
    private val claveAcceso: String = "taller-secreto-123"   // privado — nunca expuesto

    fun infoTaller() = "$nombre - Tel: $telefono"
    fun credenciales() = mapOf("Acceso" to "Bearer $claveAcceso")
}

class Cliente private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        // Factory function — encapsulamiento del constructor
        fun crear(nombre: String, email: String): Cliente? {
            if (nombre.isBlank() || !email.contains("@")) return null
            return Cliente(++contadorId, nombre.trim())
        }

        const val ROL_DEFECTO = "cliente"
    }
}

fun main() {
    println(ConfiguracionTaller.infoTaller())  // Taller Mecanico Aliyha - Tel: 2234567
    // ConfiguracionTaller.claveAcceso         // ERROR — privado

    val cliente = Cliente.crear("Aliyha", "aliyha@taller.com")
    println(cliente)  // Cliente(id=1, nombre=Aliyha)
}