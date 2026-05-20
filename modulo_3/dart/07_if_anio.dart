import 'dart:io';

void main() {
    print('Ingrese un año: ');
  int anio = int.parse(stdin.readLineSync()!);

  if ((anio % 4 == 0 && anio % 100 != 0) || (anio % 400 == 0)) {
    print('El año es bisiesto');
  } else {
    print('El año no es bisiesto');
  }
}