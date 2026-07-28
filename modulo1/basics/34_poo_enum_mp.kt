enum class EstadoCarro(val descripcion: String, val esTerminal: Boolean) {
    ESPERANDO    ("Carro en espera de atencion",     false),
    EN_REVISION  ("Carro siendo revisado",           false),
    LISTO        ("Carro listo para entregar",        true),
    CON_PROBLEMA ("Carro con problema sin resolver",  true),
    CANCELADO    ("Servicio cancelado por el cliente",true);

    fun puedeTransicionarA(siguiente: EstadoCarro): Boolean = when (this) {
        ESPERANDO   -> siguiente == EN_REVISION || siguiente == CANCELADO
        EN_REVISION -> siguiente == LISTO || siguiente == CON_PROBLEMA
        else        -> false
    }
}

fun main() {
    val estado = EstadoCarro.EN_REVISION
    println(estado.descripcion)  // Carro siendo revisado
    println(estado.esTerminal)   // false

    // when exhaustivo — sin else porque el compilador conoce todos los casos
    val icono = when (estado) {
        EstadoCarro.ESPERANDO    -> "⏰"
        EstadoCarro.EN_REVISION  -> "⏳"
        EstadoCarro.LISTO        -> "✅"
        EstadoCarro.CON_PROBLEMA -> "❌"
        EstadoCarro.CANCELADO    -> "🚫"
    }
    println(icono)  // ⏳

    println(estado.puedeTransicionarA(EstadoCarro.LISTO))  // true
}