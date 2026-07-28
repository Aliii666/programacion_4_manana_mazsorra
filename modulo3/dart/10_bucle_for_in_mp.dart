void main() {
	final servicios = ['Cambio de aceite', 'Alineacion', 'Balanceo'];
	for (final s in servicios) {
		print('Servicio: $s');
	}

	final repuestos = {
		'Filtro aceite': 12.5,
		'Pastillas freno': 45.0,
		'Bujias': 18.0,
	};
	for (final entry in repuestos.entries) {
		print('${entry.key}: ${entry.value}');
	}

	final tecnicos = {'Luis', 'Maria', 'Carlos'};
	for (final t in tecnicos) {
		print('Tecnico: $t');
	}
}
