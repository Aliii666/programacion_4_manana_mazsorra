class ServidorSSH {
  final String id;
  final String nombre;
  final String ip;
  final int puerto;
  final bool ssl;
  bool favorito;

  ServidorSSH({
    required this.id,
    required this.nombre,
    required this.ip,
    required this.puerto,
    required this.ssl,
    this.favorito = false,
  });
}

final servidoresSimulados = [
  ServidorSSH(id: '1', nombre: 'equipo-obd2-01', ip: '192.168.1.10', puerto: 8080, ssl: true, favorito: true),
  ServidorSSH(id: '2', nombre: 'elevador-frenos-01', ip: '192.168.1.20', puerto: 8080, ssl: true),
  ServidorSSH(id: '3', nombre: 'alineadora-laser', ip: '192.168.1.30', puerto: 9000, ssl: false),
];