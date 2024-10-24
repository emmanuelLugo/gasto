import 'package:app_venda/src/core/components/fields/number_form_input/currency_input_formatter.dart';
import 'package:app_venda/src/module/cotacao/pages/cotacao_controller.dart';
import 'package:flutter/material.dart';

class DesktopNumberInput extends StatefulWidget {
  const DesktopNumberInput({
    super.key,
    required this.focusNodeValor,
    this.onSubmited,
    this.onChanged,
    this.hintText = "0",
    this.maxValue,
    this.absorving = false,
    this.enabled = true,
    this.autofocus = false,
    this.selecionaTexto = true,
    this.precisaoMoeda = 0,
    this.moedaBase = 1,
    required this.cotacaoController,
    this.controller,
  });

  final bool absorving;
  final bool autofocus;
  final bool enabled;
  final bool selecionaTexto;
  final int precisaoMoeda;
  final FocusNode focusNodeValor;
  final int moedaBase;
  final double? maxValue;
  final Function(double v)? onSubmited;
  final Function(double v)? onChanged;
  final String hintText;
  final CotacaoController cotacaoController;
  final TextEditingController? controller;

  @override
  State<DesktopNumberInput> createState() => _DesktopNumberInputState();
}

class _DesktopNumberInputState extends State<DesktopNumberInput> {
  @override
  void initState() {
    super.initState();
  }

  selecionaConteudo() {
    if (widget.controller == null) {
      return;
    }
    int baseOffset = 0;
    if (widget.selecionaTexto == false) {
      baseOffset = widget.controller!.text.length;
    }
    widget.controller!.selection = TextSelection(
      baseOffset: baseOffset,
      extentOffset: widget.controller!.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.precisaoMoeda.toString());
    return TextFormField(
      onTap: () => selecionaConteudo(),

      focusNode: widget.focusNodeValor,
      keyboardType: TextInputType.number,
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.white,
          ),
      onChanged: (value) {
        var v = value;
        v = value.replaceAll(".", "");
        if (v.isEmpty) {
          if (widget.onChanged != null) widget.onChanged!(0.0);
        } else {
          if (widget.onChanged != null) {
            widget.onChanged!(double.parse(v.replaceAll(",", ".")));
          }
        }
      },
      onFieldSubmitted: (value) {
        if (widget.onSubmited != null) {
          var v = value;
          v = value.replaceAll(".", "");
          if (v.isEmpty) {
            widget.onSubmited!(0.0);
          } else {
            final double val = double.parse(v.replaceAll(",", "."));
            widget.onSubmited!(val);
          }
        }
      },
      enabled: widget.enabled, //
      textAlign: TextAlign.end,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        CurrencyTextInputFormatter(
          decimalDigits: widget.precisaoMoeda == 1 ? 0 : 2,
          name: "",
          locale: (widget.moedaBase == 1
              ? "ES"
              : widget.moedaBase == 2
                  ? "US"
                  : "PT"),
        )
      ],
      decoration: InputDecoration(
        fillColor: Colors.black.withOpacity(.2),
        hintText: widget.hintText,
        filled: true,
        // errorText: "",
        contentPadding: const EdgeInsets.only(
          left: 10.0,
          right: 10,
        ),
        label: Text(
          widget.hintText,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
              ),
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.purple.withOpacity(.8), width: 1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        errorBorder: null,
        enabledBorder: null,
        focusedBorder: null,
        disabledBorder: null,
        focusedErrorBorder: null,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
      ),
    );
  }
}
