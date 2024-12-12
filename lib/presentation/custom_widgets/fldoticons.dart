import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FlDotIconPainter extends FlDotPainter {
  Color color;

  double size;

  IconData icon;

  FlDotIconPainter({
    required this.icon,
    Color? color,
    double? size,
  })  : color = color ?? Colors.green,
        size = size ?? 24.0;

  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: size, 
          fontFamily: icon.fontFamily,
          color: color,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final offset = offsetInCanvas.translate(
      -textPainter.width / 2,
      -textPainter.height / 2,
    );

    textPainter.paint(canvas, offset);
  }

  @override
  Size getSize(FlSpot spot) {
    return Size(size, size);
  }

  @override
  List<Object?> get props => [
        color,
        size,
        icon,
      ];

  @override
  FlDotPainter lerp(FlDotPainter a, FlDotPainter b, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }

  @override
  // TODO: implement mainColor
  Color get mainColor => throw UnimplementedError();
}
