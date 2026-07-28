fun main() {
    println("=== SISTEMA DE TALLER MECÁNICO ===")
    println("Control de Órdenes de Servicio - Ciclo While")

    // While Básico - Revisión de vehículos en cola
    println("\n-- Vehículos en cola de revisión --")
    var numeroVehiculo = 1
    while (numeroVehiculo <= 5) {
        println("Revisando vehículo #$numeroVehiculo")
        numeroVehiculo++
    }

    // Do While - Verificación de niveles de aceite
    println("\n-- Verificación de niveles de aceite --")
    var nivelAceite = 1
    do {
        println("Chequeando nivel de aceite del motor $nivelAceite")
        nivelAceite++
    } while (nivelAceite <= 5)

    // Break y Continue - Inspección de frenos
    println("\n-- Inspección de frenos (10 vehículos) --")
    var vehiculo = 1
    while (vehiculo <= 10) {
        vehiculo++
        if (vehiculo == 3) {
            println("Vehículo #$vehiculo: Sin daños, continuar al siguiente...")
            continue
        }
        if (vehiculo == 7) {
            println("Vehículo #$vehiculo: ¡Falla crítica detectada! Deteniendo inspección.")
            break
        }
        println("Vehículo #$vehiculo: Frenos en buen estado ✓")
    }

    // Menú interactivo del taller
    var input: String
    println("\n=== MENÚ DE SERVICIOS DEL TALLER ===")
    while (true) {
        println("\nEscriba un servicio a registrar (o 'salir' para cerrar):")
        println("  Ej: cambio de aceite, alineación, frenos, etc.")
        input = readLine() ?: ""
        if (input == "salir") {
            println("Cerrando sistema del taller. ¡Hasta pronto!")
            break
        }
        println("Servicio registrado: '$input' → Agregado a la orden de trabajo ✓")
    }
}