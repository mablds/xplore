import 'package:flame/components.dart';

class Spaceship extends SpriteComponent {
  final _moveDirection = Vector2.zero();
  final _moveSpeed = 100.0;
  final _rotateSpeed = 1.0;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('ship.png');
    size = Vector2.all(30);
    position = center;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (_moveDirection.x > 0) {
      angle += _rotateSpeed * dt;
    } else if (_moveDirection.x < 0) {
      angle -= _rotateSpeed * dt;
    } else {
      position += _moveDirection.normalized() * _moveSpeed * dt;
    }
  }

  void setMoveDirection(Vector2 newDirection) =>
      _moveDirection.setFrom(newDirection);

  void turnOff() {
    _moveDirection.setZero();
  }
}
