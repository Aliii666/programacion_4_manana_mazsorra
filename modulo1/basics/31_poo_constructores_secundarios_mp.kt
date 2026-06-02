class EspacioCarro(val ancho: Double, val largo: Double) {
    val area:      Double get() = ancho * largo
    val perimetro: Double get() = 2 * (ancho + largo)

    // Siempre llaman al constructor primario con this(...)
    constructor(lado: Double) : this(lado, lado)
    constructor(ancho: Int, largo: Int) : this(ancho.toDouble(), largo.toDouble())

    override fun toString() = "Espacio del carro(${ancho}x${largo}) | area=${area} m2"
}

fun main() {
    val espacio1 = EspacioCarro(5.0, 3.0)   // espacio rectangular
    val espacio2 = EspacioCarro(4.0)         // espacio cuadrado
    val espacio3 = EspacioCarro(6, 2)        // espacio con medidas en Int

    println(espacio1)  // Espacio del carro(5.0x3.0) | area=15.0 m2
    println(espacio2)  // Espacio del carro(4.0x4.0) | area=16.0 m2
    println(espacio3)  // Espacio del carro(6.0x2.0) | area=12.0 m2
}