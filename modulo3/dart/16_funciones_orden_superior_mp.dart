void main() {
	final costos = [25.0, 40.0, 15.0, 60.0];

	final costosConIva = costos.map((c) => c * 1.12);
	print(costosConIva.toList());

	final ordenes = ['OS-001', 'OS-002', 'OS-003'];
	final etiquetas = ordenes.map((o) => 'Orden: $o');
	print(etiquetas.toList());
}
