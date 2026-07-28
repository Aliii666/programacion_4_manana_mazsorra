abstract class Servicio {
	String get nombre;
	double calcularCosto();
	double calcularTiempo();

	void describir() {
		print('$nombre - costo: ${calcularCosto().toStringAsFixed(2)}, '
				'tiempo: ${calcularTiempo().toStringAsFixed(1)}h');
	}
}

class CambioAceite extends Servicio {
	final double litros;
	CambioAceite(this.litros);

	@override
	String get nombre => 'Cambio de aceite ($litros L)';

	@override
	double calcularCosto() => 12.5 * litros;

	@override
	double calcularTiempo() => 1.0;
}

class ReparacionFrenos extends Servicio {
	final int ejes;
	ReparacionFrenos(this.ejes);

	@override
	String get nombre => 'Reparacion de frenos ($ejes ejes)';

	@override
	double calcularCosto() => 60.0 * ejes;

	@override
	double calcularTiempo() => 2.5 * ejes;
}

void main() {
	final servicios = <Servicio>[CambioAceite(4), ReparacionFrenos(2)];
	for (final s in servicios) {
		s.describir();
	}
}
