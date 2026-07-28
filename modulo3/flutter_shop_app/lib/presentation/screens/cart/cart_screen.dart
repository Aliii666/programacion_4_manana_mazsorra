// lib/presentation/screens/cart/cart_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_colors.dart';
import '../../providers/cart_provider.dart';
import '../../providers/auth_provider.dart';
import '../../../data/remote/api/order_remote_datasource.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);

    if (state.items.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Carrito')),
        backgroundColor: AppColors.background,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('🛒', style: TextStyle(fontSize: 64)),
              SizedBox(height: 16),
              Text('El carrito está vacío',
                style: TextStyle(fontSize: 18, color: AppColors.textPrimary)),
              SizedBox(height: 8),
              Text('Agrega productos desde el catálogo',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Carrito'),
        actions: [
          IconButton(
            icon:    const Icon(Icons.receipt_long),
            tooltip: 'Mis órdenes',
            onPressed: () => context.go('/orders'),
          ),
        ],
      ),
      body: ListView.separated(
        padding:          const EdgeInsets.all(16),
        itemCount:        state.items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final it = state.items[i];
          return Container(
            padding:    const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:        AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border:       Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(Icons.shopping_bag_outlined, color: AppColors.accent, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(it.product.name,
                        style: const TextStyle(color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text('\$${it.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Controles de cantidad
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _QtyBtn(
                      icon: Icons.remove,
                      onTap: it.quantity > 1
                          ? () => ref.read(cartProvider.notifier)
                              .updateQuantity(it.product.id, it.quantity - 1)
                          : () => ref.read(cartProvider.notifier)
                              .removeItem(it.product.id),
                    ),
                    SizedBox(
                      width: 32,
                      child: Text('${it.quantity}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    _QtyBtn(
                      icon:     Icons.add,
                      enabled:  it.quantity < it.product.stock,
                      onTap:    it.quantity < it.product.stock
                          ? () => ref.read(cartProvider.notifier)
                              .updateQuantity(it.product.id, it.quantity + 1)
                          : null,
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Text('\$${it.subtotal.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold,
                    color: AppColors.accent, fontSize: 15)),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        decoration: const BoxDecoration(
          color:  AppColors.surface,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize:      MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total con IVA',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                Text('\$${state.totalWithTax.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary)),
              ],
            ),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () => _confirmOrder(context, ref, state),
                child: const Text('Confirmar orden'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _confirmOrder(
  BuildContext context,
  WidgetRef    ref,
  CartState    state,
) async {
  final authState = ref.read(authProvider);
  if (!authState.isAuthenticated) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Debes iniciar sesión para confirmar una orden'),
    ));
    context.go('/login');
    return;
  }

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title:   const Text('Confirmar orden'),
      content: const Text('¿Deseas confirmar esta orden?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: const Text('Confirmar'),
        ),
      ],
    ),
  );

  if (confirmed != true) return;

  final datasource = ref.read(orderDatasourceProvider);
  try {
    final order = await datasource.createOrder();
    for (final item in state.items) {
      await datasource.addItem(order.id, item.product.id, item.quantity);
    }
    final confirmed = await datasource.confirmOrder(order.id);
    ref.read(cartProvider.notifier).clearCart();
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:         Text('✅ Orden #${confirmed.id} confirmada'),
        backgroundColor: AppColors.success,
      ),
    );
    context.go('/orders');
  } catch (e) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al confirmar: $e')),
    );
  }
}

class _QtyBtn extends StatelessWidget {
  final IconData      icon;
  final VoidCallback? onTap;
  final bool          enabled;

  const _QtyBtn({required this.icon, this.onTap, this.enabled = true});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Icon(icon, size: 26,
      color: enabled ? AppColors.accent : AppColors.textFaint),
  );
}
