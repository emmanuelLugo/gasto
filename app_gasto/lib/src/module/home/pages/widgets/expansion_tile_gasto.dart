import 'package:app_venda/src/core/ui/styles/colors_app.dart';
import 'package:app_venda/src/module/core/shared/data_shared.dart';
import 'package:app_venda/src/module/core/shared/telas_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExpansionTileGasto extends StatefulWidget {
  final TelasShared telasShared;
  final DataShared dataShared;
  final TextStyle titleStyle;

  const ExpansionTileGasto(
      {super.key,
      required this.telasShared,
      required this.dataShared,
      required this.titleStyle});

  @override
  State<ExpansionTileGasto> createState() => _ExpansionTileGastoState();
}

class _ExpansionTileGastoState extends State<ExpansionTileGasto> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Gasto',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: ColorsApp.instance.primary,
        ),
      ),
      subtitle: Text(
        'Modulo gasto',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      children: [
        ListTile(
          title: Text(
            '- Clasificación',
            style: widget.titleStyle,
          ),
          onTap: () {
            Modular.to.pushNamed('/home/gasto/classificacao-gasto');
          },
        ),
        ListTile(
          title: Text(
            '- Gasto',
            style: widget.titleStyle,
          ),
          onTap: () {
            Modular.to.pushNamed('/home/gasto/');
          },
        ),

        ListTile(
          title: Text(
            '- Grafico por Tipo',
            style: widget.titleStyle,
          ),
          onTap: () {
            Modular.to.pushNamed('/home/gasto/relatorio-gasto-tipo');
          },
        ),
        ListTile(
          title: Text(
            '- Grafico por Clasificaion',
            style: widget.titleStyle,
          ),
          onTap: () {
            Modular.to.pushNamed('/home/gasto/relatorio-gasto-classificacao');
          },
        ),

        // ListTile(
        //   title: Text(
        //     '- Venta',
        //     style: widget.titleStyle,
        //   ),
        //   onTap: () {
        //     Modular.to.pushNamed('/home/venda/');
        //   },
        // ),
        // ListTile(
        //   title: Text(
        //     '- Reporte de Ventas',
        //     style: widget.titleStyle,
        //   ),
        //   onTap: () {
        //     Modular.to.pushNamed('/home/venda/relatorio-venda');
        //   },
        // ),
      ],
    );
  }

  void showDialogSemCotacao() {
    showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: const Text('No existe cotización del tipo FATURACIÓN'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cerrar'),
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
