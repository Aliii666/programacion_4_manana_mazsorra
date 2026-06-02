fun main() {
    println("Taller Mecanico - Ciclo For: Inspeccion de Carros")
    println("For con rango")

    for (i in 1..10) {
        val a = 5
        println("5x$i=${i * a}")
    }

    println("For con until")
    for (i in 1 until 11) {
        val a = 5
        println("5x$i=${i * a}")
    }

    println("For con pasos")
    for (i in 1..10 step 3) {
        println(i)
    }

    println("For descendente")
    for (i in 10 downTo 1) {
        println(i)
    }

    println("For con listas")
    val bahias = listOf("Bahia 1", "Bahia 2", "Bahia 3")
    for (bahia in bahias) {
        println(bahia)
    }

    println("For con listas index valor")
    for ((index, valor) in bahias.withIndex()) {
        println("$index->$valor")
    }

    println("For con Break")
    for (i in 1..10) {
        if (i == 5) {
            break
        }
    }

    println("For con Continue")
    for (i in 1..10) {
        if (i == 3) {
            continue
        }
        println("Carro $i")
    }

    println("For con Continue y Break")
    for (i in 1..10) {
        if (i == 3) continue
        if (i == 7) break
        println("Carro $i")
    }

    val carros = listOf(
        Triple("CARRO-001", 85000, 95),
        Triple("CARRO-002", 120000, 75),
        Triple("CARRO-003", 45000, 98),
    )

    for ((posicion, carro) in carros.withIndex()) {
        val (placa, kilometraje, estadoMotor) = carro
        val alertaKilometraje = if (kilometraje >= 100000) "Kilometraje alto" else "Kilometraje normal"
        val alertaMotor = if (estadoMotor < 80) "Motor en mal estado" else "Motor en buen estado"
        println("Puesto $posicion - $placa - Kilometraje: $kilometraje km $alertaKilometraje - Motor: $estadoMotor% $alertaMotor")
    }
}