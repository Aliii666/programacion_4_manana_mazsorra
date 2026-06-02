abstract class ZonaTaller(val nombre: String) {
    // abstract — las subclases DEBEN implementar esto (herencia forzada)
    abstract val area: Double
    abstract val perimetro: Double
    abstract fun descripcion(): String

    // concreto — disponible en todas las subclases (reutilizacion)
    fun comparar(otra: ZonaTaller): String = when {
        area > otra.area -> "$nombre es mas grande que ${otra.nombre}"
        area < otra.area -> "$nombre es mas pequena que ${otra.nombre}"
        else             -> "$nombre y ${otra.nombre} tienen la misma area"
    }

    // Polimorfismo: toString usa area y descripcion que son polimorficas
    override fun toString() = "${descripcion()} | Area: ${"%.2f".format(area)}"
}

class ZonaCircular(val radio: Double) : ZonaTaller("Zona Circular") {
    override val area:      Double get() = Math.PI * radio * radio
    override val perimetro: Double get() = 2 * Math.PI * radio
    override fun descripcion() = "Zona circular de radio $radio m"
}

class ZonaRectangular(val ancho: Double, val alto: Double) : ZonaTaller("Zona Rectangular") {
    override val area:      Double get() = ancho * alto
    override val perimetro: Double get() = 2 * (ancho + alto)
    override fun descripcion() = "Zona rectangular de ${ancho}x${alto} m"
}

class ZonaTriangular(val lado: Double) : ZonaTaller("Zona Triangular") {
    override val area:      Double get() = (Math.sqrt(3.0) / 4) * lado * lado
    override val perimetro: Double get() = 3 * lado
    override fun descripcion() = "Zona triangular equilatera de lado $lado m"
}

fun main() {
    // POLIMORFISMO: la lista acepta cualquier ZonaTaller
    val zonas: List<ZonaTaller> = listOf(
        ZonaCircular(5.0),
        ZonaRectangular(4.0, 6.0),
        ZonaTriangular(8.0)
    )

    zonas.forEach { println(it) }  // toString polimorfico

    val mayor = zonas.maxByOrNull { it.area }
    println("\nZona mas grande: ${mayor?.nombre}")

    println(zonas[0].comparar(zonas[1]))
}