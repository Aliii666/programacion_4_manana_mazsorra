void main() {
  final costos = [29.99, 49.50, 15.00, 99.99];

  // map devuelve un Iterable con cada elemento transformado
  final costosConIva = costos.map((c) => c * 1.15);
  print(costosConIva.toList());
  // [34.4885, 56.925, 17.25, 114.9885]

  // map sobre Strings — rutas de servicios del taller
  final servicios = ['/cambio-aceite', '/alineacion', '/frenos'];
  final urls = servicios.map((s) => 'https://taller.com$s');
  print(urls.toList());
  // [https://taller.com/cambio-aceite, https://taller.com/alineacion, https://taller.com/frenos]
}