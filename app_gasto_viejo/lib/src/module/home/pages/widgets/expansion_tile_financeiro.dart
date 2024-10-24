import 'package:app_venda/src/core/ui/styles/colors_app.dart';
import 'package:app_venda/src/module/core/shared/telas_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExpansionTileFinanceiro extends StatelessWidget {
  final TelasShared telasShared;
  final TextStyle titleStyle;

  const ExpansionTileFinanceiro(
      {super.key, required this.telasShared, required this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Financiero',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: ColorsApp.instance.primary,
        ),
      ),
      subtitle: Text(
        'Modulo de financiero',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      children: [
        // Visibility(
        //   visible: telasShared.habilitaGasto,
        //   child: ListTile(
        //     title: Text(
        //       '- Gasto',
        //       style: titleStyle,
        //     ),
        //     onTap: () {
        //       Modular.to.pushNamed('/home/gasto/novo');
        //     },
        //   ),
        // ),
        Visibility(
          visible: true,
          child: ListTile(
            title: Text(
              '- Cuenta Por Cobrar',
              style: titleStyle,
            ),
            onTap: () {
              Modular.to.pushNamed('/home/conta_receber');
            },
          ),
        ),
      ],
    );
  }
}
