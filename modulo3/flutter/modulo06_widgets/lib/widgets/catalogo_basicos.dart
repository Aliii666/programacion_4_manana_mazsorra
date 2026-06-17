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
          // ── Text básico ───────────────────────────────────────────────────────
const Text(
  'nginx-proxy: En línea',
  style: TextStyle(
    fontSize:      20,
    fontWeight:    FontWeight.bold,    // .w100–.w900  ·  .bold = .w700
    color:         Colors.green,
    letterSpacing: 0.5,
    fontStyle:     FontStyle.normal,   // .italic
    decoration:    TextDecoration.underline, // <-- Cambiado: .underline (puedes usar .lineThrough)
    shadows: [                               // <-- Añadido: Sombra
      Shadow(
        color: Colors.black26, 
        blurRadius: 4, 
        offset: Offset(2, 2)
      )
    ], 
  ),
),
const SizedBox(height: 8),

// ── Alineación y desbordamiento ───────────────────────────────────────
SizedBox(
  width: double.infinity,
  child: Text(
    // <-- Cambiado: Texto más largo para probar el salto de línea y la justificación
    'api-gateway-produccion-region-us-east → sin respuesta. El servidor ha agotado el tiempo de espera y se ha desconectado forzosamente debido a la alta latencia.',
    textAlign: TextAlign.justify,       // <-- Cambiado: .justify
    maxLines:  2,                       // <-- Cambiado: 2 líneas permitidas
    overflow:  TextOverflow.fade,       // <-- Cambiado: .fade (cambia a .clip para ver la diferencia)
    softWrap:  false,                   // <-- Añadido: Evita que el texto salte de línea
  ),
),
const SizedBox(height: 8),

// ── Text.rich — estilos distintos en un solo widget ───────────────────
const Text.rich(
  TextSpan(children: [
    TextSpan(text: 'Estado: ',
        style: TextStyle(fontWeight: FontWeight.w600)),
    TextSpan(text: 'CRÍTICO',
        style: TextStyle(color: Color.fromARGB(255, 54, 244, 171), fontWeight: FontWeight.bold)),
    TextSpan(text: ' — última revisión hace 5 min',
        style: TextStyle(color: Colors.grey, fontSize: 12)),
  ]),
),
const SizedBox(height: 8),

// ── SelectableText — el usuario puede seleccionar y copiar ───────────
const SelectableText(
  '10.0.0.12:5432',
  style: TextStyle(fontFamily: 'monospace', fontSize: 14),
),
const Divider(height: 32),
// Agrega a children: [ ... ]

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  // <-- Se quitó el 'const' de esta lista porque Theme.of(context) necesita leer 
  // la configuración en tiempo real y no puede ser una constante.
  children: [
    // <-- Añadido: Tooltip que aparece al mantener pulsado
    Tooltip(
      message: 'Servidor activo',
      child: Icon(
        Icons.check_circle_outline, // <-- Cambiado: Versión con contorno (prueba Icons.check_circle para relleno)
        size: 80,                   // <-- Cambiado: Escala muy grande (80)
        color: Theme.of(context).colorScheme.primary, // <-- Cambiado: Usa el color principal del tema actual
      ),
    ),
    const Icon(
      Icons.cancel, 
      size: 14,                     // <-- Cambiado: Escala muy pequeña (14)
      color: Color.fromARGB(255, 54, 130, 244)
    ),
    const Icon(Icons.warning_amber, size: 40, color: Colors.orange),
    const Icon(Icons.dns,           size: 40, color: Colors.black12),
    const Icon(Icons.wifi_off,      size: 40, color: Colors.grey),
  ],
),
const SizedBox(height: 8),
const Icon(Icons.settings,
    size:          24,
    color:         Colors.blueGrey,
    semanticLabel: 'Configuración'),   // leído por lectores de pantalla
const Divider(height: 32),


// ── Cuatro variantes ──────────────────────────────────────────────────
Wrap(
  spacing: 8,
  runSpacing: 8,
  children: [
    ElevatedButton(
      onPressed: () {},
      child: const Text('Conectar'),
    ),
    FilledButton(
      onPressed: () {},
      child: const Text('Iniciar'),
    ),
    OutlinedButton(
      onPressed: () {},
      child: const Text('Monitorear'),
    ),
    TextButton(
      onPressed: () {},
      child: const Text('Detalles'),
    ),
    ElevatedButton(
      onPressed: () {}, // ahora está activado
      child: const Text('Activado'),
    ),
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
      icon: const Icon(Icons.sync_rounded, size: 18),
      label: const Text('Actualizar'),
    ),
    FilledButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.power_settings_new_rounded, size: 18),
      label: const Text('Apagar'),
    ),
    TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.visibility_rounded, size: 18),
      label: const Text('Ver'),
    ),
    OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.analytics_rounded, size: 18),
      label: const Text('Analizar'),
    ),
    Tooltip(
      message: 'Detiene todos los servicios',
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.tune_rounded),
        color: Colors.deepOrangeAccent,
        iconSize: 28,
      ),
    ),
  ],
),
const SizedBox(height: 12),

// ── Botón con estilo personalizado ────────────────────────────────────
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 214, 255, 64),
    foregroundColor: Colors.white,

    // Prueba 0 o 12
    elevation: 12,

    padding: const EdgeInsets.symmetric(
      horizontal: 32,
      vertical: 14,
    ),

    // Botón tipo píldora
    shape: const StadiumBorder(),

    // minimumSize eliminado
  ),
  child: const Text(
    'Ejecutar acción',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      letterSpacing: 0.5,
    ),
  ),
),

const Divider(height: 32),
// Agrega a children: [ ... ]

Card(
  elevation: 3,
  margin: const EdgeInsets.only(bottom: 8),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: ListTile(
    leading:  const Icon(Icons.dns, color: Colors.indigo),
    title:    const Text('nginx-proxy'),
    subtitle: const Text('10.0.0.5 · 45ms'),
    trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
    onTap:    () {},           // toda la fila queda tocable
  ),
),
Card(
  elevation: 1,
  child: ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.red.shade100,
      child: const Icon(Icons.cancel, color: Colors.red, size: 20),
    ),
    title:    const Text('backup-worker'),
    subtitle: const Text('sin respuesta · 10.0.0.30'),
    trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
  ),
),
const Divider(height: 32),
          // ← pega aquí cada bloque al avanzar
        ],
      ),
    );
  }
}