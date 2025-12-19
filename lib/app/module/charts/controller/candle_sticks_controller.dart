import 'dart:async';
import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

import '../view/widgets/candle_stick_class.dart';

class CandleStickController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // public state
  final RxList<Candle> candles = <Candle>[].obs;
  double scale = 1.0; // horizontal zoom
  double translateX = 0.0; // pan offset (in pixels)
  Candle? animatingCandle;
  double animValue = 0.0;

  // visual defaults (can be made configurable)
  final double baseCandleWidth = 14.0;
  final double candleSpacing = 8.0;
  final double rightPadding = 64.0;
  final double minScale = 0.5;
  final double maxScale = 3.5;

  // internals
  late AnimationController animController;
  Timer? _liveTimer;
  bool _animatingIn = false;

  @override
  void onInit() {
    super.onInit();

    animController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 420),
        )..addListener(() {
          animValue = animController.value;
          // notify UI to repaint
          update();
        });

    // seed sample data
    _seedInitialCandles();

    // simulate live incoming candles every 1.2s (replace this with real feed)
    _liveTimer = Timer.periodic(const Duration(milliseconds: 1200), (_) {
      appendNextCandle();
    });
  }

  @override
  void onClose() {
    _liveTimer?.cancel();
    animController.dispose();
    super.onClose();
  }

  // ------------------------------------------------------------
  // Seed initial sample candles (simple upward drift)
  // ------------------------------------------------------------
  void _seedInitialCandles() {
    final rnd = Random(42);
    double lastClose = 24.00;
    for (int i = 0; i < 40; i++) {
      final open = lastClose + (rnd.nextDouble() - 0.5) * 0.6;
      final close = open + (rnd.nextDouble() - 0.4) * 1.2;
      final high = max(open, close) + rnd.nextDouble() * 0.8;
      final low = min(open, close) - rnd.nextDouble() * 0.8;
      candles.add(
        Candle(x: i.toDouble(), open: open, close: close, high: high, low: low),
      );
      lastClose = close;
    }

    // ensure translateX initially shows the rightmost area
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _alignToRight();
      update();
    });
  }

  // ------------------------------------------------------------
  // Append a new candle (animated). Replace with your feed call.
  // ------------------------------------------------------------
  void appendNextCandle() {
    final rnd = Random();
    final last = candles.isNotEmpty ? candles.last : Candle.zero();
    final x = (last.x + 1);
    final base = last.close == 0 ? 24.0 : last.close;
    final open = base + (rnd.nextDouble() - 0.5) * 1.2;
    final close = open + (rnd.nextDouble() - 0.6) * 1.8;
    final high = max(open, close) + rnd.nextDouble() * 1.2;
    final low = min(open, close) - rnd.nextDouble() * 1.2;
    final c = Candle(x: x, open: open, close: close, high: high, low: low);

    // animate in
    animatingCandle = c;
    _animatingIn = true;
    animController.forward(from: 0.0).whenComplete(() {
      // commit candle to list
      candles.add(c);
      animatingCandle = null;
      _animatingIn = false;
      update();

      // auto-scroll to keep newest in view
      _alignToRight();
    });

    update();
  }

  // ------------------------------------------------------------
  // Align content so rightmost candle is visible near the right padding
  // ------------------------------------------------------------
  void _alignToRight() {
    final totalWidth = _totalContentWidth();
    final viewWidth = Get.context?.size?.width ?? 300.0;
    final desiredRightEdge = totalWidth * scale; // content scaled width
    final desiredTranslate = -max(
      0.0,
      desiredRightEdge - (viewWidth - rightPadding),
    );
    // smooth adjust
    translateX = _lerp(translateX, desiredTranslate, 0.35);
  }

  double _lerp(double a, double b, double t) => a + (b - a) * t;

  double _totalContentWidth() {
    final count = max(1, candles.length + (_animatingIn ? 1 : 0));
    final single = baseCandleWidth + candleSpacing;
    return single * count;
  }

  // ------------------------------------------------------------
  // Gesture handlers (called from widget)
  // ------------------------------------------------------------
  void onScaleStart(ScaleStartDetails details) {
    // nothing special to store
    update();
  }

  void onScaleUpdate(ScaleUpdateDetails details) {
    // update scale (pinch)
    final newScale = (scale * details.scale).clamp(minScale, maxScale);
    final focal = details.focalPoint;
    final dx = focal.dx;
    final prevScale = scale;
    final scaleDiff = (prevScale == 0) ? 1.0 : newScale / prevScale;
    // keep focal point stable while scaling
    translateX =
        (translateX - dx) * scaleDiff + dx + details.focalPointDelta.dx;
    scale = newScale;
    // panning from gesture
    translateX += details.focalPointDelta.dx;
    // clamp translate so content doesn't drift too far (optional)
    _clampTranslate();
    update();
  }

  void onScaleEnd(ScaleEndDetails details) {
    // No-op
    update();
  }

  // manual pan (if you want separate drag)
  void panBy(double deltaX) {
    translateX += deltaX;
    _clampTranslate();
    update();
  }

  // ensure translateX doesn't leave huge empty area on right or left
  void _clampTranslate() {
    final contentWidth = _totalContentWidth() * scale;
    final viewWidth = Get.context?.size?.width ?? 300.0;
    // min translate: when content right aligns to rightPadding: translate = -(contentWidth - (viewWidth - rightPadding))
    final minTranslate = -max(0.0, contentWidth - (viewWidth - rightPadding));
    // max translate: content leftmost aligned to left = 0
    final maxTranslate = 0.0;
    if (translateX < minTranslate) translateX = minTranslate;
    if (translateX > maxTranslate) translateX = maxTranslate;
  }

  // ------------------------------------------------------------
  // Utility format function for axis text
  // ------------------------------------------------------------
  String formatPrice(double v) {
    final sign = v < 0 ? '-' : '';
    final absV = v.abs();
    final whole = absV.floor();
    final frac = ((absV - whole) * 100).round();
    final wholeStr = _withCommas(whole);
    final fracStr = frac.toString().padLeft(2, '0');
    return '$sign$wholeStr.$fracStr';
  }

  String _withCommas(int number) {
    var s = number.toString();
    final sb = StringBuffer();
    var len = s.length;
    for (int i = 0; i < len; i++) {
      sb.write(s[i]);
      final remaining = len - i - 1;
      if (remaining > 0 && remaining % 3 == 0) sb.write(',');
    }
    return sb.toString();
  }
}
