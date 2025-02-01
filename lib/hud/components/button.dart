import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/painting.dart';

class PositionedButton extends PositionComponent with TapCallbacks {
  PositionedButton({
    required this.pressedColor,
    required this.defaultColor,
  });

  factory PositionedButton.create({
    Color? pressedColor,
    Color? defaultColor,
  }) =>
      PositionedButton(
        pressedColor: pressedColor ?? const Color(0xFF00FF00),
        defaultColor: defaultColor ?? const Color.fromARGB(255, 134, 132, 132),
      );

  final Color pressedColor;
  final Color defaultColor;
  bool isTapping = false;

  @override
  void render(Canvas canvas) => canvas.drawRect(
      size.toRect(), Paint()..color = isTapping ? pressedColor : defaultColor);

  @override
  void onTapDown(TapDownEvent event) => isTapping = true;

  @override
  void onTapUp(TapUpEvent event) => isTapping = false;
}
