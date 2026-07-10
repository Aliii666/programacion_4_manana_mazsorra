// lib/presentation/navigation/app_router.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/model/auth_state.dart';
import '../providers/auth_provider.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/catalog/catalog_screen.dart';
import '../screens/catalog/home_screen.dart';
import '../screens/catalog/product_detail_screen.dart';
import '../screens/orders/orders_screen.dart';
import '../screens/orders/order_detail_screen.dart';
import '../screens/auth/profile_screen.dart';
import '../widgets/admin_shell.dart';
import '../screens/admin/dashboard_screen.dart';
import 'public_shell.dart';

// Placeholder genérico para módulos futuros (fuera de admin)


// Placeholder para usar dentro de AdminShell (sin Scaffold/AppBar duplicados)
class _AdminPlaceholder extends StatelessWidget {
  final String title;
  const _AdminPlaceholder(this.title);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(title,
            style: const TextStyle(color: Color(0xFF8888AA), fontSize: 16)),
      );
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation:   '/',
    refreshListenable: _AuthStateListenable(ref),
    redirect: (context, state) {
      final auth     = ref.read(authProvider);
      final location = state.matchedLocation;

      if (auth.isChecking) return null;

      final isAuthRoute = location == '/login' || location == '/register';

      if (!auth.isAuthenticated && !isAuthRoute) return '/login';
      if ( auth.isAuthenticated &&  isAuthRoute) return auth.isStaff ? '/admin' : '/';
      if ( auth.isAuthenticated && !auth.isStaff && location.startsWith('/admin')) return '/';

      return null;
    },
    routes: [
      // ── Auth ──────────────────────────────────────────────
      GoRoute(path: '/login',    builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),

      // ── Zona pública con BottomNavBar ──────────────────────
      ShellRoute(
        builder: (_, __, child) => PublicShell(child: child),
        routes: [
          GoRoute(path: '/',        builder: (_, __) => const HomeScreen()),
          GoRoute(path: '/catalog', builder: (_, __) => const CatalogScreen()),
          GoRoute(path: '/cart',    builder: (_, __) => const CartScreen()),
          GoRoute(path: '/orders',
            builder: (_, __) => const OrdersScreen()),
          GoRoute(path: '/orders/:id',
            builder: (_, s) => OrderDetailScreen(
              orderId: int.tryParse(s.pathParameters['id'] ?? '') ?? 0)),
          GoRoute(path: '/profile',
            builder: (_, __) => const ProfileScreen()),
        ],
      ),

      // ── Detalle de producto FUERA del ShellRoute ───────────
      // (sin BottomNavBar — pantalla completa)
      GoRoute(
        path: '/catalog/:id',
        builder: (_, state) {
          final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
          return ProductDetailScreen(productId: id);
        },
      ),

      // ── Admin ─────────────────────────────────────────────
      GoRoute(
        path: '/admin',
        builder: (_, state) => AdminShell(
          title:        'Dashboard',
          currentRoute: state.matchedLocation,
          child:        const DashboardScreen(),
        ),
      ),
      GoRoute(
        path: '/admin/categories',
        builder: (_, state) => AdminShell(
          title:        'Categorías',
          currentRoute: state.matchedLocation,
          child:        const _AdminPlaceholder('Categorías — M8'),
        ),
      ),
      GoRoute(
        path: '/admin/products',
        builder: (_, state) => AdminShell(
          title:        'Productos',
          currentRoute: state.matchedLocation,
          child:        const _AdminPlaceholder('Productos — M9'),
        ),
      ),
      GoRoute(
        path: '/admin/orders',
        builder: (_, state) => AdminShell(
          title:        'Pedidos',
          currentRoute: state.matchedLocation,
          child:        const _AdminPlaceholder('Pedidos admin — M10'),
        ),
      ),
      GoRoute(
        path: '/admin/orders/:id',
        builder: (_, state) => AdminShell(
          title:        'Detalle pedido',
          currentRoute: '/admin/orders',
          child:        _AdminPlaceholder('Pedido #${state.pathParameters['id']} — M10'),
        ),
      ),
      GoRoute(
        path: '/admin/users',
        builder: (_, state) => AdminShell(
          title:        'Usuarios',
          currentRoute: state.matchedLocation,
          child:        const _AdminPlaceholder('Usuarios — M11'),
        ),
      ),
    ],
  );
});

class _AuthStateListenable extends ChangeNotifier {
  _AuthStateListenable(Ref ref) {
    ref.listen<AuthState>(authProvider, (_, __) => notifyListeners());
  }
}
