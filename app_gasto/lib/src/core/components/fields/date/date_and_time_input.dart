import 'package:app_gasto/src/core/components/fields/date_form_input/date_formatter.dart';
import 'package:flutter/material.dart';

import '../../../ui/styles/theme_config.dart';
import '../text_form_input/text_input_form.dart';

class DateAndTimeInput extends StatefulWidget {
  final DateTime? date;
  final ValueChanged<DateTime>? selectedDate;
  final String label;
  final Color? colorFont;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final double? fontSize;
  final bool? enabled;
  final DateTime? firstDate;

  const DateAndTimeInput({
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
  DateAndTimeInputState createState() => DateAndTimeInputState();
}

class DateAndTimeInputState extends State<DateAndTimeInput> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.date ?? DateTime.now();
    widget.controller.text =
        widget.date != null ? DateFormatter.formatDateTime(widget.date!) : '';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enabled == true ? _onPressed : null,
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

  Future<void> _onPressed() async {
    if (!mounted) return;

    // Selección de fecha
    final pickedDate = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ThemeConfig.theme.colorScheme.copyWith(
              onSurface: Colors.grey,
            ),
            textButtonTheme: ThemeConfig.theme.textButtonTheme,
          ),
          child: child!,
        );
      },
      locale: const Locale('es', 'PY'),
      initialDate: selectedDate,
      firstDate: widget.firstDate ?? DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (!mounted || pickedDate == null) return;

    // Selección de hora
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    );

    if (!mounted || pickedTime == null) return;

    // Combina fecha y hora seleccionadas
    final combinedDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    selectedDate = combinedDateTime;
    widget.controller.text = DateFormatter.formatDateTime(selectedDate);
    widget.selectedDate?.call(combinedDateTime);
  }
}
