// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:app_venda/src/module/login/models/usuario_filial.dart';
import 'package:app_venda/src/module/login/models/usuario_item_permissao.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario {
  int? id;
  int? codigo;
  String? sessionID;
  String? nome;
  String? login;
  String? senha;
  String? lembrete;
  bool? primeiroAcesso;
  bool? salvarSenha;
  bool? ativo;
  bool? autorizaDesconto;
  bool? cancelamentoVenda;
  bool? cancelamentoItemVenda;
  bool? autorizaVendaAbaixoCusto;
  bool? abreCaixaRegistradora;
  bool? autorizaDevolucao;
  bool? autorizaVendaCredito;
  List<UsuarioFilial>? usuarioFilialList;
  List<UsuarioItemPermissao>? itemPermissao;

  Usuario({
    this.id,
    this.codigo,
    this.sessionID,
    this.nome,
    this.login,
    this.senha,
    this.lembrete,
    this.primeiroAcesso,
    this.salvarSenha,
    this.ativo,
    this.autorizaDesconto,
    this.cancelamentoVenda,
    this.cancelamentoItemVenda,
    this.autorizaVendaAbaixoCusto = false,
    this.abreCaixaRegistradora,
    this.autorizaDevolucao,
    this.autorizaVendaCredito,
    this.usuarioFilialList,
    this.itemPermissao,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
