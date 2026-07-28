fun main() {
    val nombreVehiculo = "Toyota Corolla"
    val tipoVehiculo = "Sedán"
    val kilometraje = 28
    
    println("Bienvenido vehículo $nombreVehiculo")
    
    println("Identificación: ${nombreVehiculo.uppercase()} - ${tipoVehiculo.uppercase()}")
    val identificacion = "Identificación: ${nombreVehiculo.uppercase()} - ${tipoVehiculo.uppercase()}"
    println(identificacion)
    
    println("Kilometraje registrado: ${kilometraje + 6} mil km")
    
    val registro = """
        |Vehículo: $nombreVehiculo
        |Tipo: $tipoVehiculo
        |Kilometraje: $kilometraje mil km
        |Acceso al taller: ${if(kilometraje > 18) "Permitido" else "Denegado"}
    """.trimMargin()
    
    println(registro)
}