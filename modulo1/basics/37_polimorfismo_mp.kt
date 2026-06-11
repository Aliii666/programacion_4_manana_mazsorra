// La interfaz define el contrato — QUÉ puede hacer
interface MetodoPago {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCredito(private val numero: String) : MetodoPago {
    override val nombre = "Tarjeta de crédito"

    override fun procesar(monto: Double): Boolean {
        println("💳 Cargando $${"%.2f".format(monto)} a $numero")
        return true
    }
}

class Transferencia(private val cuentaDestino: String) : MetodoPago {
    override val nombre = "Transferencia bancaria"

    override fun procesar(monto: Double): Boolean {
        println("🏦 Transfiriendo $${"%.2f".format(monto)} a la cuenta $cuentaDestino")
        return true
    }
}

class Efectivo : MetodoPago {
    override val nombre = "Efectivo"

    override fun procesar(monto: Double): Boolean {
        println("💵 Recibiendo $${"%.2f".format(monto)} en efectivo")
        return true
    }
}

class Cheque(private val numeroCheque: String) : MetodoPago {
    override val nombre = "Cheque"

    override fun procesar(monto: Double): Boolean {
        println("📝 Procesando cheque N° $numeroCheque por $${"%.2f".format(monto)}")
        return true
    }
}

// Función polimórfica — cobra el servicio sin importar el método de pago
fun cobrarServicio(monto: Double, metodoPago: MetodoPago) {
    println("Procesando pago con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "✅ Pago exitoso" else "❌ Pago fallido")
    println()
}

fun main() {
    System.setOut(java.io.PrintStream(System.out, true, "UTF-8"))

    val metodos: List<MetodoPago> = listOf(
        TarjetaCredito("**** **** **** 1234"),
        Transferencia("ES76-0081-0166-2300"),
        Efectivo(),
        Cheque("1289")
    )

    metodos.forEach { cobrarServicio(99.99, it) }

    for (pago in metodos) {
        println("Método de pago: ${pago.nombre}")
    }
}