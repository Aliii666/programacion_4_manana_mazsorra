class ClienteTaller(val nombre: String, val email: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        // Encapsulamiento en accion: validamos antes de construir
        require(nombre.isNotBlank()) { "El nombre no puede estar vacio" }
        require(email.contains("@")) { "Email invalido: $email" }

        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail      = email.substringAfter("@")
    }
}

fun main() {
    val cliente = ClienteTaller("  Aliyha  ", "aliyha@taller.com")
    println(cliente.nombreNormalizado)  // aliyha
    println(cliente.dominioEmail)       // taller.com

    // ClienteTaller("", "invalido")   // IllegalArgumentException — require falla
}