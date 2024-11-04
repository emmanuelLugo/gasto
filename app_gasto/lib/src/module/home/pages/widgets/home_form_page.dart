import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/size_extension.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/home/pages/configuracao_sistema_controller.dart';
import 'package:app_gasto/src/module/home/pages/widgets/expense_chart_widget.dart';
import 'package:app_gasto/src/module/home/pages/widgets/valores_disponiveis_caixa_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeFormPage extends StatefulWidget {
  final DataShared dataShared;
  final ConfiguracaoSistemaController controller;
  const HomeFormPage({
    super.key,
    required this.dataShared,
    required this.controller,
  });

  @override
  State<HomeFormPage> createState() => _HomeFormPageState();
}

class _HomeFormPageState extends State<HomeFormPage> {
  final _pageController = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => widget.controller.handleConfiguracoesSistema(),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        children: [
          ValoresDisponiveisCaixaWidget(
            controller: widget.controller,
            pageController: _pageController,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildTotalExpenseWidget(),
          SizedBox(
            height: context.screenHeight * 0.4,
            child: ExpenseChartWidget(
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalExpenseWidget() {
    return Observer(
      builder: (_) {
        return Align(
          alignment: Alignment.center,
          child: Text(
            'Gasto de la semana: ${formatCurrency(widget.controller.totalGastoPorSemana ?? 0.0, 1)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
