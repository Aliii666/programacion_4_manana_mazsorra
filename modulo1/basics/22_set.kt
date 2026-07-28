fun main() {
    println("Set")

    val numeros = setOf(1, 2, 3, 4, 8, 4, 1, 3)
    println("numeros set: ${numeros}")

    println("Operaciones de conjuntos")

    val pares = setOf(2, 4, 6, 8, 10)
    val multiplos3 = setOf(3, 6, 9, 12)

    println("pares set: ${pares}")
    println("multiplos3 set: ${multiplos3}")

    println("union : ${pares union multiplos3}")
    println("interseccion : ${pares intersect multiplos3}")
    println("subsraccion : ${pares subtract multiplos3}")

    println("pares set: ${pares}")
    println("multiplos3 set: ${multiplos3}")

    println("Set Mutable")

    val tags = mutableSetOf("kotlin", "java", "reactnative")
    println(tags)

    tags.add("kotlin")
    tags.add("javascript")
    tags.remove("java")

    println(tags)

    println("verificar si elemento existe ${"kotlin" in tags}")
    println("verificar si elemento existe ${"java" in tags}")
}