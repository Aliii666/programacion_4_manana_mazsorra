import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

// 1. Modelo de Dominio
class Producto {
  final int id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;

  const Producto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

// 2. DTO (Data Transfer Object)
class ProductoDto {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;

  const ProductoDto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });

  factory ProductoDto.fromJson(Map<String, dynamic> json) {
    // Platzi API price might be an int or a double
    final rawPrice = json['price'];
    final priceVal = (rawPrice is num) ? rawPrice.toDouble() : 0.0;

    // Platzi API images is a list of strings, sometimes starting/ending with brackets/quotes due to API issues.
    final rawImages = json['images'] as List<dynamic>? ?? [];
    final List<String> cleanedImages = [];
    for (var img in rawImages) {
      if (img is String) {
        var cleaned = img.replaceAll('[', '').replaceAll(']', '').replaceAll('"', '').trim();
        if (cleaned.isNotEmpty) {
          cleanedImages.add(cleaned);
        }
      }
    }

    return ProductoDto(
      id: json['id'] as int,
      title: json['title'] as String? ?? 'Sin título',
      price: priceVal,
      description: json['description'] as String? ?? '',
      images: cleanedImages,
    );
  }

  Producto toDomain() {
    // Get the first image, or a placeholder if empty
    String mainImage = 'https://picsum.photos/200';
    if (images.isNotEmpty) {
      mainImage = images.first;
    }
    return Producto(
      id: id,
      title: title,
      price: price,
      description: description,
      imageUrl: mainImage,
    );
  }
}

// 3. Pantalla de Visualización
class PantallaPaso3 extends StatelessWidget {
  const PantallaPaso3({super.key});

  Future<List<Producto>> _fetchProductos() async {
    final res = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products?offset=0&limit=15'),
    );
    if (res.statusCode != 200) {
      throw Exception('Error del servidor: ${res.statusCode}');
    }
    final List<dynamic> jsonList = jsonDecode(res.body) as List<dynamic>;
    return jsonList
        .map((json) => ProductoDto.fromJson(json as Map<String, dynamic>).toDomain())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 3 · API real y Dominio'),
        leading: BackButton(onPressed: () => context.go('/')),
        backgroundColor: Colors.orange.shade100,
      ),
      body: FutureBuilder<List<Producto>>(
        future: _fetchProductos(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.orange),
                  SizedBox(height: 16),
                  Text('Cargando productos de Platzi API...',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          if (snap.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 60, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      'Ocurrió un error al cargar productos:\n${snap.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Forzar refresco reconstruyendo el árbol de widgets
                        (context as Element).markNeedsBuild();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Reintentar'),
                    ),
                  ],
                ),
              ),
            );
          }

          final productos = snap.data ?? [];
          if (productos.isEmpty) {
            return const Center(child: Text('No hay productos disponibles.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: productos.length,
            itemBuilder: (context, i) {
              final prod = productos[i];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagen del producto
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                        ),
                        child: Image.network(
                          prod.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.image_not_supported,
                                  color: Colors.grey),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.orange,
                              ),
                            );
                          },
                        ),
                      ),
                      // Detalles del producto
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                prod.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                prod.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${prod.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade50,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'ID: ${prod.id}',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange.shade800,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
