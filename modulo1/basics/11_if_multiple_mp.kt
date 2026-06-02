fun main() {
    println("Controles de Flujo en el Taller Mecánico")
    println("Clasificación del estado del carro")
    
    println("Ingrese el kilometraje del carro: ")
    val kilometraje = readLine()?.toIntOrNull() ?: 0
    
    val clasificacion = if (kilometraje <= 10000) {
        "Carro nuevo, solo revisión básica"
    } else if (kilometraje <= 30000) {
        "Carro en buen estado, cambio de aceite recomendado"
    } else if (kilometraje <= 60000) {
        "Carro con uso normal, revisar frenos y llantas"
    } else if (kilometraje <= 100000) {
        "Carro con alto kilometraje, revisión completa recomendada"
    } else if (kilometraje <= 150000) {
        "Carro muy usado, revisar motor y transmisión"
    } else {
        "Carro crítico, requiere revisión inmediata de todas las partes"
    }
    
    println("Estado del carro: $clasificacion")
}