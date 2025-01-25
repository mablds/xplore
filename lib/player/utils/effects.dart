import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class EffectsUtils {
  static ParticleSystemComponent getRocketEffect(Vector2 position) =>
      ParticleSystemComponent(
        particle: Particle.generate(
          count: 100,
          lifespan: 10,
          generator: (i) => AcceleratedParticle(
            acceleration: position * 2,
            speed: Vector2.random() * 200,
            position: position,
            child: CircleParticle(
              radius: 5,
              paint: Paint()..color = Colors.red,
            ),
          ),
        ),
      );
}
