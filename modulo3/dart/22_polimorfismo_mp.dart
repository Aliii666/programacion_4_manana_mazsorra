abstract class Trabajo {
	String get nombre;
	double costo();
}

class ServicioBasico extends Trabajo {
	final double base;
	ServicioBasico(this.base);

	@override
	String get nombre => 'Servicio basico';

	@override
	double costo() => base;
}

class ServicioMayor extends Trabajo {
	final double base;
	ServicioMayor(this.base);

	@override
	String get nombre => 'Servicio mayor';

	@override
	double costo() => base * 1.5;
}

class Pintura extends Trabajo {
	final double base;
	Pintura(this.base);

	@override
	String get nombre => 'Pintura';

	@override
	double costo() => base * 2.0;
}

void imprimirCosto(Trabajo trabajo) {
	print('${trabajo.nombre}: ${trabajo.costo().toStringAsFixed(2)}');
}

void main() {
	final trabajos = <Trabajo>[
		ServicioBasico(60),
		ServicioMayor(80),
		Pintura(50),
	];

	for (final t in trabajos) {
		imprimirCosto(t);
	}

	final mayor = trabajos.reduce(
		(a, b) => a.costo() > b.costo() ? a : b,
	);
	print('Trabajo mas caro: ${mayor.nombre}');
}
