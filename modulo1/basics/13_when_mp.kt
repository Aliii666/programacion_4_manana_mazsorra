fun main() {
    println("Controles de Flujo - Taller Mecanico")
    println("Escriba el codigo del servicio: ")
    val codigo = readLine()?.toIntOrNull() ?: 0
    
    val servicio = when(codigo) {
        1 -> "Cambio de aceite"
        2 -> "Revision de frenos"
        3 -> "Cambio de llantas"
        4 -> "Revision del motor"
        5 -> "Cambio de bateria"
        6 -> "Revision electrica"
        else -> "Servicio no registrado"
    }
    println("Servicio: $servicio")
}