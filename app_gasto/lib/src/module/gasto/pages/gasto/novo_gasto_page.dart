import 'package:app_gasto/src/core/components/drop_down_button_generic_widget.dart';
import 'package:app_gasto/src/core/components/fields/date/date_and_time_input.dart';
import 'package:app_gasto/src/core/components/fields/date_form_input/date_formatter.dart';
import 'package:app_gasto/src/core/components/fields/input_auto_search/input_seach_delegate.dart';
import 'package:app_gasto/src/core/components/fields/number_form_input/number_input_form.dart';
import 'package:app_gasto/src/core/components/fields/text_form_input/text_input_form.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/loader.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/snack_bar_manager.dart';
import 'package:app_gasto/src/core/ui/styles/colors_app.dart';
import 'package:app_gasto/src/core/ui/widget/custom_app_bar.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/models/classificacao_gasto.dart';
import 'package:app_gasto/src/module/gasto/pages/delegate/classificacao_gasto_delegate.dart';
import 'package:app_gasto/src/module/gasto/pages/delegate/classificacao_gasto_delegate_controller.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/gasto_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class NovoGastoPage extends StatefulWidget {
  const NovoGastoPage({super.key});

  @override
  State<NovoGastoPage> createState() => _NovoGastoPageState();
}

class _NovoGastoPageState extends State<NovoGastoPage>
    with Loader, SnackbarManager {
  final _classificacaoGastoController =
      Modular.get<ClassificacaoGastoDelegateController>();
  final _classificacaoGastoEC = TextEditingController();
  final _controller = Modular.get<GastoController>();
  final _valorEC = TextEditingController();
  final _descricaoEC = TextEditingController();
  final _dataShared = Modular.get<DataShared>();
  final _formKey = GlobalKey<FormState>();
  final _dtGastoEC = TextEditingController();
  final _isGastoRapido = Modular.args.data ?? false;
  late final ReactionDisposer _statusReactionDisposer;

  @override
  void initState() {
    super.initState();
    if (_isGastoRapido) {
      _initReaction();
    }
    _controller.initGasto();
  }

  @override
  void dispose() {
    super.dispose();
    _valorEC.dispose();
    _dtGastoEC.dispose();
    _descricaoEC.dispose();
    _classificacaoGastoEC.dispose();
    if (_isGastoRapido) {
      _statusReactionDisposer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'Nuevo Gasto',
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonGenericWidget<Caixa>(
                items: _dataShared.caixasAbertas ?? [],
                label: 'Caja',
                hint: 'Seleccione un caja',
                selectedItem: _controller.currentRecord.caixa,
                itemToString: (caixa) =>
                    '${DateFormatter.formatShortDate(caixa.dtAbertura!)} - ${caixa.observacao}',
                onChanged: _controller.setCaixa,
              ),
              const SizedBox(height: 12),
              Observer(
                builder: (_) {
                  return DateAndTimeInput(
                    date: DateTime.now(),
                    controller: _dtGastoEC,
                    label: 'Fecha del Gasto',
                    selectedDate: _controller.setDate,
                  );
                },
              ),
              const SizedBox(height: 12),
              InputSeachDelegate<ClassificacaoGasto?>(
                label: 'Clasificación',
                searchDelegate:
                    ClassificacaoGastoDelegate(_classificacaoGastoController),
                controller: _classificacaoGastoEC,
                onSelected: (value) {
                  _classificacaoGastoEC.text = value?.descricao ?? '';
                  _controller.setClassificacao(value);
                },
              ),
              const SizedBox(height: 12),
              TextInputForm(
                label: 'Observacion',
                controller: _descricaoEC,
                onChanged: _controller.setDescricao,
              ),
              const SizedBox(height: 12),
              NumberInputForm(
                onChanged: _controller.setValor,
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
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      await _controller.save();
    }
  }

  void _initReaction() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _statusReactionDisposer = reaction(
          (_) => _controller.status,
          (status) {
            switch (status) {
              case GastoStatusState.initial:
                hideLoader();
                break;
              case GastoStatusState.loaded:
                hideLoader();
                break;
              case GastoStatusState.loading:
                showLoader();
                break;
              case GastoStatusState.success:
                hideLoader();
                Modular.to.pop();
                showSuccess(_controller.message);
                break;
              case GastoStatusState.error:
                hideLoader();
                showError(_controller.message);
                break;
              case GastoStatusState.insertOrUpdate:
                hideLoader();
                break;
              default:
                hideLoader();
            }
          },
        );
      },
    );
  }
}
