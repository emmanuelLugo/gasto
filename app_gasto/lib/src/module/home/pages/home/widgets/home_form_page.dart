import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/core/ui/helpers/helpers/size_extension.dart';
import 'package:app_gasto/src/module/core/shared/data_shared.dart';
import 'package:app_gasto/src/module/gasto/models/dto/gasto_por_semana_dto.dart';
import 'package:app_gasto/src/module/home/pages/home/configuracao_sistema_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeFormPage extends StatefulWidget {
  final DataShared dataShared;
  final ConfiguracaoSistemaController controller;
  const HomeFormPage({
    super.key,
    required this.dataShared,
    required this.controller,
  });

  @override
  State<HomeFormPage> createState() => _HomeFormPageState();
}

class _HomeFormPageState extends State<HomeFormPage> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        format: 'point.x : point.y GS',
        header: '',
        canShowMarker: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) {
            return Text(
              'Gasto de la semana: ${formatCurrency(widget.controller.totalGastoPorSemana ?? 0.0, 1)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            );
          },
        ),
        SizedBox(
          height: context.screenHeight * 0.4,
          child: Observer(
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
                  maximum:
                      (widget.controller.valorMaximoDeGastoPorSemana + 100000),
                  interval: 100000,
                  numberFormat: NumberFormat.currency(
                    locale: 'es',
                    symbol: '',
                    decimalDigits: 0,
                  ),
                ),
                series: <ChartSeries>[
                  ColumnSeries<GastoPorSemanaDto, String>(
                    dataSource: widget.controller.gastos,
                    xValueMapper: (GastoPorSemanaDto data, _) =>
                        data.diasDaSemanaString,
                    yValueMapper: (GastoPorSemanaDto data, _) => data.vlTotal,
                    color: Colors.lightBlue,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
