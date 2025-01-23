import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';

class ClutchButton extends PositionComponent with TapCallbacks {
  bool isTapping = false;

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = isTapping ? const Color(0xFFFF0000) : const Color(0xFF00FF00);
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  void onTapDown(TapDownEvent event) {
    isTapping = true;
  }

  @override
  void onTapUp(TapUpEvent event) {
    isTapping = false;
  }
}
