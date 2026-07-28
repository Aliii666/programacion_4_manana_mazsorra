class Empleado {
	final String nombre;
	final int anios;

	Empleado(this.nombre, this.anios);

	String rol() => 'Empleado';

	void presentarse() {
		print('Soy $nombre, $anios anios, rol: ${rol()}');
	}
}

class Mecanico extends Empleado {
	Mecanico(super.nombre, super.anios);

	@override
	String rol() => 'Mecanico';

	void reparar() => print('$nombre repara un vehiculo');
}

class Recepcionista extends Empleado {
	Recepcionista(super.nombre, super.anios);

	@override
	String rol() => 'Recepcionista';

	void atender() => print('$nombre atiende al cliente');
}

void main() {
	final mecanico = Mecanico('Luis', 5);
	final recepcion = Recepcionista('Maria', 3);

	mecanico.presentarse();
	recepcion.presentarse();

	mecanico.reparar();
	recepcion.atender();
}
