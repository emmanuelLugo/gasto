import 'package:app_gasto/src/core/components/fields/date_form_input/date_formatted.dart';
import 'package:app_gasto/src/core/components/fields/date_form_input/date_range_picker_field.dart';
import 'package:app_gasto/src/core/components/fields/input_auto_search/input_seach_delegate.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/models/classificacao_gasto.dart';
import 'package:app_gasto/src/module/gasto/pages/delegate/classificacao_gasto_delegate.dart';
import 'package:app_gasto/src/module/gasto/pages/delegate/classificacao_gasto_delegate_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_page.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FiltroRelatorioGastoPorFiltro extends StatefulWidget {
  const FiltroRelatorioGastoPorFiltro({super.key});

  @override
  State<FiltroRelatorioGastoPorFiltro> createState() =>
      _FiltroRelatorioGastoPorFiltroState();
}

class _FiltroRelatorioGastoPorFiltroState
    extends State<FiltroRelatorioGastoPorFiltro> {
  final _caixaDelegateController = Modular.get<CaixaDelegateController>();
  final _classificacaoDelegateController =
      Modular.get<ClassificacaoGastoDelegateController>();

  final _caixaEC = TextEditingController();
  final _classificacaoEC = TextEditingController();
  final _controller = Modular.get<RelatorioGastoController>();

  Caixa? _caixaSelecionada;
  ClassificacaoGasto? _classificacaoSelecionada;

  @override
  void dispose() {
    _caixaEC.dispose();
    _classificacaoEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatorio Gasto Por Filtro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _buildCaixaInputSearch(),
            const SizedBox(height: 20),
            _buildClassificacaoInputSearch(),
            const SizedBox(height: 20),
            DateRangePickerField(
              dateRangeController: TextEditingController(),
              onChanged: _filtroPorRange,
            ),
            const SizedBox(height: 20),
            _buildDateFilterButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildCaixaInputSearch() {
    return InputSeachDelegate<Caixa?>(
      label: 'Caja',
      searchDelegate: CaixaDelegate(_caixaDelegateController),
      controller: _caixaEC,
      onSelected: (value) {
        _caixaEC.text = value?.observacao ?? '';
        _caixaSelecionada = value;
      },
    );
  }

  Widget _buildClassificacaoInputSearch() {
    return InputSeachDelegate<ClassificacaoGasto?>(
      label: 'Clasificación',
      searchDelegate:
          ClassificacaoGastoDelegate(_classificacaoDelegateController),
      controller: _classificacaoEC,
      onSelected: (value) {
        _classificacaoEC.text = value?.descricao ?? '';
        _classificacaoSelecionada = value;
      },
    );
  }

  Widget _buildDateFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFilterButton(
            getMonthString(DateTime.now().toString()), _filtroPorMesAtual),
        const SizedBox(width: 10),
        _buildFilterButton('Ayer', _filtroPorOntem),
        const SizedBox(width: 10),
        _buildFilterButton('Hoy', _filtroPorHoje),
      ],
    );
  }

  Widget _buildFilterButton(String label, VoidCallback onPressed) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  void _navigateToRelatorioPage() {
    Modular.to.push(
      MaterialPageRoute(
        builder: (context) => RelatorioGastoPage(controller: _controller),
      ),
    );
  }

  void _prepareAndNavigateToRelatorio(String condition) async {
    _controller.condition = condition;
    await _controller.findRelatorioGastoByCondition();
    _navigateToRelatorioPage();
  }

  String _generateFilterCondition(DateTime startDate, DateTime endDate) {
    String start = formatDateSql(startDate.toString());
    String end = formatDateSql(endDate.toString());

    String condition =
        "1 = 1 AND FIN_GASTO.BO_CANCELADO = 0 AND DATE(FIN_GASTO.DT_GASTO) BETWEEN DATE('$start') AND DATE('$end')";

    if (_caixaSelecionada != null) {
      condition += " AND FIN_GASTO.ID_CAIXA = ${_caixaSelecionada!.id}";
    }

    if (_classificacaoSelecionada != null) {
      condition +=
          " AND FIN_GASTO.ID_CLASSIFICACAO = '${_classificacaoSelecionada!.id}'";
    }

    return condition;
  }

  void _filtroPorHoje() {
    DateTime date = DateTime.now();
    String condition = _generateFilterCondition(date, date);
    _prepareAndNavigateToRelatorio(condition);
  }

  void _filtroPorOntem() {
    DateTime date = DateTime.now().subtract(const Duration(days: 1));
    String condition = _generateFilterCondition(date, date);
    _prepareAndNavigateToRelatorio(condition);
  }

  void _filtroPorMesAtual() {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0);
    String condition = _generateFilterCondition(startOfMonth, endOfMonth);
    _prepareAndNavigateToRelatorio(condition);
  }

  void _filtroPorRange(DateTimeRange? date) async {
    if (date != null) {
      String condition = _generateFilterCondition(date.start, date.end);
      _prepareAndNavigateToRelatorio(condition);
    }
  }
}
