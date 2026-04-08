fun main() {
    println("Tipos de Datos")
    println("Numeros Enteros")
    val numero1: Byte=127
    println("Numero byte $numero1")
    val numero2: Short=32_765
    println("Numero short $numero2")
    val numero3: Int=12
    println("Numero int $numero3")
    val numero4: Long=12_122_122_122_123_123L
    println("Numero long $numero4")
    val numero5: Float=3.14f
    println("Numero float $numero5")
    val numero6: Double=3.14159265
    println("Numero double $numero6")
    
    
    //Inferido
    val nombre="Juana"
    val edad=56
    
    println("Nombre $nombre")
    val nombreTipo=nombre::class.simpleName
    println("Tipo inferido : ${nombre::class.simpleName}")
    println("Tipo inferido : $nombreTipo")
    
    println("Edad $edad")
    val edadTipo=nombre::class.simpleName
    println("Tipo edad : ${edad::class.simpleName}")
    println("Tipo inferido : $edadTipo")
    
    
}