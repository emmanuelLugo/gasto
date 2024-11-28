import 'package:app_gasto/src/core/dio/rest_client.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';

class CaixaRepository {
  final RestClient restClient;
  CaixaRepository({
    required RestClient restClient,
  }) : restClient = RestClient.auth();

  Future<Caixa> save(Caixa caixa) async {
    try {
      final response = await restClient.post(
        '/caixa/save',
        data: caixa.toJson(),
      );
      return Caixa.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }

  Future<Caixa> atualizaStatusCaixaById(int id) async {
    try {
      final response = await restClient.post(
        '/caixa/atualizaStatusCaixa/$id',
      );
      return Caixa.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }

  Future<List<Caixa>> findCaixasAbertas() async {
    try {
      List<Caixa> list = [];
      final response = await restClient.get(
        '/caixa/findCaixasAbertas',
      );
      list = response.data.map<Caixa>((e) => Caixa.fromJson(e)).toList();
      return list;
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }

  Future<List<Caixa>> findByConditionOrderByAbertos(String condition) async {
    try {
      List<Caixa> list = [];
      final response = await restClient.get(
        '/caixa/findByConditionOrderByAbertos',
        queryParameters: {
          'condition': condition,
        },
      );
      list = response.data.map<Caixa>((e) => Caixa.fromJson(e)).toList();
      return list;
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }
}
