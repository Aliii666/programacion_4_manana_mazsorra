void programarCita({
	required String cliente,
	required String placa,
	bool lavado = true,
	int diasGarantia = 30,
}) {
	final extra = lavado ? 'con lavado' : 'sin lavado';
	print('Cita: $cliente ($placa), $extra, garantia: $diasGarantia dias');
}

void main() {
	programarCita(
		cliente: 'Aliyha',
		placa: 'ABC-123',
		lavado: false,
		diasGarantia: 60,
	);

	programarCita(
		cliente: 'Carlos',
		placa: 'XYZ-789',
	);
}
