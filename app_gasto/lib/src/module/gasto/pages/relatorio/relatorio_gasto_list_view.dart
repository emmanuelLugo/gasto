import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/size_extension.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/grafico_lineal_widget.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/grafico_pie_widget.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class RelatorioGastoListView extends StatefulWidget {
  const RelatorioGastoListView({super.key});

  @override
  State<RelatorioGastoListView> createState() => _RelatorioGastoListViewState();
}

class _RelatorioGastoListViewState extends State<RelatorioGastoListView>
    with Loader, SnackbarManager {
  final _gastoController = Modular.get<RelatorioGastoController>();
  late ReactionDisposer statusReactionDisposer;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _gastoController.findTotalGastoPorTipoByCaixa(1);
    _initReaction();
    super.initState();
  }

  @override
  void dispose() {
    statusReactionDisposer();
    super.dispose();
  }

  void _initReaction() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        statusReactionDisposer = reaction(
          (_) => _gastoController.status,
          (status) {
            switch (status) {
              case RelatorioGastoStatusState.initial:
                hideLoader();
                break;
              case RelatorioGastoStatusState.loaded:
                hideLoader();
                break;
              case RelatorioGastoStatusState.loading:
                showLoader();
                break;
              case RelatorioGastoStatusState.success:
                hideLoader();
                showSuccess(_gastoController.message);
                break;
              case RelatorioGastoStatusState.error:
                hideLoader();
                showError(_gastoController.message);
                break;
              default:
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gastos'),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Observer(
            builder: (_) {
              return Text(
                'Total Gasto: ${formatCurrency(_gastoController.vlTotal, 1)}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              );
            },
          ),
        ),
      ],
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.40,
              child: Observer(
                builder: (_) {
                  return GraficoPieWidget(
                      listDto: _gastoController.listDto,
                      title: 'Distribución de Gastos por Tipo');
                },
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.40,
              child: Observer(
                builder: (_) {
                  return GraficoLinealWidget(listDto: _gastoController.listDto);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
