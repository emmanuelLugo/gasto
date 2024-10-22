import 'package:intl/intl.dart';

class DateUtil {
  static String constLocale = 'es_PY';
  static DateTime? toDate(String date) {
    if (date.isEmpty) {
      return null;
    }
    return DateTime.parse(date);
  }

  static String? format(DateTime date) {
    final f = DateFormat('dd/MM/yyyy');
    return f.format(date);
  }

  static String? formatDateTime(String date) {
    if (date.isEmpty) {
      return null;
    }
    final f = DateFormat('dd/MM/yyyy HH:mm');
    final DateTime dt = toDate(date)!.toLocal();
    return f.format(dt);
  }

  static String formatHour(String? date) {
    if (date == null) {
      return '';
    }
    final dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date, true);
    final dateFormatter = DateFormat('H:mm', constLocale);
    final dtFormatedd = dateFormatter.format(dateTime.toLocal());
    return dtFormatedd;
  }

  static String? formatDate(String date) {
    if (date.isEmpty) {
      return null;
    }
    final f = DateFormat('dd/MM/yyyy');
    final DateTime dt = toDate(date)!;
    return f.format(dt);
  }

  static String? formatDateGasto(String date) {
    if (date.isEmpty) {
      return null;
    }
    final f = DateFormat('yyyy-MM-dd');
    final DateTime dt = toDate(date)!;
    return f.format(dt);
  }

  static String? javaFormat(DateTime date) {
    final f = DateFormat('yyyy-MM-ddTHH:mm');
    return f.format(date);
  }
}
