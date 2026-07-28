fun main() {
    println("Taller Mecanico - Set: Registro de Servicios Disponibles")
    
    println("Set inmutable")
    val numeros = setOf(1, 2, 3, 4, 5, 6, 7, 8, 1, 3)
    println("numeros Set: ${numeros}")

    println("Operaciones de Conjuntos")
    val serviciosManana = setOf(2, 4, 6, 8, 10)
    val serviciosTarde = setOf(3, 6, 9)
    println("servicios manana Set: ${serviciosManana}")
    println("servicios tarde Set: ${serviciosTarde}")
    println("Union set: ${serviciosManana.union(serviciosTarde)}")
    println("Interseccion set: ${serviciosManana.intersect(serviciosTarde)}")
    println("Subraccion set: ${serviciosManana.subtract(serviciosTarde)}")
    println("servicios manana set: ${serviciosManana}")
    println("servicios tarde set: ${serviciosTarde}")

    println("Set mutable")
    val serviciosTaller = mutableSetOf("cambio de aceite", "revision de frenos", "cambio de llantas", "revision del motor")
    println(serviciosTaller)

    serviciosTaller.add("cambio de aceite")
    println(serviciosTaller)

    serviciosTaller.add("cambio de bateria")
    println(serviciosTaller)

    serviciosTaller.remove("revision del motor")
    println(serviciosTaller)

    println("Verificar si el servicio existe: ${"cambio de aceite" in serviciosTaller}")
    println("Verificar si el servicio existe: ${"revision del motor" in serviciosTaller}")
}