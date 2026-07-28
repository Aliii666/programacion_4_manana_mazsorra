class OrdenServicio {
	final String numero;
	final String placa;
	final String servicio;
	final int prioridad;
	final bool enGarantia;

	OrdenServicio({
		required this.numero,
		required this.placa,
		required this.servicio,
		this.prioridad = 3,
		this.enGarantia = false,
	});

	OrdenServicio.rapida({required this.numero, required this.placa})
			: servicio = 'Diagnostico rapido',
				prioridad = 1,
				enGarantia = false;

	OrdenServicio.garantia({required this.numero, required this.placa})
			: servicio = 'Revision garantia',
				prioridad = 2,
				enGarantia = true;

	factory OrdenServicio.desdeCodigo(String codigo) {
		final partes = codigo.split('-');
		if (partes.length >= 4) {
			return OrdenServicio(
				numero: '${partes[0]}-${partes[1]}-${partes[2]}',
				placa: partes[3],
				servicio: partes.length > 4 ? partes[4] : 'Servicio general',
			);
		}
		return OrdenServicio(
			numero: codigo,
			placa: 'SIN-PLACA',
			servicio: 'Servicio general',
		);
	}

	@override
	String toString() {
		return 'Orden $numero | $placa | $servicio | prioridad $prioridad | garantia $enGarantia';
	}
}

void main() {
	final o1 = OrdenServicio(
		numero: 'OS-2026-0001',
		placa: 'ABC-123',
		servicio: 'Cambio de aceite',
		prioridad: 3,
	);
	final o2 = OrdenServicio.rapida(numero: 'OS-2026-0002', placa: 'XYZ-789');
	final o3 = OrdenServicio.garantia(numero: 'OS-2026-0003', placa: 'TUV-456');
	final o4 = OrdenServicio.desdeCodigo('OS-2026-0004-DEF-456-Alineacion');

	print(o1);
	print(o2);
	print(o3);
	print(o4);
}
