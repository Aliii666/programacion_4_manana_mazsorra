sealed class AlertaTaller(val titulo: String, val mensaje: String) {
    abstract fun formatear(): String

    data class Email(
        val destinatario: String,
        val asunto:       String,
        val cuerpo:       String
    ) : AlertaTaller(asunto, cuerpo) {
        override fun formatear() =
            "📧 Email → $destinatario\n   Asunto: $titulo\n   ${mensaje.take(50)}..."
    }

    data class Whatsapp(val telefono: String, val icono: String = "🔔")
        : AlertaTaller("WhatsApp", "") {
        override fun formatear() = "$icono Whatsapp → $telefono: $titulo"
    }

    data class Sms(val telefono: String, val texto: String)
        : AlertaTaller("SMS", texto) {
        override fun formatear() = "📱 SMS → $telefono: ${texto.take(160)}"
    }

    object Silenciosa : AlertaTaller("", "") {
        override fun formatear() = "🔕 Alerta silenciosa"
    }
}

interface EnviadorAlerta {
    val nombre: String
    fun enviar(alerta: AlertaTaller): Boolean
}

class ServicioEmail : EnviadorAlerta {
    override val nombre = "Email"
    override fun enviar(a: AlertaTaller): Boolean {
        if (a !is AlertaTaller.Email) return false
        println("  [EMAIL] → ${a.destinatario}")
        return true
    }
}

class ServicioWhatsapp : EnviadorAlerta {
    override val nombre = "WhatsApp"
    override fun enviar(a: AlertaTaller): Boolean {
        if (a !is AlertaTaller.Whatsapp) return false
        println("  [WHATSAPP] → ${a.telefono}")
        return true
    }
}

class Dispatcher(private val servicios: List<EnviadorAlerta>) {
    fun enviar(alerta: AlertaTaller) {
        println(alerta.formatear())
        val exito = servicios.any { it.enviar(alerta) }
        if (!exito) println("  ⚠️ Sin servicio disponible")
        println()
    }
}

fun main() {
    System.setOut(java.io.PrintStream(System.out, true, "UTF-8"))

    val dispatcher = Dispatcher(listOf(ServicioEmail(), ServicioWhatsapp()))

    listOf(
        AlertaTaller.Email("carlos@taller.com", "Vehiculo listo", "Su Toyota Corolla ABC-1234 ya esta listo para retirar."),
        AlertaTaller.Whatsapp("+5930991234567"),
        AlertaTaller.Sms("+5930991234567", "Su vehiculo esta listo. Pase por el taller."),
        AlertaTaller.Silenciosa
    ).forEach { dispatcher.enviar(it) }
}