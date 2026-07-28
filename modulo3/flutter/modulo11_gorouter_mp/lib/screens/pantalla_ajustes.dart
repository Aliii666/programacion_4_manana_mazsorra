import 'package:flutter/material.dart';

class PantallaAjustes extends StatelessWidget {
  const PantallaAjustes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes Taller MP')),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notificaciones'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.security_outlined),
            title: Text('Seguridad'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Acerca de Taller MP'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}