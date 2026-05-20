import 'dart:io';

void main() {
  int cajas = -1;
  int totalCajas = 0;
  int totalEmpleados = 0;

  while (cajas != 0) {
    print("Ingrese la cantidad de cajas empacadas (0 para terminar): ");
    cajas = int.parse(stdin.readLineSync()!);

    if (cajas == 0) {
      break;
    }

    if (cajas <= 20) {
      print("Rendimiento bajo");

    } 
    else if (cajas <= 50) {
      print("Rendimiento normal");
  
    } 
    else {
      print("Rendimiento excelente");
      
    }

    totalEmpleados +=1;
    totalCajas += cajas;
  }

  print("Total de cajas empacadas: $totalCajas");
  print("Total de  empleados: $totalEmpleados");
  print("Promedio: ${totalCajas / totalEmpleados }");
}