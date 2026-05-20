import 'dart:io';

void main() {
  print('Ingrese un numero para ver la tabla de multiplicar:');
  int numero = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 10; i++) {
    print('$numero x $i = ${numero * i}');
  }
}