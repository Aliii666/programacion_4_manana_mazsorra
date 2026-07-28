// lib/presentation/widgets/search_bar.dart

import 'dart:async';
import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// SearchBar propio con debounce de 500 ms.
/// Usa nombre distinto al material.SearchBar para evitar conflicto.
class AppSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String?              initialValue;

  const AppSearchBar({super.key, required this.onChanged, this.initialValue});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _ctrl;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {}); // Para actualizar el sufijo (botón limpiar)
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), () {
      widget.onChanged(value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:      _ctrl,
      onChanged:       _onChanged,
      textInputAction: TextInputAction.search,
      style:           const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText:   'Buscar productos...',
        prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
        suffixIcon: _ctrl.text.isNotEmpty
            ? IconButton(
                icon:      const Icon(Icons.clear, color: AppColors.textSecondary),
                onPressed: () {
                  _ctrl.clear();
                  setState(() {});
                  widget.onChanged('');
                },
              )
            : null,
        filled:         true,
        fillColor:      AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:   const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:   const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:   const BorderSide(color: AppColors.accent, width: 2),
        ),
      ),
    );
  }
}
