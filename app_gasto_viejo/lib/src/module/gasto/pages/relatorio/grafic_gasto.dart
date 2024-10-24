import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: 50,
            titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
            showTitle: true,
          ),
          PieChartSectionData(
            color: Colors.green,
            value: 30,
            title: '30%',
            radius: 50,
            titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
            showTitle: true,
          ),
          PieChartSectionData(
            color: Colors.orange,
            value: 20,
            title: '20%',
            radius: 50,
            titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
            showTitle: true,
          ),
          PieChartSectionData(
            color: Colors.red,
            value: 10,
            title: '10%',
            radius: 50,
            titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
            showTitle: true,
          ),
        ],
      ),
    );
  }
}
