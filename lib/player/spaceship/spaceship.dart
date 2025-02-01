import 'package:flame/components.dart';
import 'package:xplore/main.dart';
import 'package:xplore/player/utils/movement.dart';

import '../../hud/hud.dart';
import '../utils/direction.dart';
import 'effects.dart';

class Spaceship extends SpriteComponent with HasGameRef<Xplore> {
  Spaceship({
    required this.hud,
  });

  final Hud hud;

  final double rotateSpeed = 1.0;
  final Vector2 moveDirection = Vector2.zero();
  double acceleration = 0;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('ship.png');
    size = Vector2.all(30);
  }

  @override
  void update(double dt) {
    move(dt);

    super.update(dt);
  }

  void move(double dt) {
    if (MovementUtils.isRotatingLeft(hud.leftDirectionalButton.isTapping)) {
      rotateLeft(dt);
    }

    if (MovementUtils.isRotatingRight(hud.rightDirectionalButton.isTapping)) {
      rotateRight(dt);
    }

    if (MovementUtils.isClutching(hud.clutchButton.isTapping)) impulse(dt);

    decreaseSpeed(dt);
  }

  void impulse(double dt) {
    if (acceleration == 0) acceleration = 1;
    if (acceleration > 0 && acceleration < 95) acceleration += 0.5;
    if (acceleration >= 95) acceleration = 100;

    add(EffectsUtils.getRocketEffect(position.clone()));

    position += DirectionUtils.getForwardDirection(angle) * acceleration * dt;
  }

  void decreaseSpeed(double dt) {
    if (acceleration > 1) acceleration -= 0.06;
    if (acceleration > 0 && acceleration < 1) acceleration -= 0.03;
    if (acceleration < 0) acceleration = 0;

    position += DirectionUtils.getForwardDirection(angle) * acceleration * dt;
  }

  void setMoveDirection(Vector2 newDirection) =>
      moveDirection.setFrom(newDirection);

  void rotateLeft(double dt) => setAngle(angle - (rotateSpeed * dt));
  void rotateRight(double dt) => setAngle(angle + (rotateSpeed * dt));

  void setAngle(double newAngle) => angle = newAngle;
  void turnOff() => setMoveDirection(Vector2.zero());
}
