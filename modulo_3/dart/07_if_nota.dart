import 'dart:io';
void main() {
  print ('Ingrese tu calificacion:');
  int numero = int.parse(stdin.readLineSync()!);
  if (numero >= 7) {
    print('Aprobado');
  } else if (numero < 7)
    print('Reprobado');

}