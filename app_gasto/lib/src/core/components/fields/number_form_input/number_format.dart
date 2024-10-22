import 'package:app_venda/src/core/components/fields/unidad_medida/unidad_medida_utils.dart';
import 'package:intl/intl.dart';

//formata por ejemplo 5000.0 => 5.000,00
String formatNumber(double? number, int precision) {
  String vl = '';
  number ??= 0.0;
  if (precision == 0) {
    final numberFormat = NumberFormat("###,###", 'es_PY');
    vl = numberFormat.format(number);
    return vl;
  }
  if (precision == 2) {
    final numberFormat = NumberFormat("#,##0.00", "pt_BR");
    vl = numberFormat.format(number);
    return vl;
  }
  return number.toString();
}

//formata por ejemplo 5000.0 => 5.000,00
String formatNumberByMoeda({required double number, required int idMoeda}) {
  final numberFormat = NumberFormat(
    (idMoeda != 2 && idMoeda != 3) ? "###,###" : "#,##0.00",
    'es_PY',
  );

  return numberFormat.format(number);
}

// formata por ejemplo 5000.0 => 5.000,00 R$
String formatCurrency(double? number, int idMoeda) {
  String vl = '';

  number ??= 0.0;
  if (idMoeda == 1) {
    final numberFormat =
        NumberFormat.currency(locale: 'es_PY', decimalDigits: 0, symbol: 'G\$');
    vl = numberFormat.format(number);
  } else {
    final numberFormat = NumberFormat.currency(
      locale: 'es_PY',
      decimalDigits: 2,
      symbol: idMoeda == 2 ? "U\$" : "R\$",
    );
    vl = numberFormat.format(number);
  }
  return vl;
}

String qtdFormatted({
  required String unidadeMedidaProduto,
  required double? qtdProduto,
}) {
  return UnidadeMedidaUtils.format(unidadeMedidaProduto, qtdProduto ?? 0.0);
}

String formatNumeroFatura(int nroFatura) {
  final NumberFormat formatter = NumberFormat("0000000");
  return formatter.format(nroFatura);
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
