import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/servidor_ssh.dart';

class ServidoresNotifier extends Notifier<List<ServidorSSH>> {
  @override
  List<ServidorSSH> build() => [
    ServidorSSH(id:'1', nombre:'escaneo-obd2-01', ip:'192.168.1.10', puerto:8080, ssl:true, favorito:true),
    ServidorSSH(id:'2', nombre:'elevador-frenos-01', ip:'192.168.1.20', puerto:8080, ssl:true),
    ServidorSSH(id:'3', nombre:'alineadora-laser', ip:'192.168.1.30', puerto:9000, ssl:false),
  ];

  void toggleFavorito(String id) {
    state = state.map((s) =>
        s.id == id
          ? ServidorSSH(id:s.id, nombre:s.nombre, ip:s.ip,
                        puerto:s.puerto, ssl:s.ssl,
                        favorito:!s.favorito)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(ServidorSSH servidor) {
    state = [...state, servidor];
  }
}

final servidoresProvider =
    NotifierProvider<ServidoresNotifier, List<ServidorSSH>>(
  ServidoresNotifier.new,
);

final busquedaProvider = StateProvider<String>((ref) => '');

final servidoresFiltradosProvider = Provider<List<ServidorSSH>>((ref) {
  final todos = ref.watch(servidoresProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((s) =>
      s.nombre.toLowerCase().contains(q) || s.ip.contains(q)
  ).toList();
});