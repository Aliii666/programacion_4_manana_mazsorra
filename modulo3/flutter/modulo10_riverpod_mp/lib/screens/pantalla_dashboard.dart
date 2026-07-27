import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pantalla_servidores.dart';
import 'pantalla_metricas.dart';

final indiceTabProvider = StateProvider<int>((ref) => 0);

class PantallaDashboard extends ConsumerWidget {
  const PantallaDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indice = ref.watch(indiceTabProvider);

    return Scaffold(
      body: switch (indice) {
        0 => const PantallaServidores(),
        1 => const PantallaMetricas(),
        _ => const PantallaServidores(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex: indice,
        onDestinationSelected: (i) =>
            ref.read(indiceTabProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.build_outlined),
            selectedIcon: Icon(Icons.build),
            label: 'Equipos MP',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Metricas',
          ),
        ],
      ),
    );
  }
}