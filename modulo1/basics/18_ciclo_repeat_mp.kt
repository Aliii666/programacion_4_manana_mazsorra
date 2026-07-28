fun main() {
    println("Taller Mecanico - Ciclo Repeat: Medicion de Costos de Servicios")
    println("Cuantos servicios desea ingresar para calcular el costo promedio?")
    val servicios = readLine()?.toIntOrNull() ?: 3
    
    var totalCosto = 0
    
    repeat(servicios) { i ->
        println("Servicio ${i + 1} (costo en dolares): ")
        val costo = readLine()?.toIntOrNull() ?: 0
        totalCosto += costo
    }
    
    val promedio = if (servicios > 0) totalCosto / servicios else 0
    
    println("Costo promedio de los servicios: $$promedio")
    println("Clasificacion: ${
        when {
            promedio < 50 -> "Servicio Basico"
            promedio <= 150 -> "Servicio Intermedio"
            else -> "Servicio Costoso"
        }
    }")
}