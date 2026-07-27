import 'package:flutter/material.dart';

class PantallaMetricas extends StatelessWidget {
  const PantallaMetricas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Metricas Taller MP')),
      body: const Center(child: Text('Metricas de equipos en tiempo real MP')),
    );
  }
}