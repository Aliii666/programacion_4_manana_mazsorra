class BahiaTaller(mecanico: String, capacidadInicial: Double) {

    val mecanico: String = mecanico         // publico — cualquiera puede leer

    private var capacidadDisponible: Double = capacidadInicial  // privado — solo esta clase lo modifica

    internal val codigoBahia: String =      // internal — visible en el mismo modulo
        "BH${(100000..999999).random()}"

    protected open fun calcularCostoServicio(): Double = capacidadDisponible * 0.02  // protected — visible en subclases

    // La capacidad solo cambia a traves de estos metodos — NUNCA directamente
    fun ingresarCarro(costo: Double) {
        require(costo > 0) { "El costo debe ser positivo" }
        capacidadDisponible += costo
        println("Carro ingresado: $${"%.2f".format(costo)} | Capacidad actual: ${consultarCapacidad()}")
    }

    fun retirarCarro(costo: Double): Boolean {
        require(costo > 0) { "El costo debe ser positivo" }
        if (costo > capacidadDisponible) {
            println("Capacidad insuficiente en la bahia")
            return false
        }
        capacidadDisponible -= costo
        println("Carro retirado: $${"%.2f".format(costo)} | Capacidad actual: ${consultarCapacidad()}")
        return true
    }

    fun consultarCapacidad(): String = "${"%.2f".format(capacidadDisponible)} espacios"
}

fun main() {
    val bahia = BahiaTaller("Aliyha", 1000.0)

    bahia.ingresarCarro(500.0)
    bahia.retirarCarro(200.0)
    bahia.retirarCarro(2000.0)

    println(bahia.mecanico)
    println(bahia.consultarCapacidad())
    // bahia.capacidadDisponible = 999999.0  // ERROR — capacidadDisponible es privado
}