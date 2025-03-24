import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:xplore/main.dart';

class CoordinatesDisplay extends TextComponent with HasGameRef<Xplore> {
  CoordinatesDisplay()
      : super(
          textRenderer: TextPaint(
            style: const TextStyle(
              color: Colors.lightGreen,
              fontSize: 12,
            ),
          ),
        );

  @override
  void update(double dt) {
    super.update(dt);
    final spaceship = gameRef.spaceship;
    text =
        '\n\n\n\nX: ${spaceship.position.x.toStringAsFixed(2)}, Y: ${spaceship.position.y.toStringAsFixed(2)}';
  }
}
