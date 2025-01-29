import 'dart:developer';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class EffectsUtils {
  static Vector2 getRandomVector() =>
      (Vector2.random(Random()) - Vector2(0.5, -1)) * 500;

  static ParticleSystemComponent getRocketEffect(Vector2 position) {
    return ParticleSystemComponent(
      size: Vector2.all(20),
      particle: Particle.generate(
        count: 10,
        lifespan: 0.1,
        generator: (_) => AcceleratedParticle(
          position: position.clone() / 14.5,
          acceleration: getRandomVector(),
          speed: getRandomVector() / 2,
          child: CircleParticle(
            radius: 1.0,
            paint: Paint()..color = Colors.red,
          ),
        ),
      ),
    );
  }
}
