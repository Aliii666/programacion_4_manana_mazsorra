fun main() {
    println("Controles de Flujo en el Taller Mecánico")
    println("Condicional If - else")
    
    println("¿El cliente es frecuente en el taller? (s/n): ")
    val esClienteFrecuente = readLine()?.trim()?.lowercase() == "s"
    
    println("Ingrese el costo del servicio: ")
    val costoServicio = readLine()?.toDoubleOrNull() ?: 0.0
    
    if (esClienteFrecuente) {
        val descuento = costoServicio * 0.80
        println("¡Cliente frecuente! Descuento del 20% aplicado: $${"%.2f".format(descuento)}")
    } else {
        println("Pago completo del servicio: $${"%.2f".format(costoServicio)}")
    }
}