fun main() {
    println("Controles de flujo interaciones, ciclos repetitivos - clico for")
    println("For con rango")
    for (i in 1..5) {
        println("Multiplicacion del 5: ${5 * i}")
    }

    println("For con until")
    for (i in 1 until 6) {
        println(i)
    }

    println("For con pasos")
    for (i in 0..10 step 2) {
        println(i)
    }

    println("For desendente")
    for (i in 5 downTo 1) {
        println(i)
    }

    println("For con listas")
    val nombres = listOf("Juan", "María", "Pedro", "Ana", "Luis")
    for (nombre in nombres) {
        println(nombre)
    }

    println("For con listas index valor")
    for ((index, valor) in nombres.withIndex()) {
        println("$index -> $valor")
    }

    println("For con break")
    for (i in 1..10) {
        if (i == 5) {
            break
        }
        println(i)
    }

    println("For con continue")
    for (i in 1..10) {
        if (i == 3) continue;
        if (i == 7) break;
        println(i)
    }

    val pacientes = listOf(
        triple("Garcia, M", 37.2, 98),
        triple("Perez, J", 39.1, 94),
        triple("Lopez, A", 40.3, 91)
    )

    for ((posicion, paciente) in pacientes.withIndex()) {
        val (nombre, temperatura, spo2) = paciente
        val alertaTemp = if(temperatura >= 38.0) "Fiebre" else "Normal"
        val alertaSpo2 = if(spo2 < 95) "Bajo" else "Normal"
        println("cama $posicion - $nombre - Temp: $temperatura Gdo.Cent.$alertaTemp - SpO2: $spo2 ($alertaSpo2)")
    }
}