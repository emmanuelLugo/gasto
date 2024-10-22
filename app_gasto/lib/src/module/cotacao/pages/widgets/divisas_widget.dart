import 'package:app_venda/src/core/components/banderas/bandeiras.dart';
import 'package:app_venda/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_venda/src/core/components/fields/number_form_input/number_input_form.dart';
import 'package:app_venda/src/module/cotacao/models/cotacao/item_cotacao.dart';
import 'package:app_venda/src/module/cotacao/pages/cotacao_controller.dart';
import 'package:app_venda/src/module/login/models/moeda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DivisasWidget extends StatefulWidget {
  final ItemCotacao item;
  final Function(String)? onSubmitFin;
  final int divisaSelected;
  final Moeda moedaBase;
  final int idMoedaBase;
  final CotacaoController cotacaoController;
  const DivisasWidget({
    super.key,
    required this.item,
    this.onSubmitFin,
    this.divisaSelected = 0,
    required this.moedaBase,
    required this.cotacaoController,
    required this.idMoedaBase,
  });

  @override
  DivisasWidgetState createState() => DivisasWidgetState();
}

class DivisasWidgetState extends State<DivisasWidget> {
  final fNFac = FocusNode();
  final fNFin = FocusNode();

  final guaraniFinTEC = TextEditingController();
  final guaraniFacTEC = TextEditingController();
  final realFinTEC = TextEditingController();
  final realFacTEC = TextEditingController();
  final dolarFinTEC = TextEditingController();
  final dolarFacTEC = TextEditingController();

  TextEditingController _resolveTextController(bool financeiro) {
    final controllers = {
      1: financeiro ? guaraniFinTEC : guaraniFacTEC,
      2: financeiro ? realFinTEC : realFacTEC,
      3: financeiro ? dolarFinTEC : dolarFacTEC,
    };
    return controllers[widget.item.moeda!.id] ?? guaraniFacTEC;
  }

  void _inicializaDados() {
    switch (widget.item.moeda!.id) {
      case 2:
        realFinTEC.text =
            formatNumber(widget.item.vlFinancero, widget.item.moeda!.id!);
        realFacTEC.text =
            formatNumber(widget.item.vlFaturacao, widget.item.moeda!.id!);
        break;
      case 3:
        dolarFinTEC.text =
            formatNumber(widget.item.vlFinancero, widget.item.moeda!.id!);
        dolarFacTEC.text =
            formatNumber(widget.item.vlFaturacao, widget.item.moeda!.id!);
        break;
      default:
        guaraniFinTEC.text =
            formatNumber(widget.item.vlFinancero, widget.item.moeda!.id!);
        guaraniFacTEC.text =
            formatNumber(widget.item.vlFaturacao, widget.item.moeda!.id!);
        break;
    }
  }

  @override
  void initState() {
    _setFocusDivisa();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _inicializaDados();
    });
    super.initState();
  }

  @override
  void dispose() {
    fNFac.dispose();
    fNFin.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant DivisasWidget oldWidget) {
    _setFocusDivisa();
    super.didUpdateWidget(oldWidget);
  }

  void _setFocusDivisa() {
    if (widget.item.moeda!.id == widget.divisaSelected) {
      fNFac.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Bandeiras.banderaById(widget.item.moeda!.id!),
          const SizedBox(
            width: 5,
          ),
          Observer(
            builder: (_) {
              return Flexible(
                child: NumberInputForm(
                  controller: _resolveTextController(false),
                  precision: widget.idMoedaBase == 1 ? 0 : 2,
                  onChanged: (value) => widget.item.vlFaturacao = value,
                ),
              );
            },
          ),
          const SizedBox(
            width: 5,
          ),
          Observer(
            builder: (_) {
              return Flexible(
                child: NumberInputForm(
                  controller: _resolveTextController(true),
                  precision: widget.idMoedaBase == 1 ? 0 : 2,
                  onChanged: (value) => widget.item.vlFinancero = value,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void trocaMoedaEstado(ItemCotacao item, bool value) {
    // item.isAtivo = value;
  }
}
