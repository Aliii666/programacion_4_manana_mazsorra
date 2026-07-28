fun main() {
    println("Taller Mecanico - Funciones con Parametros por Defecto: Registro de Mecanicos")
    println(crearMecanico("Jhon", 25, "supervisor", true))
    println(crearMecanico("Luis"))
    println(crearMecanico("Maria", 30))
    println(crearMecanico("Juan", 30, "supervisor"))
    // Argumentos nombrados
    println(crearMecanico(experiencia = 30, nombre = "Aliyha", activo = false))
}

fun crearMecanico(
    nombre: String,
    experiencia: Int = 18,
    cargo: String = "mecanico",
    activo: Boolean = true
): String {
    return "MecanicoTaller[$nombre, experiencia=$experiencia años, cargo=$cargo, activo=$activo]"
}