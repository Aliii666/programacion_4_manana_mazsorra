class Vehiculo {
	final String id;
	final String propietario;
	String placa;
	int km;
	bool _enTaller = false;

	Vehiculo({
		required this.id,
		required this.propietario,
		required this.placa,
		required this.km,
	});

	bool get enTaller => _enTaller;
	String get estado => _enTaller ? 'en taller' : 'entregado';

	set estadoEnTaller(bool valor) {
		_enTaller = valor;
		print('$placa: ${valor ? "ingresado" : "entregado"}');
	}

	void ingresar() {
		_enTaller = true;
		print('$placa ingreso con $km km');
	}

	void entregar() {
		_enTaller = false;
		print('$placa entregado al cliente');
	}

	String resumen() =>
			'ID: $id | Propietario: $propietario | Placa: $placa | Estado: $estado';

	@override
	String toString() => 'Vehiculo($placa, $propietario, $km km, $estado)';
}

void main() {
	final auto = Vehiculo(
		id: 'VEH-001',
		propietario: 'Aliyha',
		placa: 'ABC-123',
		km: 45000,
	);

	auto.ingresar();
	print(auto.estado);
	print(auto.resumen());
	print(auto);

	auto.estadoEnTaller = false;
	print(auto.enTaller);
}
