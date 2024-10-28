import 'package:app_gasto/src/module/gasto/models/dto/total_classificacao_gasto_dto.dart';
import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/widgets/card_gasto_widget.dart';
import 'package:flutter/material.dart';

class GastoPorClassificacaoListView extends StatefulWidget {
  final TotalClassificacaoGastoDto dto;
  final List<Gasto> gastos;
  // final RelatorioGastoController gastoController;
  const GastoPorClassificacaoListView({
    super.key,
    required this.dto,
    required this.gastos,
  });

  @override
  State<GastoPorClassificacaoListView> createState() =>
      _GastoPorClassificacaoListViewState();
}

class _GastoPorClassificacaoListViewState
    extends State<GastoPorClassificacaoListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.dto.descricao}')),
      body: ListView.builder(
        itemCount: widget.gastos.length,
        itemBuilder: (context, index) {
          final gasto = widget.gastos[index];
          return CardGastoWidget(gasto: gasto);
        },
      ),
    );
  }
}
