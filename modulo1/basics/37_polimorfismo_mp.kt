// La interfaz define el contrato — QUE puede hacer
// Las implementaciones definen el COMO
interface Reparable {
    fun ejecutarServicio(horas: Double): Boolean
    val nombre: String
}

class MecanicaGeneral(val tecnico: String) : Reparable {
    override val nombre = "Mecanica General"
    override fun ejecutarServicio(horas: Double): Boolean {
        println("🔧 Realizando reparacion general por ${"%.2f".format(horas)} hrs — Tecnico: $tecnico")
        return true
    }
}

class Electricidad(val modulo: String) : Reparable {
    override val nombre = "Electricidad"
    override fun ejecutarServicio(horas: Double): Boolean {
        println("⚡ Diagnosticando sistema electrico $modulo por ${"%.2f".format(horas)} hrs")
        return true
    }
}

class Alineacion : Reparable {
    override val nombre = "Alineacion y Balanceo"
    override fun ejecutarServicio(horas: Double): Boolean {
        println("🔩 Ajustando alineacion y balanceo en ${"%.2f".format(horas)} hrs")
        return true
    }
}

// Esta funcion no sabe ni le importa que tipo de servicio es
// Solo sabe que recibe algo que implementa Reparable — POLIMORFISMO
fun atenderVehiculo(horas: Double, servicio: Reparable) {
    println("Iniciando servicio: ${servicio.nombre}...")
    val exito = servicio.ejecutarServicio(horas)
    println(if (exito) "✅ Servicio completado" else "❌ Servicio fallido")
}

fun main() {
    val servicios: List<Reparable> = listOf(