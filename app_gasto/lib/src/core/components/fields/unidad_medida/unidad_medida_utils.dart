import 'package:intl/intl.dart';

class UnidadeMedidaUtils {
  static int precision(String unidadeMedida) {
    if (unidadeMedida.compareTo("KILOGRAMOS") == 0 ||
        unidadeMedida.compareTo("LITROS") == 0) {
      return 3;
    } else if (unidadeMedida.compareTo("GRAMOS") == 0 ||
        unidadeMedida.compareTo("CENTIMETROS") == 0 ||
        unidadeMedida.compareTo("MILILITROS") == 0) {
      return 0;
    } else if (unidadeMedida.compareTo("UNIDAD") == 0 ||
        unidadeMedida.compareTo("UN") == 0) {
      return 0;
    } else {
      return 2;
    }
  }

  static String format(String unidadMedida, double qtd) {
    final int p = precision(unidadMedida);

    NumberFormat format;
    if (p == 0) {
      format = NumberFormat("#,###", 'es_PY');
    } else if (p == 3) {
      format = NumberFormat("#,##0.000", 'es_PY');
    } else {
      format = NumberFormat("#,##0.00", 'es_PY');
    }
    return format.format(qtd);
  }
}
