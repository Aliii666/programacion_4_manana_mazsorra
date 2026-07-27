import 'package:flutter/material.dart';
import 'widgets/catalogo_basicos.dart';
import 'widgets/etiqueta.dart';
import 'widgets/servicio_estado.dart';
import 'widgets/contador_limitado.dart';
import 'widgets/reloj.dart';
import 'screens/pantalla_contexto.dart';
import 'widgets/indicador.dart';

const int paso = 8;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Activo', color: Colors.green),
            Etiqueta(texto: 'Error', color: Colors.red, relleno: true),
            Etiqueta(texto: 'En espera', color: Colors.orange),
            Etiqueta(texto: 'Critico', color: Colors.red, fontSize: 16, relleno: true),
            Etiqueta(texto: 'Info', color: Colors.blue, fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstado(nombre: 'escaneo-obd2-mp'),
      ),
    ),
    5 => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Intentos de escaneo MP',
              limite: 3,
              color: Colors.red,
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Bahias ocupadas MP',
              limite: 10,
              color: Colors.indigo,
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(
      appBar: AppBar(title: const Text('Tiempo de Diagnostico MP')),
      body: const Center(child: Reloj()),
    ),
    7 => const PantallaContexto(),
    8 => Scaffold(
      appBar: AppBar(title: const Text('Composicion de Widgets MP')),
      body: Center(
        child: Wrap(
          spacing: 32,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: const [
            Indicador(label: 'Vehiculos en taller MP', valor: '8',
                      color: Colors.green, icono: Icons.directions_car),
            Indicador(label: 'Alertas criticas MP', valor: '2',
                      color: Colors.red, icono: Icons.warning_amber,
                      subtitulo: 'Requieren atencion'),
            Indicador(label: 'Refacciones MP', valor: '42',
                      color: Colors.indigo, icono: Icons.build),
            Indicador(label: 'Eficiencia MP', valor: '99.8%',
                      color: Colors.teal, subtitulo: 'Ultimos 30 dias'),
            Indicador(label: 'Garantias MP', valor: '3',
                      color: Colors.blueGrey, opacidad: 0.5),
            Indicador(label: 'Vehiculos en taller MP', valor: '8',
                      color: Colors.orange, icono: Icons.directions_car),
          ],
        ),
      ),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: seleccione un paso valido'))),
  },
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sistema de Gestion Taller Mecanico MP',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.deepPurple,
        shadows: [
          Shadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }
}