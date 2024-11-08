import 'package:intl/intl.dart';

String formatDate(String? date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  late DateTime dateTime;
  if (date.contains(" ")) {
    date = date.split(" ")[0];
    dateTime = DateFormat("yyyy-MM-dd").parse(date, true);
  } else {
    dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  }
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateFormatter = DateFormat('dd/MM/yyyy', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime.toLocal());
  return dtFormatedd;
}

String formatDateSql(String? date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  late DateTime dateTime;
  if (date.contains(" ")) {
    date = date.split(" ")[0];
    dateTime = DateFormat("yyyy-MM-dd").parse(date, true);
  } else {
    dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  }
  final dateFormatter = DateFormat('yyyy-MM-dd', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime.toLocal());
  return dtFormatedd;
}

String formatDateTime(DateTime? date) {
  if (date == null) {
    return '';
  }
  final dateFormatter = DateFormat('dd/MM/yyyy', 'es_PY');
  final dtFormatedd = dateFormatter.format(date.toLocal());
  return dtFormatedd;
}

String formatDateAndTimeShort(DateTime? date) {
  if (date == null) {
    return '';
  }
  final dateFormatter = DateFormat('dd/MM/yyyy HH:mm', 'es_PY');
  final dtFormatedd = dateFormatter.format(date.toLocal());
  return dtFormatedd;
}

String formatOnlyDate(String? date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateTime = DateFormat("yyyy-MM-dd").parse(date, true);
  final dateFormatter = DateFormat('dd/MM/yy', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime);
  return dtFormatedd;
}

String formatDateWithLocal(String? date) {
  if (date == null) {
    return '';
  }
  if (date.isEmpty) {
    return '';
  }
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateFormatter = DateFormat('dd/MM/yyyy', 'es_PY');
  final dtFormatedd = dateFormatter.format(DateTime.parse(date));
  return dtFormatedd;
}

String formatTime(String? date) {
  if (date == null) {
    return '';
  }
  if (date.isEmpty) {
    return '';
  }
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateFormatter = DateFormat('HH:mm', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime);
  return dtFormatedd;
}

String formatTimeWithLocal(String? date) {
  if (date == null) {
    return '';
  }
  if (date.isEmpty) {
    return '';
  }
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateFormatter = DateFormat('HH:mm', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime.toLocal());
  return dtFormatedd;
}

String formatOnlyTime(String? date) {
  if (date == null) {
    return '';
  }
  if (date.isEmpty) {
    return '';
  }
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  // var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateTime =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse('00-00-00T$date', true);
  final dateFormatter = DateFormat('HH:mm:ss', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime);
  return dtFormatedd;
}

String formatDateTimeWithLocal(String? date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  final dateFormatter = DateFormat('dd/MM/yy HH:mm', 'es_PY');
  final dtFormatedd = dateFormatter.format(DateTime.parse(date).toLocal());
  return dtFormatedd;
}

String formatHour(String? date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateFormatter = DateFormat('H:mm a', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime.toLocal());
  return dtFormatedd;
}

String formatOnlyHour(String? date) {
  if (date == null) {
    return '';
  }
  final dateTime = DateFormat("HH:mm:ss").parse(date, true);
  final dateFormatter = DateFormat('H:mm a', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime.toLocal());
  return dtFormatedd;
}

String formatHourMillesima(String? date) {
  if (date == null) {
    return '';
  }
  final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final dateFormatter = DateFormat('H:mm:ss a', 'es_PY');
  return dateFormatter.format(dateTime.toLocal());
}

DateTime utfToLocalDate(String date) {
  if (date.isEmpty) return DateTime.now();
  final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  return dateTime.toLocal();
}

int diasParaVencimiento(String dt) {
  var dtVencimento = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(dt, true);
  dtVencimento =
      DateTime(dtVencimento.year, dtVencimento.month, dtVencimento.day);
  var now = DateTime.now();
  now = DateTime(now.year, now.month, now.day);
  return (dtVencimento.difference(now).inHours / 24).round();
}

String sqlDateFormat(String? date) {
  if (date == null) {
    return '';
  }
  final dateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss', 'es_PY');
  var dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  final diference = DateTime.now().timeZoneOffset;
  dateTime = dateTime.add(Duration(hours: diference.inHours * -1));
  final dtFormatedd = dateFormatter.format(dateTime);
  return dtFormatedd;
}

String dateDiaCobroFormat(DateTime dt) {
  final start = dt.toString().replaceRange(10, null, 'T00:00:00');
  final dateFormatter = DateFormat('dd', 'es_PY');
  final s = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(start, true);
  return dateFormatter.format(s);
}

String dateDiaCobroSaveFormat(DateTime dt) {
  final start = dt.toString().replaceRange(10, null, 'T00:00:00');
  final dateFormatter = DateFormat('yyyy-MM-dd', 'es_PY');
  final s = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(start, true);
  return dateFormatter.format(s);
}

String datePickFormat(DateTime dt) {
  final start = dt.toString().replaceRange(10, null, 'T00:00:00');
  final end = dt.toString().replaceRange(10, null, 'T23:59:59');
  final dateFormatter = DateFormat('dd/MM/yy', 'es_PY');
  final s = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(start, true);
  final e = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(end, true);
  return "${dateFormatter.format(s)} - ${dateFormatter.format(e)}";
}

String formateDatePDFName(DateTime dt) {
  final dateFormatter = DateFormat('dd MM yy HH mm', 'es_PY');
  final s = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dt.toString(), true);
  return dateFormatter.format(s);
}

String formateDateField(String? date) {
  if (date == null) {
    return '';
  }
  if (date.isEmpty) {
    return '';
  }
  final dateTime = DateFormat("yyyy-MM-dd").parse(date, true);
  final dateFormatter = DateFormat('dd/MM/yyyy', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime);
  return dtFormatedd;
}

String formateDateFieldToSave(String? date) {
  if (date == null) {
    return '';
  }
  if (date.isEmpty) {
    return '';
  }
  final dateTime = DateFormat("dd/MM/yyyy").parse(date, true);
  final dateFormatter = DateFormat('yyyy-MM-dd', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime);
  return dtFormatedd;
}

String sqlDateTimeFormat(String? date) {
  if (date == null) {
    return '';
  }
  final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
  // var diference = DateTime.now().timeZoneOffset;
  // dateTime = dateTime.subtract(Duration(hours: diference.inHours * -1));
  return dateTime.toIso8601String();
}

String getDay(String date) {
  final dateTime = DateFormat("yyyy-MM-dd").parse(date, true);
  final dateFormatter = DateFormat('EEEE', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime);
  return dtFormatedd.toUpperCase();
}

String convertToNamedMonth(String mes) {
  final dateTime = DateFormat("yyyy-MM-dd").parse(mes, true);
  final dateFormatter = DateFormat('MMM/yy', 'es_PY');
  final dtFormatedd = dateFormatter.format(dateTime);
  return dtFormatedd.toUpperCase();
}

String formatYear(String anoJuramento) {
  final formatter = DateFormat('yy');
  try {
    final parsedDate = DateTime.parse('$anoJuramento-01-01 00:00:00.000');
    return formatter.format(parsedDate);
  } catch (e) {
    return '';
  }
}
