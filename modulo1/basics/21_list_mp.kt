fun main() {
    println("Listas - Inmutable - Taller Mecanico")
    val servicios = listOf("cambio de aceite", "revision de frenos", "cambio de llantas", "revision del motor", "cambio de bateria")
    
    println("Size: ${servicios.size}")
    println("Mostrar el elemento indice 0: ${servicios[0]}")
    println("Mostrar el primer elemento: ${servicios.first()}")
    println("Mostrar el ultimo elemento: ${servicios.last()}")
    
    println("Mostrar el elemento indice 2: ${servicios.get(2)}")
    println("Mostrar indice del elemento: ${servicios.indexOf("revision de frenos")}")
    println("Verificar existencia de elemento: ${servicios.contains("revision de frenos")}")
    println("Verificar existencia de un elemento: ${"revision de frenos" in servicios}")

    println("Sublista: ${servicios.subList(1, 3)}")
    println("Tomar primeros 2 elementos: ${servicios.take(2)}")
    println("Suprimir tres primeros elementos: ${servicios.drop(3)}")
    println("Tomar los ultimos dos elementos: ${servicios.takeLast(2)}")

    for (servicio in servicios) {
        println(servicio)
    }

    println("Listas - Mutable - Taller Mecanico")
    val mecanicos = mutableListOf("Juan", "Pedro", "Luis", "Carlos", "Maria")
    
    println(mecanicos)
    
    mecanicos.add("Aliyha")
    println(mecanicos)
    
    mecanicos.add(0, "Roberto")
    println(mecanicos)
    
    mecanicos.remove("Luis")
    println(mecanicos)
    
    mecanicos[1] = "Nicolas"
    println(mecanicos)
    
    println("Array deque - Cola de carros en el taller")
    val colaCarros = ArrayDeque<Int>()
    println(colaCarros)
    colaCarros.addFirst(1)
    println(colaCarros)
    colaCarros.addLast(2)
    println(colaCarros)
    colaCarros.addLast(0)
    println(colaCarros)
    colaCarros.removeFirst()
    println(colaCarros)
    colaCarros.removeLast()
    println(colaCarros)
}