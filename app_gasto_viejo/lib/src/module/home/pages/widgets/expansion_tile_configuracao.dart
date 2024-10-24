import 'package:app_venda/src/core/ui/styles/colors_app.dart';
import 'package:app_venda/src/module/core/shared/parametros_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExpansionTileConfiguracao extends StatelessWidget {
  final ParametrosShared parametrosShared;
  const ExpansionTileConfiguracao({super.key, required this.parametrosShared});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(
          'Configuración',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: ColorsApp.instance.primary,
          ),
        ),
        subtitle: Text(
          'Modulo configuración',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              '- Cotización',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Modular.to.pushNamed('/home/configuracao/cotacao/');
            },
          ),
          ListTile(
            title: Text(
              '- Impresora',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Modular.to.pushNamed('/home/configuracao/impresora');
            },
          ),
        ]);
  }
}
