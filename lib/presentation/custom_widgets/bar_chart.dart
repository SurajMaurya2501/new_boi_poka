import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomBarGraph extends StatefulWidget {
  CustomBarGraph({super.key});

  final Color dark = Colors.blue.shade900;
  final Color normal = Colors.cyan.shade300;
  final Color light = Colors.greenAccent.shade200;

  @override
  State<StatefulWidget> createState() => CustomBarGraphState();
}

class CustomBarGraphState extends State<CustomBarGraph> {
  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(fontSize: 10);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            const double barsWidth = 20.0; 
            const double barsSpace = 15.0; 

            return BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitles,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    
                  ),
                  rightTitles: const AxisTitles(
                    
                  ),
                ),
                gridData: FlGridData(
                  checkToShowHorizontalLine: (value) => value % 10 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black.withOpacity(0.1),
                    strokeWidth: 1,
                  ),
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                groupsSpace: barsSpace,
                barGroups: getData(barsWidth, barsSpace),
              ),
            );
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 42,
            rodStackItems: [
              BarChartRodStackItem(0, 17, widget.dark),
              BarChartRodStackItem(17, 32, widget.normal),
              BarChartRodStackItem(32, 42, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 47,
            rodStackItems: [
              BarChartRodStackItem(0, 13, widget.dark),
              BarChartRodStackItem(13, 25, widget.normal),
              BarChartRodStackItem(25, 47, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 38,
            rodStackItems: [
              BarChartRodStackItem(0, 15, widget.dark),
              BarChartRodStackItem(15, 28, widget.normal),
              BarChartRodStackItem(28, 38, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 33,
            rodStackItems: [
              BarChartRodStackItem(0, 12, widget.dark),
              BarChartRodStackItem(12, 23, widget.normal),
              BarChartRodStackItem(23, 33, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 47,
            rodStackItems: [
              BarChartRodStackItem(0, 13, widget.dark),
              BarChartRodStackItem(13, 27, widget.normal),
              BarChartRodStackItem(27, 47, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 57,
            rodStackItems: [
              BarChartRodStackItem(0, 7, widget.dark),
              BarChartRodStackItem(7, 34, widget.normal),
              BarChartRodStackItem(34, 57, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 37,
            rodStackItems: [
              BarChartRodStackItem(0, 23, widget.dark),
              BarChartRodStackItem(23, 33, widget.normal),
              BarChartRodStackItem(33, 37, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 7,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 43,
            rodStackItems: [
              BarChartRodStackItem(0, 13, widget.dark),
              BarChartRodStackItem(13, 26, widget.normal),
              BarChartRodStackItem(26, 43, widget.light),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
    ];
  }
}
