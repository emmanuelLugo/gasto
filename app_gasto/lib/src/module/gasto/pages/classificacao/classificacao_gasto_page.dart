import 'package:app_gasto/src/core/components/fields/input_auto_search/input_seach_delegate.dart';
import 'package:app_gasto/src/core/components/fields/text_form_input/text_input_form.dart';
import 'package:app_gasto/src/core/ui/styles/colors_app.dart';
import 'package:app_gasto/src/core/ui/widget/custom_app_bar.dart';
import 'package:app_gasto/src/module/gasto/models/tipo_gasto.dart';
import 'package:app_gasto/src/module/gasto/pages/classificacao/classificacao_gasto_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/delegate/tipo_gasto_delegate.dart';
import 'package:app_gasto/src/module/gasto/pages/delegate/tipo_gasto_delegate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
      appBar: CustomAppBarWidget(
        title: _controller.currentRecord.id == null
            ? 'Nueva Clasificación'
            : 'Editar Clasificación',
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorsApp.instance.primary,
        onPressed: () => _save(),
        label: const Text('Guardar', style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.save, color: Colors.white),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return InkWell(
                  onTap: () =>
                      _controller.setAtivo(!_controller.currentRecord.ativo!),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text(
                      'Estado',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      _controller.currentRecord.status(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    trailing: Switch(
                      value: _controller.currentRecord.ativo ?? false,
                      onChanged: _controller.setAtivo,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            TextInputForm(
              label: 'Descripción',
              controller: _descricaoEC,
              validator: Validatorless.required('El Campo es Requerido'),
              onChanged: (value) {
                _controller.setDescricao(value);
              },
            ),
            const SizedBox(height: 10),
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
    );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _controller.save();
    }
  }
}
