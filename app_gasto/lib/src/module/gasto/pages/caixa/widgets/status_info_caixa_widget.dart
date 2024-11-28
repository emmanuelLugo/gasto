import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:flutter/material.dart';

class StatusInfoCaixaWidget extends StatelessWidget {
  final Caixa caixa;
  const StatusInfoCaixaWidget({
    super.key,
    required this.caixa,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: caixa.isAberto! ? Colors.green[100] : Colors.red[100],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              caixa.isAberto! ? Icons.check_circle : Icons.warning,
              color: caixa.isAberto! ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 10),
            Text(
              caixa.statusCaixa,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: caixa.isAberto! ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
