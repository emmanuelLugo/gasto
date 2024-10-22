import 'package:app_venda/src/core/components/fields/number_form_input/currency_input_formatter.dart';
import 'package:app_venda/src/core/components/fields/text_form_input/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NumberInputForm extends StatefulWidget {
  final String? label;
  final Color? fontColor;
  final bool? enabled;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onSubmited;
  final String? Function(double?)? validator;
  final String? errorText;
  final FocusNode? focusNode;
  final Color? borderSideColor;
  final double? fontSize;
  final bool autoFocus;
  final int precision;
  final TextEditingController? controller;
  final double? initialValue;

  const NumberInputForm({
    super.key,
    this.label,
    this.fontColor,
    this.enabled,
    this.onSubmited,
    this.onChanged,
    this.errorText,
    this.focusNode,
    this.borderSideColor,
    this.autoFocus = false,
    this.fontSize,
    this.precision = 0,
    this.validator,
    this.controller,
    this.initialValue,
  });

  @override
  NumberFormInputState createState() => NumberFormInputState();
}

class NumberFormInputState extends State<NumberInputForm> {
  @override
  Widget build(BuildContext context) {
    return TextInputForm(
      label: widget.label ?? "",
      autofocus: widget.autoFocus,
      controller: widget.controller,
      enabled: widget.enabled ?? true,
      initialValue: widget.initialValue != null
          ? format(widget.initialValue, widget.precision)
          : null,
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
      inputFormatters: [
        CurrencyTextInputFormatter(
          decimalDigits: widget.precision,
          name: "",
          locale: "es",
        )
      ],
      keyboardType: TextInputType.number,
      textAlign: TextAlign.end,
      focusNode: widget.focusNode,
      validator: (value) {
        if (widget.validator != null) {
          var v = value;
          v = value!.replaceAll(".", "");
          if (v.isEmpty) {
            return widget.validator!(0.0);
          } else {
            return widget.validator!(double.parse(v.replaceAll(",", ".")));
          }
        }
        return null;
      },
    );
  }

  String format(double? number, int precision) {
    String vl = '';
    if (number != null) {
      if (precision == 0) {
        final numberFormat = NumberFormat("#,###");
        vl = numberFormat.format(number);
        return vl;
      }
      if (precision == 2) {
        final numberFormat = NumberFormat("#,###0.00");
        vl = numberFormat.format(number);
        return vl;
      }
    }
    return number.toString();
  }
}
