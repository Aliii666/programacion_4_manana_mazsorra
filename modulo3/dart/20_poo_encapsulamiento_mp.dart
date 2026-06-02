class CajaTaller {
	final String encargado;
	double _saldo;

	CajaTaller(this.encargado, double saldoInicial) : _saldo = saldoInicial;

	double get saldo => _saldo;

	void ingresar(double monto) {
		if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
		_saldo += monto;
		print('Ingreso de \$${monto}. Saldo: \$$_saldo');
	}

	void egresar(double monto) {
		if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
		if (monto > _saldo) throw StateError('Saldo insuficiente');
		_saldo -= monto;
		print('Egreso de \$${monto}. Saldo: \$$_saldo');
	}
}

void main() {
	final caja = CajaTaller('Aliyha', 500.0);

	caja.ingresar(200.0);
	caja.egresar(150.0);
	print(caja.saldo);
}
