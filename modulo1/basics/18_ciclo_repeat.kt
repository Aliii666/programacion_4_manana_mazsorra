// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
    println("Controles de Flujo Iteraciones. Ciclos repetitivos - Ciclo Repeat")
    println("Cuantas pulsaciones tomar para calcular frecuencia cardiaca")
    val mediciones = readLine()?.toIntOrNull() ?: 0
    var totalPulsaciones = 0

    repeat(mediciones) { i ->
        println("Medicion ${i + 1} (pulsos en 15 seg)")
        val pulsos = readLine()?.toIntOrNull() ?: 0
        totalPulsaciones += pulsos * 4 // para 60seg
    }

    val promedio = if (mediciones > 0) totalPulsaciones / mediciones else 0
    println("Frecuencia cardiaca promedio: $promedio lpm")
    println("Clasificacion: ${
        when {
            promedio < 60 -> "Bradicardia"
            promedio <= 100 -> "Normal"
            else -> "Taquicardia"
        }
    }")
}