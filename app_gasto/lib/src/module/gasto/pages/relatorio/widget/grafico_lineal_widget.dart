import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/models/dto/total_classificacao_gasto_dto.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/widgets/gasto_por_classificacao_list_view.dart';
import 'package:app_gasto/src/core/utils/color/colors_utils.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class GraficoLinealWidget extends StatefulWidget {
  final ObservableList<TotalClassificacaoGastoDto> listDto;
  final RelatorioGastoController gastoController;
  final Function? onPressed;
  final Caixa? caixa;

  const GraficoLinealWidget(
      {super.key,
      required this.listDto,
      required this.gastoController,
      this.onPressed,
      this.caixa});

  @override
  State<GraficoLinealWidget> createState() => _GraficoLinealWidgetState();
}

class _GraficoLinealWidgetState extends State<GraficoLinealWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listDto.length,
      itemBuilder: (context, index) {
        final gasto = widget.listDto[index];
        return _buildGastoItem(gasto, index);
      },
    );
  }

  Widget _buildGastoItem(TotalClassificacaoGastoDto dto, int index) {
    return ListTile(
      onTap: () async {
        if (dto.idClassificacao == 0) {
          return;
        }
        if (widget.caixa == null) {
          return;
        }

        final response = await widget.gastoController.findByCondition(
            "1 = 1 AND CG.ID_CLASSIFICACAO_GASTO = ${dto.idClassificacao} AND FIN_GASTO.ID_CAIXA = ${widget.caixa!.id!} AND FIN_GASTO.BO_CANCELADO = FALSE");

        Modular.to.push(
          MaterialPageRoute(
            builder: (_) {
              return GastoPorClassificacaoListView(
                gastos: response,
                dto: dto,
              );
            },
          ),
        );
      },
      leading: Icon(Icons.circle,
          color: coresPredefinidos[index % coresPredefinidos.length]),
      title: Text('${dto.descricao} ${dto.vlPorcentagem}%'),
      subtitle: Text(' ${formatCurrency(dto.vlTotal ?? 0.0, 1)}'),
      trailing: SizedBox(
        width: 100,
        child: LinearProgressIndicator(
          value: (dto.vlPorcentagem ?? 1) / 100,
          backgroundColor: Colors.grey,
          color: coresPredefinidos[index % coresPredefinidos.length],
        ),
      ),
    );
  }
}
