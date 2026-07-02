// lib/screens/pantalla_servidores.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';
import '../providers/auth_provider.dart';

class PantallaServidores extends ConsumerWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth     = ref.watch(authProvider);
    final usuario  = auth is Autenticado ? auth.usuario : '';
    final cs       = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Servidores',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Hola, $usuario',
                style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount:        servidoresSimulados.length,
        separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
        itemBuilder: (context, i) {
          final s = servidoresSimulados[i];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: s.ssl
                  ? Colors.green.shade50
                  : Colors.grey.shade100,
              child: Icon(Icons.dns,
                  color: s.ssl ? Colors.green.shade700 : Colors.grey),
            ),
            title:    Text(s.nombre,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text('${s.ip}:${s.puerto}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/servidores/${s.id}', extra: s),
          );
        },
      ),
    );
  }
}