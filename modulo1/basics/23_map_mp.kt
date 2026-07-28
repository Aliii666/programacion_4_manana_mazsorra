fun main() {
    println("Taller Mecanico - Map: Servicios y Precios del Taller")
    
    println("Map inmutable")
    val serviciosPrecios = mapOf(
        "cambio de aceite" to "25 dolares",
        "revision de frenos" to "40 dolares",
        "cambio de llantas" to "60 dolares",
        "revision del motor" to "80 dolares",
    )
    println(serviciosPrecios["cambio de aceite"])
    println(serviciosPrecios["cambio de vidrios"])
    println(serviciosPrecios.getOrDefault("cambio de aceite", "Desconocido"))
    println(serviciosPrecios.getOrDefault("cambio de vidrios", "Desconocido"))
    println(serviciosPrecios)
    println(serviciosPrecios.keys)
    println(serviciosPrecios.values)
    println(serviciosPrecios.entries)
    for ((servicio, precio) in serviciosPrecios) {
        println("$servicio -> $precio")
    }

    println("Map mutable")
    val carrosTaller = mutableMapOf(
        "cambio de aceite" to 10,
        "revision de frenos" to 4,
        "cambio de llantas" to 12,
        "revision del motor" to 8
    )
    carrosTaller["cambio de bateria"] = 5
    println(carrosTaller)
    carrosTaller["cambio de aceite"] = 20
    println(carrosTaller)
    carrosTaller.remove("revision del motor")
    println(carrosTaller)
    carrosTaller.getOrPut("revision electrica") { 15 }
    println(carrosTaller)
    carrosTaller.getOrPut("cambio de llantas") { 15 }
    println(carrosTaller)
}