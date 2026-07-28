// lib/router/app_router.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';
import '../models/servidor_ssh.dart';
import '../screens/scaffold_con_nav.dart';
import '../screens/pantalla_login.dart';
import '../screens/pantalla_servidores.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_metricas.dart';
import '../screens/pantalla_ajustes.dart';

// Provider del router — se reconstruye con ref.watch(authProvider) en AppMonitoreo
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/servidores',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final authState   = ref.read(authProvider);
      final autenticado = authState is Autenticado;
      final enLogin     = state.matchedLocation == '/login';

      if (!autenticado && !enLogin) return '/login';
      if (autenticado && enLogin)   return '/servidores';
      return null;
    },
    routes: [
      GoRoute(
        path:    '/login',
        builder: (_, __) => const PantallaLogin(),
      ),
      ShellRoute(
        builder: (context, state, child) => ScaffoldConNav(child: child),
        routes: [
          GoRoute(
            path:    '/servidores',
            builder: (_, __) => const PantallaServidores(),
            routes: [
              GoRoute(
                path:    ':id',
                builder: (context, state) => PantallaDetalle(
                  id:       state.pathParameters['id']!,
                  servidor: state.extra as ServidorSSH?,
                ),
              ),
            ],
          ),
          GoRoute(
            path:    '/metricas',
            builder: (_, __) => const PantallaMetricas(),
          ),
          GoRoute(
            path:    '/ajustes',
            builder: (_, __) => const PantallaAjustes(),
          ),
        ],
      ),
    ],
  );
});