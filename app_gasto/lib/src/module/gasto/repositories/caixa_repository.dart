import 'package:app_gasto/src/core/dio/rest_client.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';

class CaixaRepository {
  final RestClient restClient;
  CaixaRepository({
    required RestClient restClient,
  }) : restClient = RestClient.auth();

  Future<void> save() async {}

  Future<List<Caixa>> findCaixasAbertas() async {
    List<Caixa> list = [];
    final response = await restClient.get(
      '/caixa/findCaixasAbertas',
    );
    list = response.data.map<Caixa>((e) => Caixa.fromJson(e)).toList();
    return list;
  }

  Future<List<Caixa>> findByConditionOrderByAbertos(String condition) async {
    List<Caixa> list = [];
    final response = await restClient.get(
      '/caixa/findByConditionOrderByAbertos',
      queryParameters: {
        'condition': condition,
      },
    );
    list = response.data.map<Caixa>((e) => Caixa.fromJson(e)).toList();
    return list;
  }
}
