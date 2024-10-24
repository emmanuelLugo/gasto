import 'package:app_venda/src/core/ui/styles/colors_app.dart';
import 'package:app_venda/src/module/core/shared/data_shared.dart';
import 'package:app_venda/src/module/core/shared/telas_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExpansionTileRegistro extends StatelessWidget {
  final TelasShared telasShared;
  final DataShared dataShared;
  final TextStyle titleStyle;

  const ExpansionTileRegistro(
      {super.key,
      required this.telasShared,
      required this.dataShared,
      required this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Registro',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: ColorsApp.instance.primary,
        ),
      ),
      subtitle: Text(
        'Modulo de registro',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            '- Producto',
            style: titleStyle,
          ),
          onTap: () {
            Modular.to.pushNamed('/home/produto/');
          },
        ),
        ListTile(
          title: Text(
            '- Compra',
            style: titleStyle,
          ),
          onTap: () {
            Modular.to.pushNamed('/home/compra/');
          },
        ),
      ],
    );
  }
}
