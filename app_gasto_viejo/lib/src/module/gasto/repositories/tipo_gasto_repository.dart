import 'package:app_venda/src/core/dio/rest_client.dart';
import 'package:app_venda/src/module/gasto/models/tipo_gasto.dart';

class TipoGastoRepository {
  final RestClient restClient;

  TipoGastoRepository({
    required RestClient restClient,
  }) : restClient = RestClient.auth();

  Future<List<TipoGasto>> findAllTipoGasto(String condition) async {
    try {
      final response =
          await restClient.get('/tipoGasto/findByCondition/', queryParameters: {
        'condition': condition,
      });
      return response.data
          .map<TipoGasto>((e) => TipoGasto.fromJson(e))
          .toList();
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
