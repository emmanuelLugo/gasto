import 'package:app_venda/src/core/components/fields/text_form_input/upper_case_text_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputForm extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool? autofocus;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool? enabled;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final String? initialValue;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final bool upperCase;
  final EdgeInsetsGeometry? contentPadding;
  final String? suffixText;

  const TextInputForm({
    super.key,
    required this.label,
    this.validator,
    this.controller,
    this.inputFormatters,
    this.autofocus,
    this.onChanged,
    this.focusNode,
    this.keyboardType,
    this.enabled = true,
    this.onFieldSubmitted,
    this.textAlign,
    this.suffixIcon,
    this.initialValue,
    this.maxLines,
    this.obscureText = false,
    this.hintText,
    this.upperCase = true,
    this.contentPadding,
    this.maxLength,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      initialValue: initialValue,
      inputFormatters: [
        if (upperCase) UpperCaseTextFormatter(),
        if (inputFormatters != null) ...inputFormatters!,
      ],
      keyboardType: keyboardType,
      enabled: enabled,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      textAlign: textAlign ?? TextAlign.start,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        labelText: label,
        suffixIcon: suffixIcon,
        alignLabelWithHint: true,
        suffixText: suffixText,
      ),
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
