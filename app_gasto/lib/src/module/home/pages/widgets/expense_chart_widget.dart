import 'package:app_gasto/src/module/gasto/models/dto/gasto_por_semana_dto.dart';
import 'package:app_gasto/src/module/home/pages/configuracao_sistema_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseChartWidget extends StatelessWidget {
  final ConfiguracaoSistemaController controller;
  ExpenseChartWidget({super.key, required this.controller});

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(
      enable: true,
      format: 'point.x : point.y GS',
      header: '',
      canShowMarker: false);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0),
            majorGridLines: const MajorGridLines(width: 0),
            minimum: 0,
            maximum: (controller.valorMaximoDeGastoPorSemana + 100000),
            interval: 100000,
            numberFormat: NumberFormat.currency(
              locale: 'es',
              symbol: '',
              decimalDigits: 0,
            ),
          ),
          series: <ChartSeries>[
            ColumnSeries<GastoPorSemanaDto, String>(
              dataSource: controller.gastos,
              xValueMapper: (GastoPorSemanaDto data, _) =>
                  data.diasDaSemanaString,
              yValueMapper: (GastoPorSemanaDto data, _) => data.vlTotal,
              color: const Color.fromARGB(255, 50, 145, 189),
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        );
      },
    );
  }
}
