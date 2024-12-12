import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReadingPersonaChart extends StatelessWidget {
  final List<String> genres = [
    'adventure',
    'academic',
    'self-help',
    'fiction',
    'self-help',
    'self-help',
    'self-help',
    'self-help',
    'self-help',
    'self-help',
    'self-help',
  ];

  final List<double> values = [
    5,
    3,
    4,
    4,
    1,
    2,
    3,
    5,
    1,
    2,
    1,
  ];

  ReadingPersonaChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: RadarChart(
        RadarChartData(
          dataSets: [
            RadarDataSet(
              dataEntries: values.asMap().entries.map((entry) {
                return RadarEntry(value: entry.value);
              }).toList(),
              fillColor: Colors.purple.withOpacity(0.3),
              borderColor: Colors.purple,
              borderWidth: 2,
            ),
          ],
          getTitle: (index, _) => RadarChartTitle(text: genres[index]),
          radarBorderData: const BorderSide(color: Colors.grey),
          radarShape: RadarShape.circle,

          gridBorderData:
              const BorderSide(color: Colors.grey), // Outer border
          tickCount: 4,
          tickBorderData: const BorderSide(color: Colors.grey),
          radarBackgroundColor: Colors.transparent,
          titleTextStyle:
              const TextStyle(color: Colors.black, fontSize: 12), // Title style
        ),
      ),
    );
  }
}
