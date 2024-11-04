import 'package:app_gasto/src/core/components/fields/date_form_input/date_form_input.dart';
import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/core/components/fields/number_form_input/number_input_form.dart';
import 'package:app_gasto/src/core/components/fields/text_form_input/text_form_input.dart';
import 'package:app_gasto/src/module/gasto/pages/caixa/caixa_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

class CaixaPage extends StatefulWidget {
  const CaixaPage({super.key});

  @override
  State<CaixaPage> createState() => _CaixaPageState();
}

class _CaixaPageState extends State<CaixaPage> {
  final _controller = Modular.get<CaixaController>();
  final _formKey = GlobalKey<FormState>();
  final _observacaoEC = TextEditingController();
  final _dtAberturaEC = TextEditingController();
  final _valorCaixaEC = TextEditingController();
  final _dtCaixaEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregaDatos();
  }

  void _carregaDatos() {
    if (_controller.currentRecord.id != null) {
      _observacaoEC.text = _controller.currentRecord.observacao!;
      _dtAberturaEC.text =
          _controller.currentRecord.dtAbertura!.toString().split(' ')[0];
      _valorCaixaEC.text = formatNumberByMoeda(
          number: _controller.currentRecord.vlCaixa ?? 0, idMoeda: 1);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _observacaoEC.dispose();
    _dtAberturaEC.dispose();
    _valorCaixaEC.dispose();
    _dtCaixaEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${_controller.currentRecord.id != null ? 'Editar' : 'Nueva'} '),
      ),
      persistentFooterButtons: [
        OutlinedButton.icon(
          onPressed: () =>
              _controller.atualizaStatusCaixa(_controller.currentRecord),
          icon: const Icon(Icons.close),
          label:
              Text(_controller.currentRecord.isAberto! ? 'Cerrar' : 'Reabrir'),
        ),
        if (_controller.currentRecord.isAberto!)
          ElevatedButton.icon(
            onPressed: () => _save(),
            icon: const Icon(Icons.save),
            label: const Text('Guardar'),
          ),
      ],
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextInputForm(
              label: 'Descripción',
              controller: _observacaoEC,
              validator: Validatorless.required('El Campo es Requerido'),
              onChanged: (value) {
                _controller.setObservacao(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DateFormInput(
              label: 'Fecha del Apertura',
              controller: _dtAberturaEC,
              date: _controller.currentRecord.dtAbertura!.toString(),
              selectedDate: (newDate) {
                _controller.setDtAbertura(newDate);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            NumberInputForm(
              onChanged: (value) => _controller.setVlCaixa(value),
              controller: _valorCaixaEC,
              label: 'Valor apertura',
              precision: 0,
              validator: (value) {
                if (value == null || value <= 0) {
                  // return 'El monto no puede ser vacío o igual a cero';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
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
