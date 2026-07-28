fun main() {
    
    val vehiculosPequenos: Byte = 127
    println("Cantidad máxima de vehículos pequeños: $vehiculosPequenos")
    
    val repuestos: Short = 32_765
    println("Cantidad de repuestos en almacén: $repuestos")
    
    val vehiculosEnTaller: Int = 12
    println("Vehículos actualmente en taller: $vehiculosEnTaller")
    
    val kilometrajeTotal: Long = 12_122_122_122_123_123L
    println("Kilometraje total registrado: $kilometrajeTotal km")
    
    println("Datos Decimales")
    
    val tarifaServicio: Float = 3.14f
    println("Tarifa de servicio (Float): $tarifaServicio")
    
    val presionAceite: Double = 3.1415926535
    println("Presión de aceite (Double): $presionAceite bar")
    
    val nombreVehiculo = "Ali"
    val numeroMecanicos = 22
    
    println("Nombre del vehículo: $nombreVehiculo")
    val nombreTipo = nombreVehiculo::class.simpleName
    println("Tipo inferido nombreVehiculo: $nombreTipo")
    println("Tipo inferido nombreVehiculo: ${nombreVehiculo::class.simpleName}")
    
    println("Número de mecánicos: $numeroMecanicos")
    val mecanicosTipo = numeroMecanicos::class.simpleName
    println("Tipo inferido mecánicos: $mecanicosTipo")
    println("Tipo inferido mecánicos: ${numeroMecanicos::class.simpleName}")
}