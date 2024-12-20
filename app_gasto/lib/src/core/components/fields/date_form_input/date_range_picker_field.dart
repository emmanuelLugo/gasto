import 'package:app_gasto/src/core/components/fields/text_form_input/text_form_input.dart';
import 'package:flutter/material.dart';

class DateRangePickerField extends StatefulWidget {
  final TextEditingController dateRangeController;
  final String labelText;
  final Function(DateTimeRange?) onChanged;

  const DateRangePickerField({
    super.key,
    required this.dateRangeController,
    this.labelText = 'Seleccionar Rango de Fechas',
    required this.onChanged,
  });

  @override
  State<DateRangePickerField> createState() => _DateRangePickerFieldState();
}

class _DateRangePickerFieldState extends State<DateRangePickerField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDateRange(context),
      child: AbsorbPointer(
        child: TextInputForm(
          label: widget.labelText,
          controller: widget.dateRangeController,
          enabled: false,
          suffixIcon: const Icon(Icons.calendar_today),
        ),
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      locale: const Locale('es', 'PY'),
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      ),
    );

    widget.onChanged.call(picked);
  }
}
