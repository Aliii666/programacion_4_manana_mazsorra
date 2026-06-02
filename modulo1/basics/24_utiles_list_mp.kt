fun main() {
    println("Taller Mecanico - Utilidades de Listas: Analisis de Servicios")
    
    println("utilidades list")
    val numeros = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    println(numeros)
    val cuadrados = numeros.map { it * it }
    println(cuadrados)
    val serviciosTexto = numeros.map { "servicio $it dolares" }
    println(serviciosTexto)

    println("filter")
    val pares = numeros.filter { it % 2 == 0 }
    println(pares)
    val mayores5 = numeros.filter { it > 5 }
    println(mayores5)
    val paresMayores5 = numeros.filter { it % 2 == 0 && it > 5 }
    println(paresMayores5)
    val noPares = numeros.filter { it % 2 != 0 }
    println(noPares)
    val impares = numeros.filterNot { it % 2 == 0 }
    println(impares)

    val registros = listOf(1, "CARRO-001", 2, "MECANICO-402", true, 42)
    val soloString = registros.filterIsInstance<String>()
    println(soloString)

    println("reduce")
    val costosReduce = listOf(1, 2, 3, 4, 5)
    val suma = costosReduce.reduce { acc, i -> acc + i }
    println(suma)
    val producto = costosReduce.reduce { acc, i -> acc * i }
    println(producto)

    println("fold")
    val sumaFold = costosReduce.fold(100) { acc, i -> acc + i }
    println(sumaFold)
    val productoFold = costosReduce.fold(100) { acc, i -> acc * i }
    println(productoFold)

    println("Ordenacion")
    println("Ascendente: ${numeros.sorted()}")
    println("Descendente: ${numeros.sortedDescending()}")
    println("sortedBy: ${numeros.sortedBy { it % 3 }}")
    
    println("Agregacion")
    println("Sumatoria de costos: ${numeros.sum()}")
    println("Promedio de costos: ${numeros.average()}")
    println("Costo maximo: ${numeros.max()}")
    println("Costo minimo: ${numeros.min()}")
    println("Total de servicios: ${numeros.count()}")
    
    println("Busqueda")
    println("Primer servicio mayor a 4: ${numeros.find { it > 4 }}")
    println("Ultimo servicio mayor a 4: ${numeros.findLast { it > 4 }}")
    println("Hay algun servicio mayor a 4?: ${numeros.any { it > 4 }}")
    println("Todos los servicios son mayores a 0?: ${numeros.all { it > 0 }}")
    println("Ningun servicio mayor a 10?: ${numeros.none { it > 10 }}")
}