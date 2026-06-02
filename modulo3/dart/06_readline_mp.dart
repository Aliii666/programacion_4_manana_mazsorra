import 'dart:io';

void main() {
	print('Ingrese el nombre del cliente:');
	String? cliente = stdin.readLineSync();
	print('Cliente: $cliente');

	print('Ingrese la placa del vehiculo:');
	String? placa = stdin.readLineSync();
	print('Placa: $placa');

	print('Ingrese el kilometraje:');
	int km = int.parse(stdin.readLineSync()!);
	print('Kilometraje: $km');

	print('Ingrese el costo de repuestos:');
	double repuestos = double.parse(stdin.readLineSync()!);

	print('Ingrese el costo de mano de obra:');
	double manoObra = double.parse(stdin.readLineSync()!);

	double total = repuestos + manoObra;
	print('Total a pagar: $total');
}
