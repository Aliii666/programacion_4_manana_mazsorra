fun main() {
    println("Listas")

    val frutas = listOf("manzanas", "banana", "cereza", "banana", "pera")

    println("Size: ${frutas.size}")
    println("Mostrar el elemento indice 0: ${frutas[0]}")
    println("Mostrar el primer elemento: ${frutas.first()}")
    println("Mostrar el ultimo elemento: ${frutas.last()}")

    println("Mostrar el elemento indice 2: ${frutas.get(2)}")
    println("Mostrar indice contenido elemento: ${frutas.indexOf("banana")}")

    println("Verificar existencia de elemento: ${frutas.contains("cereza")}")
    println("Verificar existencia de un elemento: ${"banana" in frutas}")

    println("Sublista: ${frutas.subList(1, 3)}")
    println("Tomar primeros 2 elementos: ${frutas.take(2)}")
    println("Suprimir tres primeros elementos: ${frutas.drop(3)}")
    println("Tomar los ultimos dos elementos: ${frutas.takeLast(2)}")

    for (fruta in frutas) {
        println(fruta)
    }

    println("lista mutable")

    val colores = mutableListOf("blanco", "azul", "amarillo", "rojo")

    for (fruta in colores) {
        println(fruta)
    }

    colores.add("verde")
    for (fruta in colores) {
        println(fruta)
    }

    colores.add(0, "morado")
    for (fruta in colores) {
        println(fruta)
    }

    colores.remove("verde")
    for (fruta in colores) {
        println(fruta)
    }

    colores[1] = "gris"
    for (fruta in colores) {
        println(fruta)
    }
    println("Array deque")
    val deque = ArrayDeque<Int>()
    println(deque)
    deque.addFirst(1)
    println(deque)
    deque.addLast(2)
    println(deque)
    deque.addLast(3)
    println(deque)
    deque.removeFirst()
    println(deque)
    deque.removeLast()
    println(deque)
}