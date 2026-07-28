fun main() {
    println("Controles de Flujo When -  con bloque de codigos")
    
    println("Nombre del Paciente")
    val nombrePaciente = readLine()?.trim()?.lowercase()?:"Sin identificacion"
    println("Tiene Nivel Alerta (CRITICO/URGENTE/MODERADO/LEVE)")
    val nivel = readLine()?.trim()?.uppercase()?:""
    
    when(nivel){
        "CRITICO" ->{
            println("ALERTA CRITICA: Paciente: $nombrePaciente")
            println("Llamar al medico de guardia")
            println("Activar el protocolo de urgencia medica")
        }
        
        "URGENTE" ->{
            println("URGENTE: Paciente: $nombrePaciente")
            println("Priorizar en la sala de espera")
            println("Reevaluar en 15 minutos")
        }
        
        "MODERADO" -> println("Moderado: paciente: $nombrePaciente")
        "LEVE" -> println("Leve: paciente: $nombrePaciente continuar espera normal")
        else -> println("nivel no reconocido")
    }
}