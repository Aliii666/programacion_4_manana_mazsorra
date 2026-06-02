fun main() {
    println("Operadores Lógicos - Taller Mecánico")
    
    val carroRevisado = true
    val pagoRealizado = false
    val mecanicoDisponible = true
    
    println("&& - And Lógico")
    println("¿El carro fue revisado Y el pago fue realizado? $carroRevisado && $pagoRealizado = ${carroRevisado && pagoRealizado}")
    println("¿Hay mecánico disponible Y el carro fue revisado? $mecanicoDisponible && $carroRevisado = ${mecanicoDisponible && carroRevisado}")
    
    println("|| - Or Lógico")
    println("¿El carro fue revisado O el pago fue realizado? $carroRevisado || $pagoRealizado = ${carroRevisado || pagoRealizado}")
    println("¿Hay mecánico disponible O el carro fue revisado? $mecanicoDisponible || $carroRevisado = ${mecanicoDisponible || carroRevisado}")
    
    println("! - Not Lógico")
    println("¿El carro NO fue revisado? ! $carroRevisado = ${!carroRevisado}")
    println("¿El mecánico NO está disponible? ! $mecanicoDisponible = ${!mecanicoDisponible}")
}