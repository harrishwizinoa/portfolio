import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart' as sf;

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return sf.SfCircularChart(
      legend: const sf.Legend(isVisible: true),
      series: <sf.PieSeries<_PpieData, String>>[
        sf.PieSeries<_PpieData, String>(
          explode: true,
          explodeIndex: 0,
          dataSource: pieData,
          xValueMapper: (_PpieData data, _) => data.xData,
          yValueMapper: (_PpieData data, _) => data.yData,
          dataLabelMapper: (_PpieData data, _) => data.text,
          dataLabelSettings: const sf.DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }
}

class _PpieData {
  _PpieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}

final List<_PpieData> pieData = [
  _PpieData('C', 40, '40%'),
  _PpieData('C++', 40, '40%'),
  _PpieData('Java', 45, '45%'),
  _PpieData('Flutter', 70, '70%'),
  _PpieData('Dart', 65, '65%'),
];