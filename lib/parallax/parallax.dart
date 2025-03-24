import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:xplore/main.dart';

class ParallaxBackground extends ParallaxComponent<Xplore> {
  @override
  Future<void> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData('parallax/stars1.png'),
      ],
      velocityMultiplierDelta: Vector2(1.8, 1.0),
      repeat: ImageRepeat.repeat,
    );
  }

  @override
  void update(double dt) {
    final acceleration = game.spaceship.acceleration;
    final direction = game.spaceship.moveDirection;
    parallax?.baseVelocity = direction * acceleration;
    super.update(dt);
  }
}
