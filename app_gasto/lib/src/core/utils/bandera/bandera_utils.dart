import 'package:app_gasto/src/core/components/banderas/bandeiras.dart';

class BanderaUtils {
  static bandera(int id) {
    if (id == 1) {
      return const BandeiraParaguay(
        size: 12,
      );
    }
    if (id == 2) {
      return const BandeiraEEUU(
        size: 12,
      );
    }
    if (id == 3) {
      return const BandeiraBrasil(
        size: 12,
      );
    }
  }
}
