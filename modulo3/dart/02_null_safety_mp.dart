void main() {
  // Tipo no-nullable — NUNCA puede ser null
  String cliente = 'Aliyha';
  // cliente = null;       // ERROR de compilacion

  // Tipo nullable — puede ser null (anadir ?)
  String? apellido = null;   // OK
  apellido = 'Torres';       // OK

  // Operadores de null safety
  String? placa;

  // ?. — safe call (igual que en Kotlin)
  print(placa?.length);      // null — no lanza excepcion

  // ?? — operador Elvis (igual que ?: en Kotlin)
  String resultado = placa ?? 'Sin placa registrada';
  print(resultado);           // Sin placa registrada

  // ! — non-null assertion (igual que !! en Kotlin) — usalo con precaucion
  String placaSegura = placa!;  // lanza si placa es null

  // Null check con if
  if (apellido != null) {
    print(apellido.length);   // smart cast — ya es String aqui
  }

  // late — inicializacion diferida (como lateinit en Kotlin)
  late String ordenServicio;
  ordenServicio = 'OS-001';           // debe asignarse antes de usar
  print(ordenServicio);
}