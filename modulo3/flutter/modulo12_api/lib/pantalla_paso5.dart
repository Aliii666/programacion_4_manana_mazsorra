import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'pantalla_paso3.dart'; // Producto, ProductoDto
import 'pantalla_paso4.dart'; // ApiError, Result, Success, Failure, etc.

// ── 1. HTTP CLIENT LAYER ───────────────────────────────────────────────────────
class HttpClient {
  final http.Client _client;

  HttpClient(this._client);

  Future<Result<dynamic>> get(Uri uri) async {
    try {
      final response = await _client.get(uri).timeout(const Duration(seconds: 5));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final decoded = jsonDecode(response.body);
        return Success(decoded);
      } else {
        return Failure(ServerError(response.statusCode, 'El servidor respondió con código ${response.statusCode}'));
      }
    } on SocketException {
      return Failure(const NetworkError('No se pudo establecer conexión de red. Revisa tu conexión.'));
    } on TimeoutException {
      return Failure(const NetworkError('La conexión superó el tiempo de espera. Reintenta de nuevo.'));
    } catch (e) {
      return Failure(UnknownError(e, 'Error inesperado del cliente HTTP: $e'));
    }
  }
}

// Provider del HttpClient
final httpClientProvider = Provider<HttpClient>((ref) {
  final client = http.Client();
  ref.onDispose(() => client.close());
  return HttpClient(client);
});

// ── 2. REPOSITORY LAYER ────────────────────────────────────────────────────────
class ProductRepository {
  final HttpClient _httpClient;

  ProductRepository(this._httpClient);

  Future<Result<List<Producto>>> getProducts() async {
    final uri = Uri.parse('https://api.escuelajs.co/api/v1/products?offset=0&limit=15');
    final result = await _httpClient.get(uri);

    switch (result) {
      case Success<dynamic>():
        try {
          final List<dynamic> jsonList = result.data as List<dynamic>;
          final productos = jsonList
              .map((e) => ProductoDto.fromJson(e as Map<String, dynamic>).toDomain())
              .toList();
          return Success(productos);
        } catch (e) {
          return Failure(UnknownError(e, 'Error al procesar/mapear datos: $e'));
        }
      case Failure<dynamic>():
        return Failure(result.error);
    }
  }
}

// Provider del Repositorio
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(ref.watch(httpClientProvider));
});

// ── 3. STATE NOTIFIER LAYER (RIVERPOD) ─────────────────────────────────────────
class ProductsNotifier extends StateNotifier<AsyncValue<List<Producto>>> {
  final ProductRepository _repository;

  ProductsNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    state = const AsyncValue.loading();
    final result = await _repository.getProducts();
    if (!mounted) return;
    
    switch (result) {
      case Success<List<Producto>>():
        state = AsyncValue.data(result.data);
      case Failure<List<Producto>>():
        state = AsyncValue.error(result.error, StackTrace.current);
    }
  }
}

// Provider del Notifier
final productsNotifierProvider =
    StateNotifierProvider<ProductsNotifier, AsyncValue<List<Producto>>>((ref) {
  return ProductsNotifier(ref.watch(productRepositoryProvider));
});

// ── 4. PRESENTATION LAYER (UI) ─────────────────────────────────────────────────
class PantallaPaso5 extends ConsumerWidget {
  const PantallaPaso5({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 5 · Arquitectura Completa'),
        leading: BackButton(onPressed: () => context.go('/')),
        backgroundColor: Colors.purple.shade100,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(productsNotifierProvider.notifier).loadProducts(),
          ),
        ],
      ),
      body: productsState.when(
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.purple),
              SizedBox(height: 16),
              Text(
                'Cargando desde arquitectura limpia...',
                style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        error: (error, stack) {
          final apiError = error as ApiError;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.purple),
                  const SizedBox(height: 16),
                  Text(
                    'Error de Arquitectura (${apiError.runtimeType})',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    apiError.message,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => ref.read(productsNotifierProvider.notifier).loadProducts(),
                    icon: const Icon(Icons.replay),
                    label: const Text('Reintentar carga'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        data: (productos) {
          if (productos.isEmpty) {
            return const Center(child: Text('No hay productos disponibles.'));
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(productsNotifierProvider.notifier).loadProducts(),
            color: Colors.purple,
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: productos.length,
              itemBuilder: (context, i) {
                final prod = productos[i];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            prod.imageUrl,
                            width: 72,
                            height: 72,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                prod.title,
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                prod.description,
                                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${prod.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple,
                                    ),
                                  ),
                                  Text(
                                    'Ref: #${prod.id}',
                                    style: TextStyle(fontSize: 11, color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
