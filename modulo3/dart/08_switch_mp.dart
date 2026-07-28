void main() {
	String estadoOrden = 'E';

	switch (estadoOrden) {
		case 'P':
			print('Pendiente');
		case 'E':
			print('En proceso');
		case 'L':
			print('Listo');
		case 'C':
			print('Cancelado');
		default:
			print('Estado desconocido');
	}

	String tipoServicio = 'ACE';

	String descripcion = switch (tipoServicio) {
		'ACE' => 'Cambio de aceite',
		'ALI' => 'Alineacion',
		'BAL' => 'Balanceo',
		'FRE' => 'Revision de frenos',
		_ => 'Servicio no registrado',
	};
	print(descripcion);

	int prioridad = 2;

	String categoria = switch (prioridad) {
		1 || 2 => 'Alta',
		3 || 4 => 'Media',
		5 => 'Baja',
		_ => 'Sin prioridad',
	};

	print(categoria);

	double desgasteFrenos = 78.5;

	String alerta = switch (desgasteFrenos) {
		double d when d >= 85.0 => 'Critico: cambiar pastillas',
		double d when d >= 70.0 => 'Alto desgaste',
		double d when d >= 50.0 => 'Desgaste medio',
		double d when d >= 30.0 => 'Desgaste leve',
		_ => 'Sin desgaste relevante',
	};

	print(alerta);
}
