// El usuario de esta clase solo sabe QUÉ puede hacer con un Servicio
// No necesita saber cómo se calcula precioConIva ni cómo funciona disponible
class Servicio(
    val id:           Int,
    val nombre:       String,
    val precioBase:   Double,
    private val tecnicosDisponibles: Int   // privado — nadie asigna técnicos directamente
) {
    val precioConIva: Double               // interfaz pública — qué puede consultar el cliente
        get() = precioBase * 1.19

    val disponible: Boolean
        get() = tecnicosDisponibles > 0

    val descripcionPrecio: String
        get() = "Base: $${"%.2f".format(precioBase)} | Con IVA: $${"%.2f".format(precioConIva)}"

    override fun toString() = "[$id] $nombre ($${"%.2f".format(precioBase)} + IVA)"
}

fun main() {
    val cambioAceite = Servicio(1, "Cambio de aceite", 35.00, 3)
    val alineacion   = Servicio(2, "Alineación y balanceo", 50.00, 1)
    val reparacionMotor = Servicio(3, "Reparación de motor", 320.00, 0)

    println("=== TALLER MECÁNICO — SERVICIOS DISPONIBLES ===\n")

    val servicios = listOf(cambioAceite, alineacion, reparacionMotor)

    for (servicio in servicios) {
        println(servicio)
        println("  Disponible     : ${if (servicio.disponible) "✓ Sí" else "✗ No hay técnicos"}")
        println("  ${servicio.descripcionPrecio}")
        println()
    }

    // El código externo usa solo la interfaz pública
    println("Precio con IVA del cambio de aceite: ${"%.2f".format(cambioAceite.precioConIva)}")

    // cambioAceite.tecnicosDisponibles = 0  // ERROR — privado, protegido por diseño
}