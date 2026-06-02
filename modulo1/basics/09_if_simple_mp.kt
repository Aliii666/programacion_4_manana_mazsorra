fun main() {
    println("Controles de Flujo - Taller Mecánico")
    println("Condicional If")
    println("Ingrese la temperatura del motor del carro (°C): ")
    val temperaturaMotor = readLine()?.toDoubleOrNull() ?: 90.0
    
    if (temperaturaMotor >= 100.0) {
        println("¡Motor recalentado! Revisar el sistema de refrigeración")
    }
    if (temperaturaMotor >= 120.0) {
        println("¡Peligro! El motor está en riesgo, apagar el carro de inmediato")
    }
    println("Temperatura del motor registrada: $temperaturaMotor °C")
}