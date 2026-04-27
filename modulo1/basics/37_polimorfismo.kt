// La interfaz define el contrato — QUÉ puede hacer
interface Pagable {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCredito(private val numero: String) : Pagable {
    override val nombre = "Tarjeta de crédito"

    override fun procesar(monto: Double): Boolean {
        println("💳 Cargando $${"%.2f".format(monto)} a $numero")
        return true
    }
}

class PayPal(private val email: String) : Pagable {
    override val nombre = "PayPal"

    override fun procesar(monto: Double): Boolean {
        println("🅿️ Enviando $${"%.2f".format(monto)} a $email")
        return true
    }
}

class Efectivo : Pagable {
    override val nombre = "Efectivo"

    override fun procesar(monto: Double): Boolean {
        println("💵 Recibiendo $${"%.2f".format(monto)} en efectivo")
        return true
    }
}

class Cheque(private val numeroDeCheque: String) : Pagable {
    override val nombre = "Cheque"

    override fun procesar(monto: Double): Boolean {
        println("📝 Procesando cheque N° $numeroDeCheque por $${"%.2f".format(monto)}")
        return true
    }
}

// Función polimórfica
fun cobrar(monto: Double, metodoPago: Pagable) {
    println("Procesando pago con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "✅ Pago exitoso" else "❌ Pago fallido")
    println()
}

fun main() {
    val metodos: List<Pagable> = listOf(
        TarjetaCredito("**** **** **** 1234"),
        PayPal("ana@test.com"),
        Efectivo(),
        Cheque("1289")
    )

    metodos.forEach { cobrar(99.99, it) }

    for (pago in metodos) {
        println("Método de pago: ${pago.nombre}")
    }
}