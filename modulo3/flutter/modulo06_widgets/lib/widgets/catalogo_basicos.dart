import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico con sombra y underline ───────────────────────────────
          const Text(
            'nginx-proxy: En línea',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 0.5,
              decoration: TextDecoration.underline,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Alineación y desbordamiento ──────────────────────────────────────
          SizedBox(
            width: 250,
            child: Text(
              'api-gateway-produccion-region-us-east con una descripción muy larga para demostrar el uso de varias líneas y el efecto fade',
              textAlign: TextAlign.center,
              maxLines: 2, // antes era 1
              overflow: TextOverflow.fade, // prueba también .clip
            ),
          ),

          const SizedBox(height: 16),

          // ── Text.rich con lineThrough ────────────────────────────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'CRÍTICO',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: ' — última revisión hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Texto largo justificado y sin salto de línea ────────────────────
          const Text(
            'Este es un texto bastante largo para observar cómo funciona la justificación completa dentro del widget Text. Cuando el texto ocupa varias líneas, Flutter distribuye los espacios para alinear ambos márgenes.',
            textAlign: TextAlign.justify,
            softWrap: false, // prueba quitarlo para comparar
          ),

          const SizedBox(height: 16),

          // ── SelectableText ───────────────────────────────────────────────────
          const SelectableText(
            '10.0.0.12:5432',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),

          const Divider(height: 32),

          // Agrega a children: [ ... ]
          // ── Íconos de estado ──────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tooltip(
                message: 'Servidor activo',
                child: Icon(
                  Icons
                      .check_circle_outline, // prueba también Icons.check_circle
                  size: 80, // prueba también 14
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Icon(Icons.cancel, size: 40, color: Colors.red),
              const Icon(Icons.warning_amber, size: 40, color: Colors.orange),
              const Icon(Icons.dns, size: 40, color: Colors.indigo),
              const Icon(Icons.wifi_off, size: 40, color: Colors.grey),
            ],
          ),

          const SizedBox(height: 8),

          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Configuración',
          ),

          const Divider(height: 32),

          // Agrega a children: [ ... ]

          // ── Cuatro variantes ──────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(
                onPressed: () {},
                child: const Text('OutlinedButton'),
              ),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
              ElevatedButton(onPressed: null, child: const Text('Desactivado')),
              //             ↑ onPressed: null → desactiva el botón visualmente
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Reiniciar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.stop, size: 18),
                label: const Text('Detener'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.indigo,
                iconSize: 28,
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado ────────────────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 12,
              minimumSize: const Size(
                double.infinity,
                0,
              ), // ocupa todo el ancho
            ),
            child: const Text(
              'Acción crítica',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 32),

          Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.dns, color: Colors.indigo),
              title: const Text('nginx-proxy'),
              subtitle: const Text('10.0.0.5 · 45ms'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap: () {}, // toda la fila queda tocable
            ),
          ),
          Card(
            elevation: 12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade50,
                child: const Icon(Icons.cancel, color: Colors.red, size: 20),
              ),
              title: const Text('backup-worker'),
              subtitle: const Text('sin respuesta · 10.0.0.30'),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
            ),
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const Chip(label: Text('nginx')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('TLS 1.3'),
                backgroundColor: Colors.green,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label: const Text('HTTP/2'),
                selected: false,
                onSelected: (_) {},
              ),
              ActionChip(
                label: const Text('Ver logs'),
                avatar: const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),

              // Lenguajes de programación
              const Chip(
                label: Text('Dart'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white),
              ),
              const Chip(
                label: Text('Python'),
                backgroundColor: Colors.green,
                labelStyle: TextStyle(color: Colors.white),
              ),
              const Chip(
                label: Text('JavaScript'),
                backgroundColor: Colors.yellow,
              ),
            ],
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]

          // ── Circular ──────────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                
                ),
              ), // value: null → animación continua
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.7, // 70 %
                  color: Colors.green,
                  strokeWidth: 6,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.3,
                  color: Colors.red,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round, // puntas redondeadas
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Lineal ────────────────────────────────────────────────────────────
          const LinearProgressIndicator(), // indeterminado
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: null,
            color: Colors.indigo,
          ), // 60 %
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: 1.0,
            color: Colors.green,
            minHeight: 12, // barra más gruesa (default: 4)
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}