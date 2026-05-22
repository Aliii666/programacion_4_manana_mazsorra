import 'dart:io';


void main() {
 
  int paquetes = 0;
  int entrada   = 1;
  int empleados = 0;

  while (entrada != 0) {
     print('Ingrese un numero entero:');
        entrada = int.parse(stdin.readLineSync()!);
        paquetes += entrada;
        empleados ++;
  }
    print("paquetes $paquetes");
    if (paquetes<20){
        print("Rendimiento bajor"); 
    
    } else if (paquetes >=50) { 
        print("rendimiento normal");
    } else{
        print("rendimiento excelente");
    }
    print("total de cajas $paquetes");
    print("total de empleados $empleados");
    print("promedio de cajas por empleado ${paquetes/empleados}");

}