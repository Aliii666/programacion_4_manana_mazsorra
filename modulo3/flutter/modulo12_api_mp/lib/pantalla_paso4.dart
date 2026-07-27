import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'pantalla_paso3.dart';

sealed class ApiError {
  final String message;
  const ApiError(this.message);
}

class NetworkError extends ApiError {
  const NetworkError([String msg = 'Sin conexion a Internet. Verifica tu red.']) : super(msg);
}

class ServerError extends ApiError {
  final int statusCode;
  const ServerError(this.statusCode, [String msg = 'Error en el servidor.']) : super(msg);
}

class UnknownError extends ApiError {
  final Object originError;
  const UnknownError(this.originError, [String msg = 'Ocurrio un error inesperado.']) : super(msg);
}

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Result<T> {
  final ApiError error;
  Failure(this.error);
}

class PantallaPaso4 extends StatefulWidget {
  const PantallaPaso4({super.key});

  @override
  State<PantallaPaso4> createState() => _PantallaPaso4State();
}

class _PantallaPaso4State extends State<PantallaPaso4> {
  Result<List<Producto>>? _result;
  bool _isLoading = false;

  Future<Result<List<Producto>>> _fetchProducts(String urlString) async {
    try {
      final res = await http.get(Uri.parse(urlString)).timeout(const Duration(seconds: 5));
      if (res.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(res.body) as List<dynamic>;
        final productos = jsonList
            .map((json) => ProductoDto.fromJson(json as Map<String, dynamic>).toDomain())
            .toList();
        return Success(productos);
      } else {
        return Failure(ServerError(res.statusCode, 'El servidor respondio con codigo ${res.statusCode}'));
      }
    } on SocketException {
      return Failure(const NetworkError());
    } catch (e) {
      return Failure(UnknownError(e, 'Excepcion capturada: $e'));
    }
  }

  void _load(String url) async {
    setState(() {
      _isLoading = true;
      _result = null;
    });

    final res = await _fetchProducts(url);

    setState(() {
      _isLoading = false;
      _result = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 4 - Errores tipados MP'),
        leading: BackButton(onPressed: () => context.go('/')),
        backgroundColor: Colors.red.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Column(
                  children: [
                    const Text(
                      'Simulacion de peticiones HTTP MP:',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    const SizedBox(height: 12),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => _load('https://api.escuelajs.co/api/v1/products?limit=5'),
                              icon: const Icon(Icons.check_circle_outline, color: Colors.green),
                              label: const Text('Exito MP'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade50,
                                foregroundColor: Colors.green.shade900,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _load('https://api.escuelajs.co/api/v1/nonexistent-endpoint-404-error'),
                              icon: const Icon(Icons.dns, color: Colors.orange),
                              label: const Text('Error Servidor (404)'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange.shade50,
                                foregroundColor: Colors.orange.shade900,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _load('https://this-domain-does-not-exist-at-all-xyz-12345.com/products'),
                              icon: const Icon(Icons.wifi_off, color: Colors.red),
                              label: const Text('Error de Red'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade50,
                                foregroundColor: Colors.red.shade900,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.red),
          SizedBox(height: 16),
          Text('Cargando peticion MP...', style: TextStyle(color: Colors.grey)),
        ],
      );
    }

    final res = _result;
    if (res == null) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.touch_app, size: 64, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            'Presiona uno de los botones para iniciar una peticion MP.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      );
    }

    return switch (res) {
      Success<List<Producto>>() => _buildSuccessList(res.data),
      Failure<List<Producto>>() => _buildErrorUI(res.error),
    };
  }

  Widget _buildSuccessList(List<Producto> productos) {
    if (productos.isEmpty) {
      return const Text('Peticion exitosa, pero no se devolvieron repuestos.');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green),
            const SizedBox(width: 8),
            Text(
              'Peticion Exitosa (${productos.length} items)',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.separated(
            itemCount: productos.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final prod = productos[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    prod.imageUrl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.image_not_supported),
                  ),
                ),
                title: Text(prod.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('\$${prod.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green)),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildErrorUI(ApiError error) {
    final IconData icon;
    final String title;
    final Color color;

    switch (error) {
      case NetworkError():
        icon = Icons.wifi_off_rounded;
        title = 'Error de Red / Conexion MP';
        color = Colors.red;
        break;
      case ServerError():
        icon = Icons.dns_rounded;
        title = 'Error del Servidor (HTTP ${error.statusCode})';
        color = Colors.orange.shade800;
        break;
      case UnknownError():
        icon = Icons.warning_amber_rounded;
        title = 'Error Desconocido';
        color = Colors.blueGrey;
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 64, color: color),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            error.message,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Categoria del Error: ${error.runtimeType}',
            style: TextStyle(
              fontSize: 11,
              fontFamily: 'monospace',
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
