import 'dart:io';

void main() {
  int piezas = -1;
  int total = 0;

  while (piezas != 0) {
    print("Ingrese la cantidad de piezas producidas (0 para terminar): ");
    piezas = int.parse(stdin.readLineSync()!);

    if (piezas == 0) {
      break;
    }

    if (piezas < 50) {
      print("Producción baja");
    } else {
      print("Producción adecuada");
    }

    total += piezas;
  }

  print("Total de piezas producidas: $total");
}