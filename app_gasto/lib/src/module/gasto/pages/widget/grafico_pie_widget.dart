import 'package:app_venda/src/module/gasto/models/dto/total_classificacao_gasto_dto.dart';
import 'package:app_venda/src/module/gasto/pages/relatorio/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoPieWidget extends StatefulWidget {
  final ObservableList<TotalClassificacaoGastoDto> listDto;
  final String title;
  const GraficoPieWidget({
    super.key,
    required this.listDto,
    required this.title,
  });

  @override
  State<GraficoPieWidget> createState() => _GraficoPieWidgetState();
}

class _GraficoPieWidgetState extends State<GraficoPieWidget> {
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: widget.title),
      legend: const Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: _getPieSeries(),
    );
  }

  List<PieSeries<TotalClassificacaoGastoDto, String>> _getPieSeries() {
    return <PieSeries<TotalClassificacaoGastoDto, String>>[
      PieSeries<TotalClassificacaoGastoDto, String>(
        dataSource: widget.listDto.asObservable(),
        xValueMapper: (TotalClassificacaoGastoDto data, _) => data.descricao,
        yValueMapper: (TotalClassificacaoGastoDto data, _) =>
            data.vlPorcentagem,
        pointColorMapper: (TotalClassificacaoGastoDto data, index) {
          return coresPredefinidos[index % coresPredefinidos.length];
        },
        dataLabelMapper: (TotalClassificacaoGastoDto data, _) =>
            '${data.vlPorcentagem}%',
        dataLabelSettings: const DataLabelSettings(isVisible: true),
      ),
    ];
  }
}
