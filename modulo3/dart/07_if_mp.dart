void main() {
	int temperaturaMotor = 98;

	if (temperaturaMotor > 105) {
		print('Sobrecalentado');
	} else if (temperaturaMotor > 90) {
		print('Normal');
	} else {
		print('Frio');
	}

	String estado = temperaturaMotor > 105 ? 'Alerta' : 'Sin alerta';
	print(estado);

	String? observacion;
	String display =
			observacion != null ? observacion.toUpperCase() : 'Sin observacion';

	String display2 = observacion?.toUpperCase() ?? 'Sin observacion';
	print(display2);
}

void main() {
	String? diagnostico;

	if (diagnostico != null) {
		print(diagnostico.length);
	}

	print(diagnostico?.length);

	int longitud = diagnostico?.length ?? 0;
	print(longitud);
}
