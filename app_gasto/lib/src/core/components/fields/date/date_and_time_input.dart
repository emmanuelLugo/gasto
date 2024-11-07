// import 'package:app_gasto/src/core/components/fields/date_form_input/date_formatted.dart';
// import 'package:flutter/material.dart';

// import '../../../ui/styles/theme_config.dart';
// import '../text_form_input/text_form_input.dart';

// class DateAndTimeInput extends StatefulWidget {
//   final String date;
//   final ValueChanged<DateTime>? selectedDate;
//   final String label;
//   final Color? colorFont;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final double? fontSize;
//   final bool? enabled;
//   final DateTime? firstDate;

//   const DateAndTimeInput({
//     super.key,
//     required this.date,
//     required this.selectedDate,
//     required this.label,
//     this.colorFont,
//     required this.controller,
//     this.validator,
//     this.fontSize,
//     this.enabled = true,
//     this.firstDate,
//   });

//   @override
//   DateAndTimeInputState createState() => DateAndTimeInputState();
// }

// class DateAndTimeInputState extends State<DateAndTimeInput> {
//   late String formatted = '';
//   var dtSelected = DateTime.now();

//   @override
//   void initState() {
//     if (widget.date.isEmpty) {
//       formatted = "";
//     } else {
//       formatted = formatDateTimeWithLocal(widget.date);
//     }
//     widget.controller.text = formatted;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: widget.enabled == true ? () => _onPressed() : null,
//       child: AbsorbPointer(
//         child: TextInputForm(
//           enabled: widget.enabled,
//           controller: widget.controller,
//           suffixIcon: const Icon(
//             Icons.calendar_today_rounded,
//             color: Colors.grey,
//           ),
//           validator: widget.validator,
//           label: widget.label,
//         ),
//       ),
//     );
//   }

//   _onPressed() async {
//     // Selección de fecha
//     final DateTime? pickedDate = await showDatePicker(
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//               colorScheme: ThemeConfig.theme.colorScheme.copyWith(
//                 onSurface: Colors.grey,
//               ),
//               textButtonTheme: ThemeConfig.theme.textButtonTheme),
//           child: child!,
//         );
//       },
//       initialDate: dtSelected,
//       locale: const Locale('es', 'PY'),
//       firstDate: widget.firstDate ?? DateTime(DateTime.now().year - 100),
//       lastDate: DateTime(DateTime.now().year + 5),
//       context: context,
//     );

//     if (pickedDate == null) {
//       return;
//     }

//     // Selección de hora
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.fromDateTime(dtSelected),
//     );

//     if (pickedTime == null) {
//       return;
//     }

//     // Combina fecha y hora seleccionadas
//     final DateTime combinedDateTime = DateTime(
//       pickedDate.year,
//       pickedDate.month,
//       pickedDate.day,
//       pickedTime.hour,
//       pickedTime.minute,
//     );

//     // Formatea fecha y hora para mostrar en el campo de texto
//     formatted = formatDateAndTimeShort(combinedDateTime);
//     widget.controller.text = formatted;

//     dtSelected = combinedDateTime;
//     widget.selectedDate?.call(combinedDateTime);
//   }
// }
