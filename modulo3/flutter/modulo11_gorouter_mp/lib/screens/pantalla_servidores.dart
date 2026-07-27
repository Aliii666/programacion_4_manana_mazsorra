import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaServidores extends StatelessWidget {
  const PantallaServidores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Equipos Taller MP')),
      body: ListView.builder(
        itemCount: servidoresSimulados.length,
        itemBuilder: (context, i) {
          final s = servidoresSimulados[i];
          return ListTile(
            leading: const Icon(Icons.build),
            title: Text(s.nombre),
            subtitle: Text('${s.ip}:${s.puerto}'),
            onTap: () => context.go('/servidores/${s.id}', extra: s),
          );
        },
      ),
    );
  }
}