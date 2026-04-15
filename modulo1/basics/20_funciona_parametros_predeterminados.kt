// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
    println("Funciones-Parametros por defecto")
    println(crearUsuario("Jhon", 25, "admin", true))
    println(crearUsuario("Luis"))
    println(crearUsuario("Maria", 30))
    println(crearUsuario("Juan", 30, "admin"))
    
    //Argumentos nombrados
    println(crearUsuario(edad=30, nombre="Yamilet", activo=false))
    
}

fun crearUsuario(
    nombre: String,
    edad: Int=18,
    rol: String ="Viewer",
    activo: Boolean = true
): String {
    return "Usuario[$nombre, edad=$edad, rol=$rol, activo =$activo]"
}