void main() {
  // List — lista ordenada (como List en Kotlin)
  List<String> servicios  = ['Cambio de aceite', 'Alineacion', 'Balanceo'];
  var          precios    = [25.0, 40.0, 35.0, 15.0, 60.0];  // tipo inferido: List<double>

  print(servicios[0]);        // Cambio de aceite
  print(servicios.length);    // 3
  servicios.add('Frenos');
  servicios.remove('Alineacion');

  // Map — clave -> valor (como Map en Kotlin)
  Map<String, int> kmVehiculos = {
    'Aliyha':  45000,
    'Carlos':  120000,
    'Luis':    87000,
  };

  print(kmVehiculos['Aliyha']);   // 45000
  print(kmVehiculos['Pedro']);    // null — clave no existe
  kmVehiculos['Maria'] = 63000;   // anadir

  // Set — sin duplicados (como Set en Kotlin)
  Set<String> marcas = {'Toyota', 'Ford', 'Chevrolet'};
  marcas.add('Toyota');      // ignorado — ya existe
  print(marcas.length);      // 3

  // Spread operator — para combinar colecciones
  var turnosManana = ['OS-001', 'OS-002', 'OS-003'];
  var turnosTarde  = ['OS-004', 'OS-005', 'OS-006'];
  var todosLosTurnos = [...turnosManana, ...turnosTarde];
  print(todosLosTurnos);

  // Collection if — elementos condicionales
  bool incluyeLavado = true;
  var ordenServicios = [
    'Cambio de aceite',
    'Revision de frenos',
    if (incluyeLavado) 'Lavado completo',  // solo si la condicion es true
  ];

  // Collection for — generar elementos
  var descuentos = [for (var i = 1; i <= 5; i++) i * 5];
  print(descuentos);  // [5, 10, 15, 20, 25]
}