import 'dart:async';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({super.key});

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {
  Timer? _timer;
  int _segundos = 0;
  bool _pausado = false;
  final List<int> _tiemposVuelta = [];

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return;
      setState(() => _segundos++);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer?.cancel();
      } else {
        _iniciarTimer();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatoTiempo(int ticks) {
    final totalSegundos = ticks ~/ 10;
    final decimas = ticks % 10;
    final h = totalSegundos ~/ 3600;
    final m = (totalSegundos % 3600) ~/ 60;
    final s = totalSegundos % 60;
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}.$decimas';
  }

  String get _formato => _formatoTiempo(_segundos);

  Color get _colorTiempo {
    final seg = _segundos ~/ 10;
    if (seg > 120) return Colors.deepPurple;
    if (seg > 60) return Colors.red;
    if (seg > 30) return Colors.orange;
    return Colors.green;
  }

  void _registrarVuelta() {
    setState(() {
      _tiemposVuelta.add(_segundos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formato,
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: _colorTiempo,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon: Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar' : 'Pausar'),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: _pausado ? null : _registrarVuelta,
              icon: const Icon(Icons.timer_outlined, size: 18),
              label: const Text('Vuelta MP'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() {
                _timer?.cancel();
                _segundos = 0;
                _pausado = false;
                _tiemposVuelta.clear();
                _iniciarTimer();
              }),
              child: const Text('Reiniciar'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          _pausado ? 'Pausado' : 'Corriendo',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        if (_tiemposVuelta.isNotEmpty) ...[
          const SizedBox(height: 24),
          Text(
            'Ultima vuelta: ${_formatoTiempo(_tiemposVuelta.last)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade800,
            ),
          ),
          Text(
            'Total de vueltas: ${_tiemposVuelta.length}',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ],
    );
  }
}