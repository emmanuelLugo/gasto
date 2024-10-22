import 'package:app_venda/src/core/components/fields/input_auto_search/input_seach_delegate.dart';
import 'package:app_venda/src/core/components/fields/number_form_input/number_input_form.dart';
import 'package:app_venda/src/core/components/fields/text_form_input/text_form_input.dart';
import 'package:app_venda/src/module/gasto/models/classificacao_gasto.dart';
import 'package:app_venda/src/module/gasto/pages/delegate/classificacao_gasto_delegate.dart';
import 'package:app_venda/src/module/gasto/pages/delegate/classificacao_gasto_delegate_controller.dart';
import 'package:app_venda/src/module/gasto/pages/gasto/gasto_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NovoGastoPage extends StatefulWidget {
  const NovoGastoPage({super.key});

  @override
  State<NovoGastoPage> createState() => _NovoGastoPageState();
}

class _NovoGastoPageState extends State<NovoGastoPage> {
  final _classificacaoGastoController =
      Modular.get<ClassificacaoGastoDelegateController>();
  final _classificacaoGastoEC = TextEditingController();
  final _controller = Modular.get<GastoController>();
  final _valorEC = TextEditingController();
  final _descricaoEC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _valorEC.dispose();
    _classificacaoGastoEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Gasto'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          InputSeachDelegate<ClassificacaoGasto?>(
            label: 'Tipo Gasto',
            searchDelegate:
                ClassificacaoGastoDelegate(_classificacaoGastoController),
            controller: _classificacaoGastoEC,
            onSelected: (value) {
              _classificacaoGastoEC.text = value?.descricao ?? '';
              _controller.setClassificacao(value);
            },
          ),
          const SizedBox(height: 10),
          TextInputForm(
            label: 'Observacion',
            controller: _descricaoEC,
            onChanged: (value) {
              _descricaoEC.text = value;
              _controller.setDescricao(value);
            },
          ),
          const SizedBox(height: 10),
          NumberInputForm(
            onChanged: (value) => _controller.setValor(value),
            controller: _valorEC,
            label: 'monto',
            precision: 0,
            validator: (value) {
              if (value == null || value <= 0) {
                return 'El monto no puede ser vacío o igual a cero';
              }
              return null;
            },
          ),
          ElevatedButton(
              onPressed: () {
                _controller.save();
              },
              child: const Text('guardar')),
        ],
      ),
    );
  }
}
