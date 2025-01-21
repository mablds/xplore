import 'dart:math';

import 'package:flame/components.dart';
import 'package:xplore/hud/clutch.dart';
import 'package:xplore/player/utils/movement.dart';

class Spaceship extends SpriteComponent {
  Spaceship({
    required this.clutch,
  });

  final ClutchButton clutch;
  final double rotateSpeed = 1.0;
  final double acceleration = 100.0;
  final Vector2 moveDirection = Vector2.zero();

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('ship.png');
    size = Vector2.all(30);
    position = center;
  }

  @override
  void update(double dt) {
    move(dt);

    super.update(dt);
  }

  void move(double dt) {
    if (MovementUtils.isRotatingRight(moveDirection)) rotateRight(dt);
    if (MovementUtils.isRotatingLeft(moveDirection)) rotateLeft(dt);
    if (MovementUtils.isClutching(clutch.isTapping)) impulse(dt);
    // if (MovementUtils.isStationary(clutch.isTapping)
    // position += _moveDirection.normalized() * 100 * dt;
  }

  void impulse(double dt) {
    // final direction = Vector2(cos(angle), sin(angle));
    final direction = Vector2(cos(angle - pi / 2), sin(angle - pi / 2));
    position += direction * acceleration * dt;
  }

  void setMoveDirection(Vector2 newDirection) =>
      moveDirection.setFrom(newDirection);

  void rotateLeft(double dt) => setAngle(angle - (rotateSpeed * dt));
  void rotateRight(double dt) => setAngle(angle + (rotateSpeed * dt));
  void setAngle(double newAngle) => angle = newAngle;

  void turnOff() => setMoveDirection(Vector2.zero());
}
