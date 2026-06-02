// Solo lectura — posicion del carro en el taller
class PosicionCarro(val fila: Double, val columna: Double)

// Lectura y escritura — contador de carros atendidos en el dia
class ContadorCarros(var cantidad: Int = 0) {
    fun agregarCarro() { cantidad++ }
    fun reiniciar()    { cantidad = 0 }
}

// Sin val/var — parametro del constructor, NO propiedad
// Solo accesible dentro del bloque init
class RegistroCliente(nombre: String) {
    val nombreUpper = nombre.uppercase()
    // nombre no existe fuera de aqui
}

fun main() {
    // Posicion del carro en el taller
    val posicion = PosicionCarro(2.0, 5.0)
    println("Fila: ${posicion.fila}, Columna: ${posicion.columna}")

    // Contador de carros atendidos
    val contador = ContadorCarros()
    contador.agregarCarro()
    contador.agregarCarro()
    contador.agregarCarro()
    println("Carros atendidos hoy: ${contador.cantidad}")
    contador.reiniciar()
    println("Contador reiniciado: ${contador.cantidad}")

    // Registro del cliente
    val registro = RegistroCliente("Aliyha")
    println("Cliente registrado: ${registro.nombreUpper}")
    // registro.nombre  // ERROR — nombre no es propiedad
}