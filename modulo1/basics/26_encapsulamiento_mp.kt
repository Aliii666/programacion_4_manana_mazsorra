class OrdenServicio(cliente: String, saldoInicial: Double) {

    val cliente: String = cliente       // publico — cualquiera puede leer

    private var saldo: Double = saldoInicial  // privado — solo esta clase lo modifica

    internal val numeroOrden: String =        // internal — visible en el mismo modulo
        "OS${(100000..999999).random()}"

    protected open fun calcularDescuento(): Double = saldo * 0.02  // protected — visible en subclases

    // El saldo solo cambia a traves de estos metodos — NUNCA directamente
    fun agregarServicio(monto: Double) {
        require(monto > 0) { "El monto debe ser positivo" }
        saldo += monto
        println("Servicio agregado: $${"%.2f".format(monto)} | Total a pagar: ${consultarSaldo()}")
    }

    fun aplicarPago(monto: Double): Boolean {
        require(monto > 0) { "El monto debe ser positivo" }
        if (monto > saldo) {
            println("El pago supera el total de la orden")
            return false
        }
        saldo -= monto
        println("Pago aplicado: $${"%.2f".format(monto)} | Saldo restante: ${consultarSaldo()}")
        return true
    }

    fun consultarSaldo(): String = "$${"%.2f".format(saldo)}"
}

fun main() {
    val orden = OrdenServicio("Aliyha", 1000.0)

    orden.agregarServicio(500.0)    // Servicio agregado: $500.00 | Total a pagar: $1500.00
    orden.aplicarPago(200.0)        // Pago aplicado: $200.00 | Saldo restante: $1300.00
    orden.aplicarPago(2000.0)       // El pago supera el total de la orden

    println(orden.cliente)          // Aliyha — acceso publico permitido
    println(orden.consultarSaldo()) // $1300.00
    // orden.saldo = 999999.0       // ERROR — saldo es privado
}