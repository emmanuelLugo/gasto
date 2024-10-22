import 'package:app_venda/src/core/ui/styles/colors_app.dart';
import 'package:app_venda/src/module/core/shared/data_shared.dart';
import 'package:app_venda/src/module/core/shared/telas_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExpansionTileOrcamento extends StatefulWidget {
  final TelasShared telasShared;
  final DataShared dataShared;
  final TextStyle titleStyle;

  const ExpansionTileOrcamento(
      {super.key,
      required this.telasShared,
      required this.dataShared,
      required this.titleStyle});

  @override
  State<ExpansionTileOrcamento> createState() => _ExpansionTileOrcamentoState();
}

class _ExpansionTileOrcamentoState extends State<ExpansionTileOrcamento> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Presupuesto',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: ColorsApp.instance.primary,
        ),
      ),
      subtitle: Text(
        'Modulo presupuesto',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      children: [
        ListTile(
          title: Text(
            '- Presupuesto',
            style: widget.titleStyle,
          ),
          onTap: () {
            validaAbrirOrcamento();
          },
        ),
        ListTile(
          title: Text(
            '- Reporte de Presupuesto',
            style: widget.titleStyle,
          ),
          onTap: () {
            validaAbrirRelatorio();
          },
        ),
      ],
    );
  }

  void validaAbrirOrcamento() {
    // if (widget.dataShared.vendedor == null) {
    //   showDialogSemVendedorConfigurado();
    //   return;
    // }

    if (widget.dataShared.cotacao == null) {
      showDialogSemCotacao();
      return;
    }

    Modular.to.pushNamed('/home/orcamento/');
  }

  void validaAbrirRelatorio() {
    // if (widget.dataShared.vendedor == null) {
    //   showDialogSemVendedorConfigurado();
    //   return;
    // }

    Modular.to.pushNamed('/home/orcamento/relatorio_orcamento');
  }

  void showDialogSemVendedorConfigurado() {
    showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: Text(
              'No existe un vendedor vinculado al usuario ${widget.dataShared.usuario!.nome} para la filial ${widget.dataShared.filial!.descricao}'),
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
