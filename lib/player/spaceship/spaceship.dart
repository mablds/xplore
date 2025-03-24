import 'package:flame/components.dart';
import 'package:xplore/main.dart';
import 'package:xplore/player/utils/movement.dart';

import '../../hud/hud.dart';
import '../utils/direction.dart';
import 'effects.dart';

class Spaceship extends SpriteComponent with HasGameRef<Xplore> {
  Spaceship({required this.hud});

  final Hud hud;

  final double rotateSpeed = 1.0;
  final Vector2 moveDirection = Vector2.zero();
  final Vector2 lastImpulseDirection = Vector2.zero();
  double acceleration = 0;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('spaceships/tiny_ship21.png');
    anchor = Anchor.bottomCenter;
    size = Vector2.all(30);
  }

  @override
  void update(double dt) {
    move(dt);

    // position.x = position.x.clamp(0, gameRef.background.size.x - size.x);
    // position.y = position.y.clamp(0, gameRef.background.size.y - size.y);

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

    final spaceshipDirection = DirectionUtils.getForwardDirection(angle);
    setMoveDirection(spaceshipDirection);

    add(EffectsUtils.getRocketEffect(position.clone()));
    position += spaceshipDirection * acceleration * dt;
  }

  void decreaseSpeed(double dt) {
    if (acceleration > 1) acceleration -= 0.06;
    if (acceleration > 0 && acceleration < 1) acceleration -= 0.03;
    if (acceleration < 0 || acceleration == 0) acceleration = 0;

    position += lastImpulseDirection * acceleration * dt;
  }

  void setMoveDirection(Vector2 newDirection) =>
      moveDirection.setFrom(newDirection);

  void setLastImpulseDirection(Vector2 newDirection) =>
      lastImpulseDirection.setFrom(newDirection);

  void rotateLeft(double dt) => setAngle(angle - (rotateSpeed * dt));
  void rotateRight(double dt) => setAngle(angle + (rotateSpeed * dt));

  void setAngle(double newAngle) => angle = newAngle;
}
