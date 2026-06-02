fun main() {
    println("Taller Mecanico - When con Bloques y Niveles de Alerta")
    println("Nombre del carro: ")
    val nombreCarro = readLine()?.trim()?.lowercase() ?: "Sin Identificacion"
    
    println("Nivel de alerta del carro (CRITICO/URGENTE/MODERADO/LEVE): ")
    val nivel = readLine()?.trim()?.uppercase() ?: ""

    when (nivel) {
        "CRITICO" -> {
            println("ALERTA CRITICA: Carro: $nombreCarro")
            println("Llamar al jefe del taller de inmediato")
            println("Activar revision de emergencia del carro")
        }
        "URGENTE" -> {
            println("URGENTE: Carro: $nombreCarro")
            println("Atender el carro antes que los demas")
            println("Revisar la situacion en 15 minutos")
        }
        "MODERADO" -> println("Moderado: Carro: $nombreCarro, programar revision pronto")
        "LEVE" -> println("Leve: Carro: $nombreCarro, puede esperar su turno normal")
        else -> println("Nivel no reconocido")
    }
}