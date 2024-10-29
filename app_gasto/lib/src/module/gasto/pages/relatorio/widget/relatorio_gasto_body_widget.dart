import 'package:app_gasto/src/core/components/fields/input_auto_search/input_seach_delegate.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/size_extension.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/grafico_lineal_widget.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/grafico_pie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RelatorioGastoBodyWidget extends StatefulWidget {
  final CaixaDelegateController caixaDelegateController;
  final RelatorioGastoController gastoController;
  final TextEditingController descricaoEC;
  final void Function(Caixa?)? onCaixaSelected;
  final bool? consultaClassificacao;
  final String title;
  const RelatorioGastoBodyWidget({
    super.key,
    required this.caixaDelegateController,
    required this.gastoController,
    required this.descricaoEC,
    this.onCaixaSelected,
    this.title = 'Relatorio Gastos',
    this.consultaClassificacao = false,
  });

  @override
  State<RelatorioGastoBodyWidget> createState() =>
      _RelatorioGastoBodyWidgetState();
}

class _RelatorioGastoBodyWidgetState extends State<RelatorioGastoBodyWidget> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: InputSeachDelegate<Caixa?>(
              label: 'Caja',
              searchDelegate: CaixaDelegate(widget.caixaDelegateController),
              controller: widget.descricaoEC,
              onSelected: (value) {
                widget.descricaoEC.text = value?.observacao ?? '';
                if (value != null) {
                  widget.onCaixaSelected?.call(value);
                }
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: context.screenHeight * 0.40,
            child: Observer(
              builder: (_) {
                return GraficoPieWidget(
                    listDto: widget.gastoController.listDto,
                    title: widget.title);
              },
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.40,
            child: Observer(
              builder: (_) {
                return GraficoLinealWidget(
                  listDto: widget.gastoController.listDto,
                  gastoController: widget.gastoController,
                  caixa: widget.consultaClassificacao!
                      ? widget.gastoController.caixaSelecionada
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
