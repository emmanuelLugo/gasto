import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/size_extension.dart';
import 'package:app_gasto/src/core/ui/styles/colors_app.dart';
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
        children: [
          _buildBackgroundStack(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundStack(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundContainer(context),
        Positioned(
          top: -50,
          left: -50,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.white.withOpacity(0.05),
          ),
        ),
        Positioned(
          top: 100,
          right: -30,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white.withOpacity(0.08),
          ),
        ),
        _buildValoresDisponiveisCaixa(context),
        _buildExpenseChartContainer(context),
      ],
    );
  }

  Widget _buildBackgroundContainer(BuildContext context) {
    return Container(
      height: context.screenHeight - 95,
      width: context.screenWidth,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 17, 16, 16),
      ),
    );
  }

  Widget _buildValoresDisponiveisCaixa(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.3,
      width: context.screenWidth,
      child: ValoresDisponiveisCaixaWidget(
        controller: widget.controller,
        pageController: _pageController,
      ),
    );
  }

  Widget _buildExpenseChartContainer(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: context.screenHeight * 0.6,
        width: context.screenWidth,
        decoration: BoxDecoration(
          color: ColorsApp.instance.scaffoldColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: FractionallySizedBox(
          heightFactor: 0.8,
          widthFactor: 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildTotalExpenseWidget(),
              Flexible(
                child: ExpenseChartWidget(controller: widget.controller),
              ),
            ],
          ),
        ),
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
