import 'package:flutter/material.dart';
import 'widgets/tarjeta_log.dart';
import 'widgets/fila_estado.dart';
import 'widgets/avatar_badge.dart';

const int paso = 5;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: switch (paso) {
      1 => _paso1(),
      2 => Scaffold(
        body: ListView(
          children: [
            TarjetaLog(
              nivel: 'ERROR',
              componente: 'servicio-frenos',
              mensaje: 'Falla en presion de fluido - requiere revision',
              timestamp: DateTime.now(),
            ),
            TarjetaLog(
              nivel: 'WARN',
              componente: 'inventario-repuestos',
              mensaje: 'Pastillas de freno bajas: 2 juegos restantes',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
            ),
            TarjetaLog(
              nivel: 'INFO',
              componente: 'mantenimiento',
              mensaje: 'Cambio de aceite completado con exito MP',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
            ),
            TarjetaLog(
              nivel: 'DEBUG',
              componente: 'obd2-scanner',
              mensaje: 'GET /escaneo/status -> 200 OK (38ms)',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
            ),
          ],
        ),
      ),
      3 => const Scaffold(
        body: Column(
          children: [
            FilaEstado(
              nombre: 'escaneo-obd2-mp',
              detalle: '192.168.1.5 - 45ms',
              activo: true,
            ),
            Divider(height: 1),
            FilaEstado(
              nombre: 'elevador-hidraulico-1',
              detalle: 'Bahia 01 - Operativo',
              activo: true,
            ),
            Divider(height: 1),
            FilaEstado(
              nombre: 'alineadora-laser-mp',
              detalle: 'Bahia 03 - En mantenimiento',
              activo: false,
            ),
            Divider(height: 1),
            FilaEstado(
              nombre: 'sistema-diagnostico-taller-mecanico-mp',
              detalle: '192.168.1.8 - 12ms',
              activo: true,
            ),
          ],
        ),
      ),
      4 => const Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarBadge(nombre: 'mecanico-01', alertas: 2, activo: true),
              SizedBox(width: 24),
              AvatarBadge(nombre: 'mecanico-02', alertas: 0, activo: true),
              SizedBox(width: 24),
              AvatarBadge(nombre: 'auxiliar', alertas: 0, activo: false),
              SizedBox(width: 24),
              AvatarBadge(nombre: 'jefe-taller', alertas: 11, activo: true),
            ],
          ),
        ),
      ),
      5 => Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'SizedBox',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Primer servicio Taller MP'),
            const SizedBox(height: 32),
            const Text('Segundo servicio Taller MP (despues de 32px)'),
            const Divider(height: 32),
            const Text(
              'Padding',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.indigo.shade50,
              child: const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text('Texto con Padding izquierdo Taller MP'),
              ),
            ),
            const Divider(height: 32),
            const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.build, color: Colors.indigo),
            ),
            const Divider(height: 32),
            const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'OBD2',
                'Frenos',
                'Motor',
                'Transmision',
                'Suspension',
                'Alineacion',
                'Balanceo',
              ].map((t) => Chip(label: Text(t))).toList(),
            ),
          ],
        ),
      ),
      _ => Scaffold(
        body: Center(child: Text('Paso $paso: seleccione un paso valido')),
      ),
    },
  ),
);

Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width: 220,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.indigo, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Text(
        'Bahia Taller MP-01',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ),
);
