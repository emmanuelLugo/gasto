import 'package:app_gasto/src/core/dio/rest_client.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/module/gasto/models/classificacao_gasto.dart';

class ClassificacaoGastoRepository {
  final RestClient restClient;
  ClassificacaoGastoRepository({
    required RestClient restClient,
  }) : restClient = RestClient.auth();

  Future<ClassificacaoGasto> save(ClassificacaoGasto classificacaoGasto) async {
    try {
      final response = await restClient.post('/classificacaoGasto/save', data: classificacaoGasto.toJson());
      return ClassificacaoGasto.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }

  Future<List<ClassificacaoGasto>> findByCondition(String condition) async {
    try {
      List<ClassificacaoGasto> list = [];
      final response =
          await restClient.get('/classificacaoGasto/findByCondition', queryParameters: {'condition': condition});
      list = response.data.map<ClassificacaoGasto>((e) => ClassificacaoGasto.fromJson(e)).toList();
      return list;
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }
}
