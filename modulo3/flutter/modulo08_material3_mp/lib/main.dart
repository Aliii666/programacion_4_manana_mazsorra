import 'package:flutter/material.dart';
import 'screens/pantalla_tema.dart';
import 'screens/pantalla_appbar.dart';
import 'widgets/catalogo_botones.dart';
import 'screens/pantalla_navegacion.dart';
import 'screens/pantalla_dialogs.dart';

const int paso = 6;

void main() => runApp(const AppMonitoreo());

class AppMonitoreo extends StatefulWidget {
  const AppMonitoreo({super.key});
  @override
  State<AppMonitoreo> createState() => _AppMonitoreoState();
}

class _AppMonitoreoState extends State<AppMonitoreo> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF1565C0);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => PantallaTema(
            themeMode: _themeMode,
            onToggle: (mode) => setState(() => _themeMode = mode),
          ),
        3 => const PantallaAppBar(),
        4 => const CatalogoBotones(),
        5 => const PantallaNavegacion(),
        6 => const PantallaDialogs(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: seleccione un paso valido'))),
      },
    );
  }
}

class _Paso1 extends StatelessWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Taller MP'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.build, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Escaneo OBD2 MP-01',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '192.168.1.10 - Sistema Taller MP',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.build_circle),
              label: const Text('Conectar OBD2'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Agregar equipo MP',
        child: const Icon(Icons.add),
      ),
    );
  }
}