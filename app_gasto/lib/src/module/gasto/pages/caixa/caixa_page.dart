import 'package:app_gasto/src/core/components/fields/date_form_input/date_form_input.dart';
import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/core/components/fields/number_form_input/number_input_form.dart';
import 'package:app_gasto/src/core/components/fields/text_form_input/text_input_form.dart';
import 'package:app_gasto/src/core/ui/widget/custom_app_bar.dart';
import 'package:app_gasto/src/module/gasto/pages/caixa/caixa_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/caixa/widgets/status_info_caixa_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _carregaDatos();
  }

  void _carregaDatos() {
    if (_controller.currentRecord.id != null) {
      _observacaoEC.text = _controller.currentRecord.observacao ?? '';
      _dtAberturaEC.text =
          _controller.currentRecord.dtAbertura?.toString().split(' ')[0] ?? '';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: _controller.currentRecord.id != null
            ? 'Editar Cuenta'
            : 'Nueva Cuenta',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _carregaDatos,
          ),
        ],
      ),
      persistentFooterButtons: [
        if (_controller.currentRecord.id != null)
          OutlinedButton.icon(
            onPressed: () =>
                _controller.atualizaStatusCaixa(_controller.currentRecord),
            icon: Icon(
              _controller.currentRecord.isAberto!
                  ? Icons.lock_open
                  : Icons.lock,
              color: _controller.currentRecord.isAberto!
                  ? Colors.green
                  : Colors.red,
            ),
            label: Text(
                _controller.currentRecord.isAberto! ? 'Cerrar' : 'Reabrir'),
          ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          onPressed: _controller.currentRecord.isAberto! ? _save : null,
          icon: const Icon(Icons.save),
          label: const Text('Guardar'),
        ),
      ],
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusInfoCaixaWidget(caixa: _controller.currentRecord),
              const SizedBox(height: 20),
              _buildInputFields(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return Column(
      children: [
        TextInputForm(
          label: 'Descripción',
          controller: _observacaoEC,
          validator: Validatorless.required('El Campo es Requerido'),
          onChanged: _controller.setObservacao,
          prefixIcon: const Icon(Icons.description),
        ),
        const SizedBox(height: 20),
        DateFormInput(
          label: 'Fecha de Apertura',
          controller: _dtAberturaEC,
          date: _controller.currentRecord.dtAbertura?.toString() ?? '',
          selectedDate: _controller.setDtAbertura,
          prefixIcon: const Icon(Icons.date_range),
        ),
        const SizedBox(height: 20),
        NumberInputForm(
          controller: _valorCaixaEC,
          label: 'Valor Apertura',
          precision: 0,
          onChanged: _controller.setVlCaixa,
          validator: (value) {
            if (value == null || value <= 0) {
              // return 'El monto no puede ser vacío o igual a cero';
            }
            return null;
          },
          prefixIcon: const Icon(Icons.monetization_on),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      await _controller.save();
    }
  }
}
