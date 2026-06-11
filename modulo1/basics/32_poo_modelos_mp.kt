data class Servicio(
    val id:         Int,
    val nombre:     String,
    val costo:      Double,
    val categoria:  String,
    val activo:     Boolean = true
)

fun main() {
    System.setOut(java.io.PrintStream(System.out, true, "UTF-8"))

    val s1 = Servicio(1, "Cambio de aceite",      35.00, "Mantenimiento")
    val s2 = Servicio(1, "Cambio de aceite",      35.00, "Mantenimiento")
    val s3 = Servicio(2, "Alineación y balanceo", 50.00, "Neumáticos")

    // toString() automático
    println(s1)  // Servicio(id=1, nombre=Cambio de aceite, costo=35.0, categoria=Mantenimiento, activo=true)

    // equals() por valor
    println(s1 == s2)   // true
    println(s1 == s3)   // false

    // copy() — nuevo objeto con cambios puntuales
    val conDescuento = s1.copy(costo = 25.00)
    val inactivo     = s1.copy(activo = false)

    // Desestructuración
    val (id, nombre, costo) = s1
    println("$id: $nombre — $$costo")

    // En bucles
    listOf(s1, s3).forEach { (id2, nombre2, costo2) ->
        println("[$id2] $nombre2: $$costo2")
    }
}