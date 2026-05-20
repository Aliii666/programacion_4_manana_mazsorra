import 'dart:io';

void main() {
  print('Ingrese su nombre:');  // Imprime sin salto de línea

  String? nombre = stdin.readLineSync();   // Lee una línea de entrada

  print('Hola, $nombre');      

  print('Ingrese su numero entero:');
  int numero = int.parse(stdin.readLineSync()!);  
  print('numero: $numero');

  print('Ingrese un decimal:')
  double valor = double.parse(stdin.readLineSync()!);
  print('valor: $valor');

  


}