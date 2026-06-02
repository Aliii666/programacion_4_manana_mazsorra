// ABSTRACCION: sealed class define los tipos posibles de aviso al cliente
sealed class AvisoTaller(val titulo: String, val mensaje: String) {
    abstract fun formatear(): String  // cada tipo formatea de forma distinta

    data class Email(
        val destinatario: String,
        val asunto:       String,
        val cuerpo:       String
    ) : AvisoTaller(asunto, cuerpo) {
        override fun formatear() =
            "📧 Email -> $destinatario\n   Asunto: $titulo\n   ${mensaje.take(50)}..."
    }

    data class Whatsapp(val dispositivo: String, val icono: String = "🔔")
        : AvisoTaller("Whatsapp", "") {
        override fun formatear() = "$icono Whatsapp -> $dispositivo: $titulo"
    }

    data class Sms(val telefono: String, val texto: String)
        : AvisoTaller("SMS", texto) {
        override fun formatear() = "📱 SMS -> $telefono: ${texto.take(160)}"
    }

    object Silencioso : AvisoTaller("", "") {
        override fun formatear() = "🔕 Aviso silencioso"
    }
}

// ABSTRACCION + POLIMORFISMO: interfaz con contrato generico
interface EnviadorAviso {
    val nombre: String
    fun enviar(aviso: AvisoTaller): Boolean
}

// HERENCIA: implementaciones concretas del mismo contrato
class ServicioEmail : EnviadorAviso {
    override val nombre = "Email"
    override fun enviar(a: AvisoTaller): Boolean {
        if (a !is AvisoTaller.Email) return false
        println("  [EMAIL] -> ${a.destinatario}")
        return true
    }
}

class ServicioWhatsapp : EnviadorAviso {
    override val nombre = "Whatsapp"
    override fun enviar(a: AvisoTaller): Boolean {
        if (a !is AvisoTaller.Whatsapp) return false
        println("  [WHATSAPP] -> ${a.dispositivo}")
        return true
    }
}

// ENCAPSULAMIENTO: la lista de servicios es privada
class CentralAvisos(private val servicios: List<EnviadorAviso>) {

    fun enviar(aviso: AvisoTaller) {
        println(aviso.formatear())  // POLIMORFISMO: cada tipo formatea distinto
        val exito = servicios.any { it.enviar(aviso) }
        if (!exito) println("  ⚠️ Sin servicio disponible")
        println()
    }
}

fun main() {
    val central = CentralAvisos(listOf(ServicioEmail(), ServicioWhatsapp()))

    listOf(
        AvisoTaller.Email("aliyha@taller.com", "Vehiculo listo", "Su auto ya puede ser retirado."),
        AvisoTaller.Whatsapp("iPhone-Aliyha"),
        AvisoTaller.Sms("+5930912345678", "Su turno es a las 10:00"),
        AvisoTaller.Silencioso
    ).forEach { central.enviar(it) }
}