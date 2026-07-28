interface Registrable {
    val id: String                    // abstracta — debe implementarse
    fun registrar(): String           // abstracta — debe implementarse
    val version: Int get() = 1        // con default — puede sobreescribirse
}

interface Verificable {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()

    fun verificar(): Boolean
    fun imprimirErrores() {           // implementacion por defecto
        if (errores.isEmpty()) println("Sin errores")
        else errores.forEach { println("  ❌ $it") }
    }
}

// POLIMORFISMO: OrdenServicio puede usarse donde se espere Registrable O Verificable
data class OrdenServicio(
    override val id: String,
    val cliente:     String,
    val servicios:   List<String>,
    val total:       Double
) : Registrable, Verificable {

    override fun registrar() =
        "$id|$cliente|${servicios.joinToString(",")}|$total"

    override val errores: List<String> get() = buildList {
        if (cliente.isBlank())    add("El cliente no puede estar vacio")
        if (servicios.isEmpty())  add("La orden debe tener al menos un servicio")
        if (total <= 0)           add("El total debe ser mayor que cero")
    }

    override fun verificar() = esValido
}

fun main() {
    val orden1 = OrdenServicio("OS-001", "Carlos", listOf("Cambio de aceite", "Alineacion"), 85.00)
    val orden2 = OrdenServicio("OS-002", "",        emptyList(),                             -10.0)

    // Polimorfismo por interfaz
    fun procesarRegistrable(r: Registrable) = println("-> ${r.registrar()}")
    fun procesarVerificable(v: Verificable) {
        println("Valido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarRegistrable(orden1)   // -> OS-001|Carlos|Cambio de aceite,Alineacion|85.0
    procesarVerificable(orden1)   // Valido: true / Sin errores
    procesarVerificable(orden2)   // Valido: false /❌ ...
}