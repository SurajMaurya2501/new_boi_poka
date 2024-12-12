import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/presentation/custom_widgets/fldoticons.dart';

class Graph extends StatefulWidget {
  final Map<String, dynamic> bookMoodData;
  const Graph({required this.bookMoodData, super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  Map<String, dynamic> bookMoodListData = {};
  List<String> moods = [];

  @override
  void initState() {
    getMoodListData(widget.bookMoodData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Row(
            children: [
              Text(
                'BOOK MOOD GRAPH',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          height: media.width * 0.5,
          width: double.maxFinite,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LineChart(LineChartData(
                  lineBarsData: lineBarsData1,
                  lineTouchData: LineTouchData(
                    handleBuiltInTouches: false,
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (touchedSpot) => Colors.blue,
                      tooltipRoundedRadius: 20,
                      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                        return lineBarsSpot.map((lineBarSpot) {
                          return LineTooltipItem(
                            lineBarSpot.y.toString(),
                            const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  minY: 0,
                  maxY: 30,
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      
                    ),
                    rightTitles: const AxisTitles(
                      
                    ),
                    topTitles: const AxisTitles(
                      
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return SizedBox(
                            width: 50,
                            child: moods.isNotEmpty
                                ? Text(
                                    moods[value.toInt()],
                                  )
                                : Container(),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    drawVerticalLine: false,
                    horizontalInterval: 5,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.15),
                      );
                    },
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
      isCurved: true,
      color: Colors.blueAccent,
      isStrokeCapRound: true,
      dotData: FlDotData(
        getDotPainter: (spot, percent, bar, index) => FlDotIconPainter(
          icon: Icons.book,
          color: Colors.pink,
          size: 10,
        ),
      ),
      belowBarData: BarAreaData(
        
      ),
      spots: List.generate(
        moods.length > 6 ? 6 : bookMoodListData.length,
        (index) {
          return FlSpot(index.toDouble(),
              double.parse(bookMoodListData[moods[index]].toString()));
        },
      ).toList());

  void getMoodListData(mapData) {
    bookMoodListData = mapData;
    moods = bookMoodListData.keys.toList();
  }
}
