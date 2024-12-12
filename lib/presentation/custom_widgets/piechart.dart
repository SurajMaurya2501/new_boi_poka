import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PieChartWidget extends StatefulWidget {
  final Map<String, dynamic> popularityPercentageList;
  const PieChartWidget({required this.popularityPercentageList, super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int touchedIndex = -1;
  List<dynamic> values = [];
  List<String> countries = [];
  final List<Color> colors = [
    Colors.cyan.shade700,
    Colors.blue.shade600,
    Colors.cyan.shade300,
    Colors.blue.shade400,
    Colors.blue.shade500,
    Colors.cyan.shade600,
    Colors.blue.shade700,
    Colors.blue.shade800,
    Colors.cyan.shade400,
    Colors.blue,
    Colors.cyan.shade700,
    Colors.blue.shade600,
    Colors.cyan.shade300,
    Colors.blue.shade400,
    Colors.blue.shade500,
    Colors.cyan.shade600,
    Colors.blue.shade700,
    Colors.blue.shade800,
    Colors.cyan.shade400,
    Colors.blue,
  ];

  @override
  void initState() {
    getKeyAndValue(widget.popularityPercentageList);
    touchedIndex = -1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, left: 10.0),
            child: Text(
              'GEOGRAPHY WISE POPULARITY\nANALYSIS',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 250,
              height: 350,
              child: Skeleton.replace(
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    sectionsSpace: 0,
                    startDegreeOffset: 175,
                    centerSpaceRadius: 50,
                    sections: List.generate(values.length, (index) {
                      double value = double.parse(values[index].toString());
                      final isTouched = index == touchedIndex;
                      return PieChartSectionData(
                        value: value,
                        color: colors[index],
                        radius: 95 - index * 8,
                        borderSide: isTouched
                            ? const BorderSide(color: Colors.white, width: 6)
                            : BorderSide(color: Colors.white.withOpacity(0)),
                        title: value > 0 ? '${value.toInt()}%' : '',
                        titleStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                        titlePositionPercentageOffset: 1.4,
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          countries.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(0.0),
                    shrinkWrap: true,
                    itemCount: countries.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 6.0,
                    ),
                    itemBuilder: (context, index) {
                      return ColorPaletteItem(
                        title: countries[index],
                        color: colors[index],
                        style: TextStyle(
                            fontSize: touchedIndex == index ? 11 : 10,
                            fontWeight: touchedIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal),
                      );
                    },
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  height: 40,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 60,
                        padding: const EdgeInsets.all(10.0),
                        child: const Text("Shimmer Effect"),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }

  Future<void> getKeyAndValue(Map<String, dynamic> mapData) async {
    Map<String, dynamic> map = mapData;
    countries = map.keys.toList();
    values = map.values.toList();
  }
}

class ColorPaletteItem extends StatelessWidget {
  final String title;
  final Color color;
  final TextStyle style;

  const ColorPaletteItem(
      {super.key,
      required this.title,
      required this.color,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          color: color,
          margin: const EdgeInsets.only(right: 5),
        ),
        Text(
          title,
          style: style,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
