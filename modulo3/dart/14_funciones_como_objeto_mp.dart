int aplicarDescuento(int precio) => (precio * 0.9).round();
int aplicarRecargo(int precio) => (precio * 1.1).round();

void main() {
	int Function(int) operacion;

	operacion = aplicarDescuento;
	print(operacion(100));

	operacion = aplicarRecargo;
	print(operacion(100));

	final ajustes = <int Function(int)>[aplicarDescuento, aplicarRecargo];
	for (final fn in ajustes) {
		print(fn(200));
	}
}
