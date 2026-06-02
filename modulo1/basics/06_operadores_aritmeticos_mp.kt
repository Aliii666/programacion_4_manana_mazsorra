fun main() {
    
    // Entrada de datos
    println("Sistema de Costos del Taller Mecánico")
    
    println("Ingrese el costo de la mano de obra del carro 1: ")
    val costo1 = readLine()?.toInt() ?: 0

    println("Ingrese el costo de la mano de obra del carro 2: ")
    val costo2 = readLine()?.toInt() ?: 0

    println("Operaciones de Costos")
    
    println("Total a cobrar por los 2 carros")
    println("$costo1 + $costo2 : ${costo1 + costo2}")
    
    println("Diferencia de precio entre carros")
    println("$costo1 - $costo2 : ${costo1 - costo2}")
    
    println("Costo si se repite el mismo servicio varias veces")
    println("$costo1 * $costo2 : ${costo1 * costo2}")
    
    println("Costo dividido entre los mecánicos que trabajaron")
    println("$costo1 / $costo2 : ${costo1 / costo2}")
    
    println("Lo que sobra al repartir el pago entre los mecánicos")
    println("$costo1 % $costo2 : ${costo1 % costo2}")
    
    println("Operadores de Asignación Compuesta")
    
    var carrosEnTaller = 10
    
    carrosEnTaller += 5
    println("Llegaron 5 carros nuevos, total en taller: $carrosEnTaller")
    
    carrosEnTaller -= 3
    println("Salieron 3 carros listos, total en taller: $carrosEnTaller")
    
    carrosEnTaller *= 6
    println("Se multiplicaron los turnos x6, total en taller: $carrosEnTaller")
    
    carrosEnTaller /= 2
    println("Se repartieron los carros en 2 turnos, total por turno: $carrosEnTaller")
    
    carrosEnTaller %= 2
    println("Carros que no entraron en ningún turno: $carrosEnTaller")
    
    // Incremento o Decremento
    carrosEnTaller++
    println("Llegó 1 carro más al taller: $carrosEnTaller")
    
    carrosEnTaller--
    println("Se fue 1 carro del taller: $carrosEnTaller")
}