import 'dart:ui';

import 'package:flutter/material.dart';

class DottedBorder extends BoxBorder {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashGap;

  const DottedBorder({
    this.color = Colors.black,
    this.strokeWidth = 3.0,
    this.dashWidth = 7.0,
    this.dashGap = 3.0,
  });

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path();
    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      borderRadius?.topLeft ?? Radius.zero,
    );

    path.addRRect(rrect);

    final PathMetrics pathMetrics = path.computeMetrics();

    for (final PathMetric pathMetric in pathMetrics) {
      double start = 0.0;
      while (start < pathMetric.length) {
        final double end = (start + dashWidth).clamp(0.0, pathMetric.length);
        if (end > start) {
          final Path extractPath = pathMetric.extractPath(start, end);
          canvas.drawPath(extractPath, paint);
        }
        start = end + dashGap;
      }
    }
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(strokeWidth);

  @override
  DottedBorder scale(double t) {
    return DottedBorder(
      color: Color.lerp(null, color, t) ?? color,
      strokeWidth: strokeWidth * t,
      dashWidth: dashWidth * t,
      dashGap: dashGap * t,
    );
  }

  @override
  ShapeBorder? addForm(ShapeBorder other, {bool reversed = false}) {
    return null;
  }

  @override
  DottedBorder lerpFrom(ShapeBorder? a, double t) {
    if (a is DottedBorder) {
      return DottedBorder(
        color: Color.lerp(a.color, color, t)!,
        strokeWidth: lerpDouble(a.strokeWidth, strokeWidth, t)!,
        dashWidth: lerpDouble(a.dashWidth, dashWidth, t)!,
        dashGap: lerpDouble(a.dashGap, dashGap, t)!,
      );
    }
    return this;
  }

  @override
  DottedBorder lerpTo(ShapeBorder? b, double t) {
    if (b is DottedBorder) {
      return DottedBorder(
        color: Color.lerp(color, b.color, t)!,
        strokeWidth: lerpDouble(strokeWidth, b.strokeWidth, t)!,
        dashWidth: lerpDouble(dashWidth, b.dashWidth, t)!,
        dashGap: lerpDouble(dashGap, b.dashGap, t)!,
      );
    }
    return this;
  }

  @override
  // TODO: implement bottom
  BorderSide get bottom => throw UnimplementedError();

  @override
  // TODO: implement isUniform
  bool get isUniform => throw UnimplementedError();

  @override
  // TODO: implement top
  BorderSide get top => throw UnimplementedError();
}
