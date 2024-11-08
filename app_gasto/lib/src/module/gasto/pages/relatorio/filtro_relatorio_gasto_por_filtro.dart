import 'package:app_gasto/src/core/components/fields/date_form_input/date_formatted.dart';
import 'package:app_gasto/src/core/components/fields/input_auto_search/input_seach_delegate.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
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
  final _descricaoEC = TextEditingController();
  final _controller = Modular.get<RelatorioGastoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatorio Gasto Por Filtro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              InputSeachDelegate<Caixa?>(
                label: 'Caja',
                searchDelegate: CaixaDelegate(_caixaDelegateController),
                controller: _descricaoEC,
                onSelected: (value) {
                  // widget.descricaoEC.text = value?.observacao ?? '';
                  if (value != null) {
                    // widget.onCaixaSelected?.call(value);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InputSeachDelegate<Caixa?>(
                label: 'Caja',
                searchDelegate: CaixaDelegate(_caixaDelegateController),
                controller: _descricaoEC,
                onSelected: (value) {
                  // widget.descricaoEC.text = value?.observacao ?? '';
                  if (value != null) {
                    // widget.onCaixaSelected?.call(value);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('OCture')),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('ayer')),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          DateTime dt = DateTime.now();
                          String condition =
                              "1 = 1 AND DATE(FIN_GASTO.DT_GASTO) BETWEEN DATE('${formatDateSql(dt.toString())}') AND DATE('${formatDateSql(dt.toString())}')";
                          _geraRelatorio(condition);
                        },
                        child: const Text('hoy')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _geraRelatorio(String condition) async {
    await _controller.findRelatorioGastoByCondition(condition);
    Modular.to.push(
      MaterialPageRoute(
          builder: (context) => RelatorioGastoPage(
                controller: _controller,
              )),
    );
  }
}
