class MetricaServidor {
  final String servidor;
  final double cpu;
  final double ram;
  final int conexiones;

  const MetricaServidor({
    required this.servidor,
    required this.cpu,
    required this.ram,
    required this.conexiones,
  });
}