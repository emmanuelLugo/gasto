import 'package:app_gasto/src/core/components/fields/date_form_input/date_formatter.dart';
import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:flutter/material.dart';

class CardGastoWidget extends StatelessWidget {
  final Gasto gasto;
  const CardGastoWidget({super.key, required this.gasto});

  @override
  Widget build(BuildContext context) {
    bool isCancelado = gasto.cancelado ?? false;
    final style = TextStyle(
      color: isCancelado ? Colors.red : Colors.black,
    );
    return Card(
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                gasto.descricao ?? '',
                style: style,
              ),
            ),
            Text(
              formatCurrency(gasto.vlGasto ?? 0, 1),
              style: style.copyWith(
                  fontWeight: FontWeight.bold, color: isCancelado ? Colors.red : const Color.fromARGB(255, 6, 133, 12)),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CUENTA: ${gasto.caixa!.observacao}',
              style: style.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              gasto.classificacaoGasto?.descricao ?? '',
              style: style,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    DateFormatter.formatFullDate(gasto.dtGasto),
                    style: style,
                  ),
                ),
                Text(
                  isCancelado ? 'cancelado el ${DateFormatter.formatDateTime(gasto.dtCancelamento)}' : '',
                  style: style,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
