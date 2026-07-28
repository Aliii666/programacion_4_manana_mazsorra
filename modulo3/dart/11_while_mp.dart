void main() {
	int ordenes = 0;
	int pendientes = 5;

	while (pendientes > 0) {
		ordenes++;
		pendientes--;
		print('Orden atendida $ordenes (pendientes: $pendientes)');
	}

	int reintentos = 0;
	bool diagnosticoListo = false;

	do {
		reintentos++;
		print('Intento de diagnostico #$reintentos...');
		if (reintentos == 2) diagnosticoListo = true;
	} while (!diagnosticoListo && reintentos < 4);

	print(diagnosticoListo
			? 'Diagnostico listo en $reintentos intentos'
			: 'No se pudo completar el diagnostico');
}
