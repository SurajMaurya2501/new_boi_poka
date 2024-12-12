import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularProgressChart extends StatelessWidget {
  final String title;
  final double percentage;
  final Color completedColor;
  final Color remainingColor;
  final double innerRadius;
  final double titleFontSize; 

  const CircularProgressChart({
    super.key,
    required this.title,
    required this.percentage,
    this.completedColor = Colors.blue,
    this.remainingColor = Colors.grey,
    this.innerRadius = 85,
    this.titleFontSize = 13, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: titleFontSize, 
              ),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 208,
              child: SfCircularChart(
                series: <CircularSeries>[
                  DoughnutSeries<_ChartData, String>(
                    dataSource: [
                      _ChartData('Completed', percentage),
                      _ChartData('Remaining', 100 - percentage),
                    ],
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    innerRadius: '$innerRadius%',
                    pointColorMapper: (_ChartData data, _) =>
                        data.x == 'Completed' ? completedColor : remainingColor,
                  ),
                ],
              ),
            ),
            Text(
              '${percentage.toInt()}%',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: remainingColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
