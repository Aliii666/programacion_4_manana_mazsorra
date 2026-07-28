data class TipoServicio(val id: Int, val nombre: String)

data class Servicio(
    val id:           Int,
    val nombre:       String,
    val precio:       Double,
    val disponible:   Int,
    val tipoServicio: TipoServicio,
    val activo:       Boolean = true
) {
    // ABSTRACCION: el cliente consulta si hay cupo sin saber la logica
    val hayCupo: Boolean get() = activo && disponible > 0
    val precioConIva: Double get() = precio * 1.12  // IVA 12%

    // Devuelve una copia — inmutabilidad como forma de encapsulamiento
    fun aplicarDescuento(porcentaje: Double): Servicio {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(precio = precio * (1 - porcentaje / 100))
    }
}

// ENCAPSULAMIENTO: el estado del taller es privado y mutable internamente
object CatalogoServicios {
    private val tiposServicio = mutableListOf(
        TipoServicio(1, "Motor"),
        TipoServicio(2, "Frenos"),
        TipoServicio(3, "Electrica")
    )
    private val servicios     = mutableListOf<Servicio>()
    private var siguienteId   = 1

    fun agregarServicio(nombre: String, precio: Double, disponible: Int, tipoId: Int): Servicio? {
        val tipo     = tiposServicio.find { it.id == tipoId } ?: return null
        val servicio = Servicio(siguienteId++, nombre, precio, disponible, tipo)
        servicios.add(servicio)
        return servicio
    }

    // ABSTRACCION: interfaz publica limpia — solo lectura de listas
    fun listar(): List<Servicio>              = servicios.toList()
    fun conCupo(): List<Servicio>             = servicios.filter { it.hayCupo }
    fun porTipo(id: Int): List<Servicio>      = servicios.filter { it.tipoServicio.id == id }
    fun buscar(query: String): List<Servicio> =
        servicios.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoServicios.agregarServicio("Cambio de aceite",      25.0, 10, 1)
    CatalogoServicios.agregarServicio("Revision del motor",    80.0,  0, 1)
    CatalogoServicios.agregarServicio("Cambio de frenos",      60.0,  5, 2)
    CatalogoServicios.agregarServicio("Revision electrica",    40.0,  8, 3)

    println("=== Todos los servicios ===")
    CatalogoServicios.listar().forEach { s ->
        val estado = if (s.hayCupo) "✅" else "❌"
        println("$estado ${s.nombre} — ${"%.2f".format(s.precioConIva)} (con IVA)")
    }

    println("\n=== Servicios disponibles con 10% descuento ===")
    CatalogoServicios.conCupo()
        .map { it.aplicarDescuento(10.0) }
        .forEach { println("  ${it.nombre}: ${"%.2f".format(it.precio)}") }
}