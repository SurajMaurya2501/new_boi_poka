import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/presentation/provider/book_shelf_riverpod.dart';

class ShelfRow extends StatefulWidget {
  final List<int> rowsBooksLen;
  const ShelfRow({required this.rowsBooksLen, super.key});

  @override
  State<ShelfRow> createState() => _ShelfRowState();
}

class _ShelfRowState extends State<ShelfRow> {
  final Random random = Random();
  int _selectedColumn = -1;
  int _selectedRow = -1;
  List<List<double>> rotationAngles = [];
  List<List<Color>> bookColors = [];

  @override
  void initState() {
    inititalizeColorsAndAngle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ListView.builder(
          itemCount: widget.rowsBooksLen.length,
          shrinkWrap: true,
          itemBuilder: (context, index1) {
            return Container(
              alignment: Alignment.bottomCenter,
              height: 140,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 90, 68, 60),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.brown,
                    width: 15,
                  ),
                  // left: BorderSide(
                  //   color: Colors.brown,
                  //   width: 5,
                  // ),
                  // right: BorderSide(
                  //   color: Colors.brown,
                  //   width: 5,
                  // ),
                ),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 10,
                children: List.generate(
                  widget.rowsBooksLen[index1],
                  (index2) {
                    return Transform.rotate(
                        angle: _selectedColumn < 0 && _selectedRow < 0
                            ? rotationAngles[index1][index2] =
                                random.nextBool() ? 0.05 : -0.05
                            : rotationAngles[index1][index2],
                        // angle: 0,
                        child: GestureDetector(
                          onTap: () {
                            _selectedColumn = index1;
                            _selectedRow = index2;
                            setState(() {});
                            ref.read(triggerProvider.notifier).state = index2;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: random.nextDouble() * 130 < 100
                                ? 115
                                : 120, // 115
                            width: random.nextDouble() * 40 < 25 ? 25 : 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                2.0,
                              ),
                              border: Border.all(
                                  color: _selectedColumn == index1 &&
                                          _selectedRow == index2
                                      ? Colors.white
                                      : Colors.black,
                                  width: _selectedColumn == index1 &&
                                          _selectedRow == index2
                                      ? 2.0
                                      : 0.0),
                              color: _selectedColumn < 0 && _selectedRow < 0
                                  ? bookColors[index1][index2] =
                                      Colors.accents[random.nextInt(
                                      Colors.accents.length,
                                    )]
                                  : bookColors[index1][index2],
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(
                                    3,
                                    3,
                                  ),
                                )
                              ],
                            ),
                            child: const Text(""),
                          ),
                        )

                        //  Draggable(
                        //   data: "This is data from daraggable book",
                        //   feedback: Material(
                        //     color: Colors.transparent,
                        //     child: BookWidget(
                        //       imageUrl: imagesUrl[index],
                        //       // width: random.nextDouble() * 40 + 40,
                        //       width: 80,
                        //       // height: random.nextDouble() * 60 + 80,
                        //       height: 115,
                        //       // color: Colors.accents[random.nextInt(
                        //       //   Colors.accents.length,
                        //       // )],
                        //       color: Colors.grey,
                        //     ),
                        //   ),
                        //   child: Container(
                        //     height: 115,
                        //     width: random.nextDouble() * 30 > 25.0
                        //         ? random.nextDouble() * 30
                        //         : 20,
                        //     decoration: BoxDecoration(
                        //       border:
                        //           Border.all(width: widget.selectedIndex == index ? 1.0 : 0.0),
                        //       color: Colors.accents[random.nextInt(
                        //         Colors.accents.length,
                        //       )],
                        //       boxShadow: const [
                        //         BoxShadow(
                        //           blurRadius: 5,
                        //           offset: Offset(
                        //             2,
                        //             2,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  void inititalizeColorsAndAngle() {
    rotationAngles = List.generate(
      widget.rowsBooksLen.length,
      (index1) {
        return List.generate(
          widget.rowsBooksLen[index1],
          (index) {
            return 0;
          },
        );
      },
    );
    bookColors = List.generate(
      widget.rowsBooksLen.length,
      (index1) {
        return List.generate(
          widget.rowsBooksLen[index1],
          (index) {
            return Colors.transparent;
          },
        );
      },
    );
  }
}
