// Sintaxis completa — preferida para funciones públicas
int sumar(int a, int b) {
  return a + b;
}

// Sintaxis de flecha — cuando el cuerpo es una sola expresión
int multiplicar(int a, int b) => a * b;

// void — cuando no se devuelve nada
void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

// Con tipo explícito — recomendado
String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

// Sin tipo — Dart infiere que retorna String
formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

// El tercer parámetro es opcional — puede omitirse al llamar
String construirUrl(String host, String ruta, [int? puerto]) {
  if (puerto != null) {
    return 'https://$host:$puerto$ruta';
  }
  return 'https://$host$ruta';
}

// Con valor por defecto — evita el chequeo de null
String construirUrlV2(String host, String ruta, [int puerto = 443]) {
  return 'https://$host:$puerto$ruta';
}

void main() {
  print(sumar(5, 3));          // 8
  print(multiplicar(4, 6));    // 24
  imprimirSeparador('Inicio'); // ─── Inicio ───
  print(formatearPrecio(1299.9));  // $1299.90
  print(formatearPrecioSinTipo(1299.9));  // $1299.90
  print(construirUrl('api.ejemplo.com', '/usuarios'));          // https://api.ejemplo.com/usuarios
  print(construirUrl('api.ejemplo.com', '/usuarios', 8080));   // https://api.ejemplo.com:8080/usuarios
  print(construirUrlV2('api.ejemplo.com', '/productos'));       // https://api.ejemplo.com:443/productos
}

