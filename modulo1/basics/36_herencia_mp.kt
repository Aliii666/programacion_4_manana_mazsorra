// Sin open — no se puede heredar (protección por defecto)
class Vehiculo(val marca: String)
// class Coche : Vehiculo("Toyota")  // ERROR — Vehiculo es final

// Con open — la jerarquía está diseñada para ello
open class Vehiculo(val marca: String, val tipoMotor: String) {
    // open — la subclase PUEDE sobreescribir
    open fun encender() = println("$marca arranca con motor $tipoMotor")
    open fun descripcion() = "Vehículo: $marca"

    // Sin open — la subclase NO puede sobreescribir
    fun revisarAceite() = println("$marca: revisando nivel de aceite")
}

// HERENCIA: Coche reutiliza todo de Vehiculo y especializa encender
class Coche(marca: String) : Vehiculo(marca, "gasolina") {
    override fun encender() {
        super.encender()                        // reutiliza la implementación del padre
        println("(verificando presión de neumáticos)")  // añade comportamiento propio
    }
    override fun descripcion() = "${super.descripcion()}, un coche"
}

class Camioneta(marca: String, val traccion4x4: Boolean) : Vehiculo(marca, "diésel") {
    override fun descripcion() =
        "${super.descripcion()}, una camioneta ${if (traccion4x4) "con tracción 4x4" else "de tracción simple"}"
}

fun main() {
    val coche = Coche("Toyota")
    coche.encender()
    // Toyota arranca con motor gasolina
    // (verificando presión de neumáticos)

    val camioneta = Camioneta("Ford", true)
    println(camioneta.descripcion())  // Vehículo: Ford, una camioneta con tracción 4x4

    // Herencia — Coche y Camioneta tienen todo lo de Vehiculo más lo propio
    coche.revisarAceite()  // Toyota: revisando nivel de aceite — heredado de Vehiculo
}