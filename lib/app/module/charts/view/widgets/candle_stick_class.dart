import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../controller/candle_sticks_controller.dart';
import '../../controller/charts_controller.dart';

// quotex_style_chart_getx.dart
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ------------------------------------------------------------
/// Candle data model
/// ------------------------------------------------------------
class Candle {
  final double x;
  final double open;
  final double close;
  final double high;
  final double low;

  Candle({
    required this.x,
    required this.open,
    required this.close,
    required this.high,
    required this.low,
  });

  Candle.zero() : x = 0, open = 0, close = 0, high = 0, low = 0;

  bool get isBull => close >= open;
  bool get isBear => close < open;
}

/// ------------------------------------------------------------
/// QuotexStyleChart - Stateless widget using ChartsController
/// ------------------------------------------------------------

class QuotexStyleChart extends StatelessWidget {
  QuotexStyleChart({Key? key}) : super(key: key);

  final CandleStickController controller = Get.put(CandleStickController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChartsController>(
      builder: (_) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onScaleStart: controller.onScaleStart,
              onScaleUpdate: controller.onScaleUpdate,
              onScaleEnd: controller.onScaleEnd,
              child: ClipRect(
                child: CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: _QuotexPainter(
                    candles: controller.candles.toList(),
                    animatingCandle: controller.animatingCandle,
                    animValue: controller.animValue,
                    scale: controller.scale,
                    translateX: controller.translateX,
                    candleWidth: controller.baseCandleWidth,
                    candleSpacing: controller.candleSpacing,
                    rightPadding: controller.rightPadding,
                    formatPrice: controller.formatPrice,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// ------------------------------------------------------------
/// Painter (same logic as earlier) — now reads from controller values
/// Colors: Option 2 => green for up (bull), red for down (bear)
/// ------------------------------------------------------------
class _QuotexPainter extends CustomPainter {
  final List<Candle> candles;
  final Candle? animatingCandle;
  final double animValue; // 0..1
  final double scale;
  final double translateX;
  final double candleWidth;
  final double candleSpacing;
  final double rightPadding;
  final String Function(double) formatPrice;

  _QuotexPainter({
    required this.candles,
    required this.animatingCandle,
    required this.animValue,
    required this.scale,
    required this.translateX,
    required this.candleWidth,
    required this.candleSpacing,
    required this.rightPadding,
    required this.formatPrice,
  });

  // style
  final Color bullColor = const Color(0xFF16A34A); // green (bull)
  final Color bearColor = const Color(0xFFEF4444); // red (bear)
  final Color gridColor = const Color(0xFF2A2A2A);
  final Color axisTextColor = Colors.white70;
  final Color bgColor = Colors.transparent;
  final int gridLines = 6;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..isAntiAlias = true;

    // Background
    paint.color = bgColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // combine data + animating candle
    final allCandles = List<Candle>.from(candles);
    if (animatingCandle != null) allCandles.add(animatingCandle!);

    if (allCandles.isEmpty) return;

    // compute min/max
    double minY = allCandles.first.low;
    double maxY = allCandles.first.high;
    for (var c in allCandles) {
      if (c.low < minY) minY = c.low;
      if (c.high > maxY) maxY = c.high;
    }
    final yRangePadding = (maxY - minY) * 0.08 + 0.5;
    minY -= yRangePadding;
    maxY += yRangePadding;

    // geometry
    final singleW = (candleWidth + candleSpacing) * scale;
    // final contentW = singleW * (allCandles.length);

    final tx = translateX;
    final leftVisible = -tx - singleW;
    final rightVisible = -tx + size.width - rightPadding + singleW;

    // draw horizontal grid lines
    final gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 1.0;
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
    );
    for (int i = 0; i <= gridLines; i++) {
      final t = i / gridLines;
      final y = lerpDouble(0, size.height, t)!;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width - rightPadding, y),
        gridPaint,
      );
    }

    // right-side separator
    canvas.drawLine(
      Offset(size.width - rightPadding, 0),
      Offset(size.width - rightPadding, size.height),
      gridPaint,
    );

    // draw right-side labels (top -> maxY)
    for (int i = 0; i <= gridLines; i++) {
      final value = minY + (maxY - minY) * (i / gridLines);
      final y = lerpDouble(0, size.height, 1 - (i / gridLines))!;
      final label = formatPrice(value);
      textPainter.text = TextSpan(
        text: label,
        style: TextStyle(fontSize: 12, color: axisTextColor),
      );
      textPainter.layout(minWidth: 0, maxWidth: rightPadding - 8);
      textPainter.paint(
        canvas,
        Offset(size.width - rightPadding + 8, y - textPainter.height / 2),
      );
    }

    // utility price -> y
    double priceToY(double p) {
      final t = (p - minY) / (maxY - minY);
      return lerpDouble(size.height, 0, t)!;
    }

    // draw candles
    for (int i = 0; i < allCandles.length; i++) {
      final c = allCandles[i];
      final centerX = tx + (i * singleW) + singleW / 2;

      // culling
      if (centerX + singleW / 2 < -singleW ||
          centerX - singleW / 2 > size.width + singleW)
        continue;

      final isAnimating =
          (animatingCandle != null && i == allCandles.length - 1);

      double open = c.open;
      double close = c.close;
      if (isAnimating) {
        // grow close from open -> close using animValue
        close = lerpDouble(open, close, animValue)!;
      }

      final bodyTop = min(open, close);
      final bodyBottom = max(open, close);
      final highY = priceToY(c.high);
      final lowY = priceToY(c.low);
      final topBodyY = priceToY(bodyBottom);
      final bottomBodyY = priceToY(bodyTop);

      final isBull = c.close >= c.open;
      final color = isBull ? bullColor : bearColor;

      // wick paint
      final wickPaint = Paint()
        ..color = color
        ..strokeWidth = max(1.0, 2.0 * scale)
        ..strokeCap = StrokeCap.round;

      // upper wick
      canvas.drawLine(
        Offset(centerX, highY),
        Offset(centerX, topBodyY),
        wickPaint,
      );
      // lower wick
      canvas.drawLine(
        Offset(centerX, bottomBodyY),
        Offset(centerX, lowY),
        wickPaint,
      );

      // body paint
      final bodyPaint = Paint()..color = color;
      final halfW = (candleWidth * scale) / 2.0;
      final rect = Rect.fromLTRB(
        centerX - halfW,
        topBodyY,
        centerX + halfW,
        bottomBodyY,
      );

      if ((c.open - c.close).abs() < 0.0001) {
        // draw small horizontal line if unchanged
        canvas.drawLine(
          Offset(centerX - halfW, topBodyY),
          Offset(centerX + halfW, topBodyY),
          Paint()
            ..color = color
            ..strokeWidth = max(1.0, 2.0 * scale),
        );
      } else {
        canvas.drawRect(rect, bodyPaint);
      }
    }

    // overlay axis background
    final axisBg = Paint()..color = const Color(0xFF0D0D0D).withOpacity(0.6);
    canvas.drawRect(
      Rect.fromLTWH(size.width - rightPadding, 0, rightPadding, size.height),
      axisBg,
    );

    // latest price box
    final lastVisiblePrice = candles.isNotEmpty ? candles.last.close : 0.0;
    final priceStr = formatPrice(lastVisiblePrice);
    // final priceText = TextPainter(
    //   text: TextSpan(
    //     text: priceStr,
    //     style: const TextStyle(
    //       fontSize: 13,
    //       color: Colors.white,
    //       fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   textDirection: TextDirection.ltr,
    // );
    // priceText.layout(minWidth: 0, maxWidth: rightPadding - 12);
    // final boxPaint = Paint()..color = const Color(0xFF1F2937);
    final boxW = rightPadding - 12;
    final boxH = 28.0;
    final boxRect = Rect.fromLTWH(
      size.width - rightPadding + 8,
      12,
      boxW,
      boxH,
    );
    // canvas.drawRRect(
    //   RRect.fromRectAndRadius(boxRect, const Radius.circular(6)),
    //   boxPaint,
    // );
    // priceText.paint(
    //   canvas,
    //   Offset(boxRect.left + 8, boxRect.top + (boxH - priceText.height) / 2),
    // );
  }

  @override
  bool shouldRepaint(covariant _QuotexPainter oldDelegate) {
    return oldDelegate.candles != candles ||
        oldDelegate.translateX != translateX ||
        oldDelegate.scale != scale ||
        oldDelegate.animValue != animValue ||
        oldDelegate.animatingCandle != animatingCandle;
  }
}

/// small lerp helper that returns null-safe double
double? lerpDouble(num? a, num? b, double t) {
  if (a == null && b == null) return null;
  a ??= 0;
  b ??= 0;
  return a + (b - a) * t;
}
