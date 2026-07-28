class CostoServicio(costoBase: Double) {

    // ENCAPSULAMIENTO: el setter valida antes de asignar
    var costoBase: Double = costoBase
        set(value) {
            require(value >= 0.0) { "El costo no puede ser negativo" }
            field = value  // 'field' es el backing field
        }

    // ABSTRACCION: el cliente consulta el costo sin saber la formula
    val conImpuesto: Double
        get() = costoBase * 1.12  // IVA del 12%

    val conDescuento: Double
        get() = costoBase * 0.90  // 10% de descuento cliente frecuente

    val clasificacion: String
        get() = when {
            costoBase < 50.0  -> "Servicio Basico"
            costoBase < 150.0 -> "Servicio Intermedio"
            costoBase < 300.0 -> "Servicio Completo"
            else              -> "Servicio Premium"
        }
}

fun main() {
    val servicio = CostoServicio(120.0)
    println("Costo base: $${servicio.costoBase} | Con impuesto: $${servicio.conImpuesto} | Con descuento: $${servicio.conDescuento}")
    println(servicio.clasificacion)  // Servicio Intermedio

    servicio.costoBase = 30.0
    println("Nuevo costo: $${servicio.costoBase} | ${servicio.clasificacion}")  // Servicio Basico

    // servicio.costoBase = -100.0  // IllegalArgumentException
}