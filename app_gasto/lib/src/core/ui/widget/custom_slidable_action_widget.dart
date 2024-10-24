import 'package:app_gasto/src/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidableActionWidget extends StatelessWidget {
  final String? label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? foregroundColor;

  const CustomSlidableActionWidget({
    super.key,
    this.label,
    required this.icon,
    required this.onPressed,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      icon: icon,
      label: label,
      foregroundColor:
          foregroundColor ?? ColorsApp.instance.getPrimaryColor(context),
      backgroundColor: ColorsApp.instance.getSecondaryColor(context),
      onPressed: (context) => onPressed(),
    );
  }
}
