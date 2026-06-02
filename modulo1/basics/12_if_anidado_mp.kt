fun main() {
    println("Controles de Flujo en el Taller Mecánico")
    println("Condicional If - Anidado")
    
    println("¿El cliente tiene cita programada? (s/n): ")
    val tieneCita = readLine()?.trim()?.lowercase() == "s"
    
    println("¿Cuántos carros trae el cliente?: ")
    val cantidadCarros = readLine()?.toIntOrNull() ?: 0
    
    if (tieneCita) {
        println("Cliente con cita programada")
        
        if (cantidadCarros < 2) {
            println("Pocos carros: atención inmediata")
        } else if (cantidadCarros > 5) {
            println("Muchos carros: se necesita asignar más mecánicos")
        } else {
            println("Cantidad normal de carros, atención en orden de llegada")
        }
        
    } else {
        println("Cliente sin cita programada")
        
        if (cantidadCarros < 2 || cantidadCarros > 5) {
            println("Cantidad fuera de lo normal: consultar disponibilidad del taller")
        } else {
            println("Se puede atender con espera, hay espacio disponible")
        }
    }
}