import 'package:app_venda/src/core/components/fields/input_auto_search/input_seach_delegate.dart';
import 'package:app_venda/src/core/components/fields/text_form_input/text_form_input.dart';
import 'package:app_venda/src/module/gasto/models/tipo_gasto.dart';
import 'package:app_venda/src/module/gasto/pages/classificacao/classificacao_gasto_controller.dart';
import 'package:app_venda/src/module/gasto/pages/delegate/tipo_gasto_delegate.dart';
import 'package:app_venda/src/module/gasto/pages/delegate/tipo_gasto_delegate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class ClassificacaoGastoPage extends StatefulWidget {
  const ClassificacaoGastoPage({super.key});

  @override
  State<ClassificacaoGastoPage> createState() => _ClassificacaoGastoPageState();
}

class _ClassificacaoGastoPageState extends State<ClassificacaoGastoPage> {
  final _formKey = GlobalKey<FormState>();
  final _tipoGastoController = Modular.get<TipoGastoDelegateController>();
  final _tipoGastoEC = TextEditingController();
  final _descricaoEC = TextEditingController();
  final _controller = Modular.get<ClassificacaoGastoController>();

  @override
  void initState() {
    super.initState();
    _carregaDatos();
  }

  void _carregaDatos() {
    if (_controller.currentRecord.id != null) {
      _descricaoEC.text = _controller.currentRecord.descricao!;
      _tipoGastoEC.text = _controller.currentRecord.tipoGasto!.descricao!;
    }
  }

  @override
  void dispose() {
    _tipoGastoEC.dispose();
    _descricaoEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Clasificación Gasto'),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          onPressed: () => _save(),
          icon: const Icon(Icons.save),
          label: const Text('Guardar'),
        ),
      ],
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextInputForm(
                label: 'Descripción',
                controller: _descricaoEC,
                validator: Validatorless.required('El Campo es Requerido'),
                onChanged: (value) {
                  _controller.setDescricao(value);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InputSeachDelegate<TipoGasto?>(
                label: 'Tipo Gasto',
                searchDelegate: TipoGastoDelegate(_tipoGastoController),
                controller: _tipoGastoEC,
                onSelected: (value) {
                  _tipoGastoEC.text = value?.descricao ?? '';
                  _controller.setTipoGasto(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _controller.save();
    }
  }
}
