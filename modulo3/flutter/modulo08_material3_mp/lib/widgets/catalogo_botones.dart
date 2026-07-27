import 'package:flutter/material.dart';

class CatalogoBotones extends StatelessWidget {
  const CatalogoBotones({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Botones Material 3 Taller MP'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Variantes - de mayor a menor enfasis',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () {},
            child: const Text('FilledButton - accion principal'),
          ),
          const SizedBox(height: 8),
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('FilledButton.tonal - accion secundaria'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ElevatedButton - accion con sombra'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () {},
            child: const Text('OutlinedButton - accion con borde'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {},
            child: const Text('TextButton - accion minima'),
          ),
          const Divider(height: 32),
          Text('Con icono',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.send),
            label: const Text('Enviar reporte Taller MP'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('Exportar logs MP'),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.open_in_new),
            label: const Text('Ver documentacion'),
          ),
          const Divider(height: 32),
          Text('Estados y personalizacion',
              style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          const FilledButton(
            onPressed: null,
            child: Text('No disponible'),
          ),
          const SizedBox(height: 8),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () {},
            child: const Text('Eliminar equipo MP'),
          ),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(
              child: OutlinedButton(onPressed: () {}, child: const Text('Reiniciar')),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton(onPressed: () {}, child: const Text('Apagar')),
            ),
          ]),
        ],
      ),
    );
  }
}