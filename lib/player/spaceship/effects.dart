import 'dart:developer';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class EffectsUtils {
  static Vector2 getRandomVector() =>
      (Vector2.random(Random()) - Vector2(0.5, -1)) * 500;

  static ParticleSystemComponent getRocketEffect(Vector2 position) {
    final spaceshipPosition = position.clone();

    return ParticleSystemComponent(
      size: Vector2.all(10),
      particle: Particle.generate(
        count: 3,
        lifespan: 0.1,
        generator: (_) => AcceleratedParticle(
          position: spaceshipPosition.clone() -
              Vector2(spaceshipPosition.x - 15, spaceshipPosition.y - 20),
          acceleration: getRandomVector(),
          speed: getRandomVector() / 3,
          child: CircleParticle(
            radius: 1.0,
            paint: Paint()..color = const Color.fromARGB(255, 247, 220, 137),
          ),
        ),
      ),
    );
  }
}
