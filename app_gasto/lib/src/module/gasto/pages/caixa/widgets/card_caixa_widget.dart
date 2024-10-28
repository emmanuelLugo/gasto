import 'package:app_gasto/src/core/components/fields/date_form_input/date_formatted.dart';
import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:flutter/material.dart';

class CardCaixaWidget extends StatelessWidget {
  final Caixa caixa;
  final VoidCallback? onTap;
  const CardCaixaWidget({
    super.key,
    required this.caixa,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text('${caixa.observacao}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              caixa.status,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: caixa.isAberto!
                      ? const Color.fromARGB(255, 6, 133, 12)
                      : Colors.black),
            ),
            Text(
              'Valor Gasto: ${formatCurrency(caixa.vlGasto ?? 0.0, 1)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                      'APERTURA: ${formatDateAndTimeShort(caixa.dtAbertura)}'),
                ),
                Text(caixa.isAberto!
                    ? ''
                    : 'CIERRE: ${formatDateAndTimeShort(caixa.dtFechamento)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
