import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/auth_provider.dart';
import 'router/app_router.dart';
import 'router/app_router_paso2.dart';
import 'router/app_router_paso3.dart';
import 'router/app_router_paso4.dart';
import 'router/app_router_paso5.dart';

const int paso = 4;

void main() => runApp(const ProviderScope(child: AppMonitoreo(paso: paso)));

class AppMonitoreo extends ConsumerWidget {
  final int paso;
  const AppMonitoreo({super.key, required this.paso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authProvider);

    final router = switch (paso) {
      1 => ref.watch(routerProvider),
      2 => appRouterPaso2,
      3 => appRouterPaso3,
      4 => appRouterPaso4,
      5 => appRouterPaso5(ref),
      _ => ref.watch(routerProvider),
    };

    return MaterialApp.router(
      title: 'Taller Mecanico MP',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D47A1)),
        useMaterial3: true,
      ),
    );
  }
}