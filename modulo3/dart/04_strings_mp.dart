void main() {
  final cliente = 'Aliyha';
  final km      = 45000;

  // Interpolacion con $ (igual que en Kotlin)
  print('Cliente: $cliente');                    // Cliente: Aliyha

  // Expresion con ${ }
  print('${cliente.toUpperCase()} tiene ${km + 1000} km en su proximo servicio');

  // String multilinea con triple comillas
  final ficha = '''
Cliente: $cliente
Km:      $km
Revision: ${km >= 40000 ? 'Si' : 'No'}
  ''';
  print(ficha);

  // Raw string — ignora el escape y la interpolacion
  final ruta = r'C:\Taller\Aliyha\Ordenes';  // el \ no se interpreta
  print(ruta);

  // Concatenacion (menos idiomatico — preferir interpolacion)
  final saludo = 'Bienvenida, ' + cliente + '!';

  // Metodos utiles de String
  print('toyota'.toUpperCase());               // TOYOTA
  print('  Cambio de aceite  '.trim());        // Cambio de aceite
  print('Alineacion'.contains('nea'));         // true
  print('Balanceo'.replaceAll('a', 'A'));      // BAlAnceo
  print('Frenos,Aceite,Llantas'.split(','));   // [Frenos, Aceite, Llantas]
  print('Chevrolet'.substring(0, 5));          // Chevr
  print('Toyota'.startsWith('Toy'));           // true
  print('7'.padLeft(5, '0'));                  // 00007
}