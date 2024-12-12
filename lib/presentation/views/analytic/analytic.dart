import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/presentation/custom_widgets/bar_chart.dart';
import 'package:sample_app/presentation/custom_widgets/circularchart.dart';
import 'package:sample_app/presentation/custom_widgets/piechart.dart';
import 'package:sample_app/presentation/views/analytic/widgets/topcards.dart';

@RoutePage()
class Analytic extends StatefulWidget {
  const Analytic({super.key});

  @override
  State<Analytic> createState() => _AnalyticState();
}

class _AnalyticState extends State<Analytic> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CommonAppBar(
      //   title: 'BP',
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Text('ANALYTICS'),
                ),
              ],
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Topcards(title: 'TOTAL BOOKS', value: '6467'),
                  Topcards(title: 'PHYSICAL', value: '5678'),
                  Topcards(title: 'E-BOOKS', value: '789'),
                  Topcards(title: 'GENRES', value: '08'),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.grey.shade200,
              child: const PieChartWidget(
                popularityPercentageList: {
                  "United States": 30,
                  "United Kingdom": 25,
                  "Germany": 15,
                  "France": 10,
                  "Australia": 5,
                  "Canada": 5,
                  "New Zealand": 5,
                  "India": 3,
                  "Japan": 2
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressChart(
                        title: 'ACADEMIC v/s LEISURE',
                        titleFontSize: 11,
                        percentage: 75,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressChart(
                        title: 'FICTION v/s NON FICTION',
                        titleFontSize: 11,
                        percentage: 25,
                        completedColor: Colors.cyan,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressChart(
                        title: 'ACADEMIC v/s LEISURE',
                        titleFontSize: 11,
                        percentage: 75,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.grey.shade200,
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressChart(
                        title: 'FICTION v/s NON FICTION',
                        titleFontSize: 11,
                        percentage: 25,
                        completedColor: Colors.cyan,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Card(
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text(
                            '2024 READING ANALYSIS',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    CustomBarGraph(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 290,
                    child: Card(
                      color: Colors.grey.shade200,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressChart(
                          title: 'LANGUAGE BREAKUP',
                          titleFontSize: 11,
                          percentage: 75,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 290,
                    child: Card(
                      color: Colors.grey.shade200,
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: CircularProgressChart(
                          title: 'INDIAN v/s FOREIGN\nAUTHORS',
                          titleFontSize: 11,
                          percentage: 25,
                          completedColor: Colors.cyan,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Card(
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text(
                            'ALL TIME READING ANALYSIS',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    CustomBarGraph(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
