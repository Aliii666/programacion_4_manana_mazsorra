open class OrdenServicio(cliente: String, anticipoInicial: Double) {

    val cliente: String = cliente

    private var anticipo: Double = anticipoInicial

    internal val numeroOrden: String =
        "ORD-${(10000..99999).random()}"

    protected open fun calcularDescuento(): Double = anticipo * 0.05

    fun agregarPago(monto: Double) {
        require(monto > 0) { "El monto debe ser positivo" }
        anticipo += monto
        println("Pago recibido: $${"%.2f".format(monto)} | Saldo a favor: ${consultarSaldo()}")
    }

    fun descontarServicio(monto: Double): Boolean {
        require(monto > 0) { "El monto debe ser positivo" }
        if (monto > anticipo) {
            println("Saldo insuficiente — el cliente debe un pago adicional")
            return false
        }
        anticipo -= monto
        println("Servicio cobrado: $${"%.2f".format(monto)} | Saldo restante: ${consultarSaldo()}")
        return true
    }

    fun consultarSaldo(): String = "$${"%.2f".format(anticipo)}"
}

fun main() {
    System.setOut(java.io.PrintStream(System.out, true, "UTF-8"))

    val orden = OrdenServicio("Carlos Ramírez", 200.0)

    println("=== TALLER MECÁNICO — ORDEN DE SERVICIO ===")
    println("Cliente      : ${orden.cliente}")
    println("Número orden : ${orden.numeroOrden}")
    println()

    orden.agregarPago(150.0)
    orden.descontarServicio(80.0)
    orden.descontarServicio(500.0)

    println()
    println("Cliente           : ${orden.cliente}")
    println("Saldo disponible  : ${orden.consultarSaldo()}")
    // orden.anticipo = 999999.0   // ERROR — privado
}