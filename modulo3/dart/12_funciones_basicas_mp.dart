double sumarCostos(double a, double b) {
  return a + b;
}

double multiplicarHoras(double horas, double tarifa) => horas * tarifa;

void imprimirSeparador(String titulo) {
  print('--- $titulo ---');
}

String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

String construirOrden(String cliente, String placa, [String? tecnico]) {
  if (tecnico != null) {
    return 'Orden de $cliente ($placa) - tecnico: $tecnico';
  }
  return 'Orden de $cliente ($placa)';
}

String construirOrdenV2(String cliente, String placa, [String tecnico = 'N/A']) {
  return 'Orden de $cliente ($placa) - tecnico: $tecnico';
}

void main() {
  print(sumarCostos(25.0, 40.0));
  print(multiplicarHoras(2.5, 15.0));
  imprimirSeparador('Ingreso');
  print(formatearPrecio(1299.9));
  print(formatearPrecioSinTipo(1299.9));
  print(construirOrden('Aliyha', 'ABC-123'));
  print(construirOrden('Aliyha', 'ABC-123', 'Luis'));
  print(construirOrdenV2('Carlos', 'XYZ-789'));
}
