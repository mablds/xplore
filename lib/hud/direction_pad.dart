import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/painting.dart';

class DirectionalPad {
  DirectionalPad()
      : leftDirectionalButton = LeftDirectionButton(),
        rightDirectionalButton = RightDirectionButton();

  final LeftDirectionButton leftDirectionalButton;
  final RightDirectionButton rightDirectionalButton;

  void renderDirectionalPad(Canvas canvas) {
    leftDirectionalButton.render(canvas);
    rightDirectionalButton.render(canvas);
  }
}

class LeftDirectionButton extends PositionComponent with TapCallbacks {
  bool isTapping = false;

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = isTapping
          ? const Color(0xFF00FF00)
          : const Color.fromARGB(255, 134, 132, 132);
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  void onTapDown(TapDownEvent event) => isTapping = true;

  @override
  void onTapUp(TapUpEvent event) => isTapping = false;
}

class RightDirectionButton extends PositionComponent with TapCallbacks {
  bool isTapping = false;

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = isTapping
          ? const Color(0xFF00FF00)
          : const Color.fromARGB(255, 134, 132, 132);
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  void onTapDown(TapDownEvent event) => isTapping = true;

  @override
  void onTapUp(TapUpEvent event) => isTapping = false;
}
