import 'package:app_gasto/src/core/dio/rest_client.dart';
import 'package:app_gasto/src/core/exceptions/exception_utils.dart';
import 'package:app_gasto/src/core/exceptions/repository_exception.dart';
import 'package:app_gasto/src/core/exceptions/service_exception.dart';
import 'package:app_gasto/src/module/gasto/models/dto/gasto_por_semana_dto.dart';
import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:app_gasto/src/module/gasto/models/dto/gasto_dto.dart';
import 'package:app_gasto/src/module/gasto/models/dto/total_classificacao_gasto_dto.dart';

class GastoRepository {
  final RestClient restClient;
  GastoRepository({
    required RestClient restClient,
  }) : restClient = RestClient.auth();

  Future<Gasto> insertOrUpdate(Gasto gasto) async {
    try {
      final response =
          await restClient.post('/gasto/save', data: gasto.toJson());
      return Gasto.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.toException(e);
    }
  }

  Future<GastoDto> findGastoByCaixa(int idCaixa) async {
    try {
      final dto = GastoDto();

      final response = await restClient.get(
        '/gasto/findGastoByCaixa/$idCaixa',
      );
      final gastos = response.data['gastos'];
      final classificacoes = response.data['classificacoes'];
      dto.gastos = gastos.map<Gasto>((e) => Gasto.fromJson(e)).toList();

      dto.classificacoes = classificacoes
          .map<TotalClassificacaoGastoDto>(
            (e) => TotalClassificacaoGastoDto.fromJson(e),
          )
          .toList();
      if (response.data['vlTotal'] == 0) {
        dto.vlTotal = 0.0;
      } else {
        dto.vlTotal = response.data['vlTotal'];
      }
      return dto;
    } on Exception catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<GastoDto> findTotalGastoPorTipoByCaixa(int idCaixa) async {
    try {
      final dto = GastoDto();
      final response = await restClient.get(
        '/gasto/findTotalGastoPorTipoByCaixa/$idCaixa',
      );

      final classificacoes = response.data['classificacoes'];
      dto.vlTotal = response.data['vlTotal'];
      dto.classificacoes = classificacoes
          .map<TotalClassificacaoGastoDto>(
            (e) => TotalClassificacaoGastoDto.fromJson(e),
          )
          .toList();

      return dto;
    } on Exception catch (e) {
      throw ServiceException(message: ExceptionUtils.getExceptionMessage(e));
    }
  }

  Future<List<Gasto>> findByCondition(String condition) async {
    try {
      final response = await restClient.get(
        '/gasto/findByCondition',
        queryParameters: {'condition': condition},
      );
      return response.data.map<Gasto>((e) => Gasto.fromJson(e)).toList();
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }

  Future<List<GastoPorSemanaDto>> findTotalGastoPorSemana() async {
    try {
      final response = await restClient.get(
        '/gasto/findTotalGastoPorSemana',
      );
      return response.data
          .map<GastoPorSemanaDto>((e) => GastoPorSemanaDto.fromJson(e))
          .toList();
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }

  Future<Gasto> cancelaGasto(int idGasto) async {
    try {
      final response = await restClient.post('gasto/cancelaGasto/$idGasto');
      return Gasto.fromJson(response.data);
    } on Exception catch (e) {
      throw RepositoryException.fromException(e);
    }
  }
}
