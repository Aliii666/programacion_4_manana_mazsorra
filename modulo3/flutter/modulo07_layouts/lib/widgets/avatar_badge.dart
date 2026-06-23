import 'package:flutter/material.dart';

class AvatarBadge extends StatelessWidget {
  final String nombre;
  final int    alertas;
  final bool   activo;
  final String? message;
  final String? detalle;

  const AvatarBadge({
    super.key,
    required this.nombre,
    required this.alertas,
    required this.activo,
    this.message,
    this.detalle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,   // permite que el badge salga del Stack
          children: [
            // Avatar — capa inferior
            Container(
              width:  56,
              height: 56,
              decoration: BoxDecoration(
                color:        activo ? Colors.teal.shade100 : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  nombre.substring(0, 2).toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:   18,
                    color:      activo ? Colors.teal.shade700 : Colors.grey.shade600,
                  ),
                ),
              ),
            ),

            // Punto de estado — esquina inferior derecha
            Positioned(
              bottom: 0, right: 0,
              child: Container(
                width:  14,
                height: 14,
                decoration: BoxDecoration(
                  color:  activo ? Colors.teal : Colors.red,
                  shape:  BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),

            // Badge de alertas — capa superior, solo si las hay
            if (alertas > 0)
              Positioned(
                top: -4, right: -4,
                child: Container(
                  padding:     const EdgeInsets.all(4),
                  decoration:  BoxDecoration(color: Colors.amber.shade600, shape: BoxShape.circle),
                  constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                  child: Text(
                    alertas > 9 ? '9+' : '$alertas',
                    style: const TextStyle(
                        color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          nombre,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        if (detalle != null)
          Text(
            detalle!,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
            ),
          ),
        if (message != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              message!,
              style: TextStyle(
                fontSize: 10,
                color: activo ? Colors.teal.shade700 : Colors.red.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
      ],
    );
  }
}
