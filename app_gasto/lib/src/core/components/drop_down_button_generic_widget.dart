import 'package:flutter/material.dart';

class DropdownButtonGenericWidget<T> extends StatelessWidget {
  final T? selectedItem;
  final List<T> items;
  final Function(T?)? onChanged;
  final String label;
  final String hint;
  final String Function(T) itemToString;

  const DropdownButtonGenericWidget({
    super.key,
    required this.items,
    this.selectedItem,
    this.onChanged,
    required this.label,
    required this.hint,
    required this.itemToString,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: selectedItem ?? items.first,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      hint: Text(hint),
      onChanged: items.length > 1 ? (value) => onChanged?.call(value) : null,
      items: items
          .toSet()
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(itemToString(item)),
              ))
          .toList(),
    );
  }
}
