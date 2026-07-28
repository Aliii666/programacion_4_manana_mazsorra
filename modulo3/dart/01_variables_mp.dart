void main() {
  // var — tipo inferido (como val en Kotlin)
  var cliente  = 'Aliyha';      // String
  var edad     = 28;             // int
  var precio   = 89.99;          // double
  var activo   = true;           // bool

  // Tipo explicito
  String apellido = 'Torres';
  int    km       = 45000;
  double aceite   = 3.14159;
  bool   pagado   = false;

  // final — no se puede reasignar (como val en Kotlin)
  final taller = 'Taller Aliyha';
  // taller = 'Otro Taller';  // ERROR — final no se puede reasignar

  // const — constante en tiempo de compilacion (como const en Kotlin)
  const iva        = 0.12;
  const maxTurnos  = 10;

  // Diferencia clave: final vs const
  final fechaIngreso = DateTime.now();   // OK — se evalua en runtime
  // const fechaIngreso = DateTime.now(); // ERROR — DateTime.now() no es constante de compilacion

  print('$cliente $apellido ingreso su vehiculo al $taller con $km km');

  // var — mutable, tipo inferido
  var turno = 0;
  turno = 1;          // OK

  // final — inmutable referencia, evaluada en runtime
  final servicios = ['Cambio de aceite', 'Alineacion'];
  servicios.add('Balanceo');   // OK — la referencia es final, no el contenido
  // servicios = ['Otro'];     // ERROR — no se puede reasignar la referencia

  // const — inmutable profundo, evaluado en compilacion
  const estados = ['Pendiente', 'En proceso', 'Listo'];
  // estados.add('Cancelado'); // ERROR — lista const es completamente inmutable
}