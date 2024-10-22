import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final String message;
  const EmptyList({
    super.key,
    this.message = '',
    this.isDark = false,
  });
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 16,
          color: isDark ? Colors.white : Colors.black87,
        );
    return SizedBox(
      height: 96,
      child: Center(
        child: message.isEmpty
            ? Text(
                'Lista vacia',
                style: textStyle,
              )
            : Text(
                message,
                style: textStyle,
              ),
      ),
    );
  }
}
