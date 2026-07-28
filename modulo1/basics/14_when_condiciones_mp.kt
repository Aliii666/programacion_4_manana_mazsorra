fun main() {
    println("Taller Mecanico - When con Condiciones Arbitrarias")
    println("Sistema de Tarifas del Taller")
    
    println("Kilometraje del carro: ")
    val kilometrajeCarro = readLine()?.toIntOrNull() ?: 0
    
    println("El carro tiene garantia de fabrica? (s/n): ")
    val tieneGarantia = readLine()?.trim()?.lowercase() == "s"
    
    val nivelGarantia = if (tieneGarantia) {
        println("Nivel de garantia (BASICA/INTERMEDIA/PREMIUM): ")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""
    
    val tarifa = when {
        !tieneGarantia && kilometrajeCarro < 10000 -> 0.0
        !tieneGarantia && kilometrajeCarro >= 80000 -> 150.0
        !tieneGarantia -> 80.0
        nivelGarantia == "BASICA" -> 50.0
        nivelGarantia == "INTERMEDIA" -> 30.0
        nivelGarantia == "PREMIUM" -> 0.0
        else -> 60.0
    }
    println("Tarifa del servicio: $${"%.2f".format(tarifa)}")
}