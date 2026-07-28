import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/servidor_ssh.dart';

class PantallaServidoresFiltro extends StatelessWidget {
  final bool soloSSL;
  const PantallaServidoresFiltro({super.key, required this.soloSSL});

  @override
  Widget build(BuildContext context) {
    final lista = soloSSL
        ? servidoresSimulados.where((s) => s.ssl).toList()
        : servidoresSimulados;

    return Scaffold(
      appBar: AppBar(title: Text('Equipos (SSL: $soloSSL)')),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, i) {
          final s = lista[i];
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