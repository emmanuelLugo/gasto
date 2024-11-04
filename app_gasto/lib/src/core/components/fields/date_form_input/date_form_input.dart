import 'package:flutter/material.dart';

import '../../../ui/styles/theme_config.dart';
import '../text_form_input/text_form_input.dart';
import 'date_formatted.dart';

class DateFormInput extends StatefulWidget {
  final String date;
  final ValueChanged<DateTime>? selectedDate;
  final String label;
  final Color? colorFont;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double? fontSize;
  final bool? enabled;
  final DateTime? firstDate;

  const DateFormInput({
    super.key,
    required this.date,
    required this.selectedDate,
    required this.label,
    this.colorFont,
    required this.controller,
    this.validator,
    this.fontSize,
    this.enabled = true,
    this.firstDate,
  });

  @override
  DateFormInputState createState() => DateFormInputState();
}

class DateFormInputState extends State<DateFormInput> {
  late String formatted = '';
  var dtSelected = DateTime.now();

  @override
  void initState() {
    if (widget.date.isEmpty) {
      formatted = "";
    } else {
      formatted = formatDateWithLocal(widget.date);
    }
    widget.controller.text = formatted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enabled == true ? () => _onPressed() : null,
      child: AbsorbPointer(
        child: TextInputForm(
          enabled: widget.enabled,
          controller: widget.controller,
          suffixIcon: const Icon(
            Icons.calendar_today_rounded,
            color: Colors.grey,
          ),
          validator: widget.validator,
          label: widget.label,
        ),
      ),
    );
  }

  _onPressed() async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ThemeConfig.theme.colorScheme.copyWith(
                onSurface: Colors.grey,
              ),
              textButtonTheme: ThemeConfig.theme.textButtonTheme),
          child: child!,
        );
      },
      initialDate: dtSelected,
      locale: const Locale('es', 'PY'),
      firstDate: widget.firstDate ??
          DateTime(
            DateTime.now().year - 100,
          ),
      lastDate: DateTime(
        DateTime.now().year + 5,
      ),
      context: context,
    );

    if (picked == null) {
      return;
    }

    final start = picked.toString().replaceRange(10, null, "T00:00:00.000000");
    formatted = formatDateWithLocal(start);
    widget.controller.text = formatted;
    dtSelected = DateTime.parse(start);
    widget.selectedDate!(DateTime.parse(start));
  }
}
