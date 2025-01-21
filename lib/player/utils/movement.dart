import 'package:flame/game.dart';

class MovementUtils {
  static bool isRotatingLeft(Vector2 newMoveDirection) =>
      newMoveDirection.x < 0;

  static bool isRotatingRight(Vector2 newMoveDirection) =>
      newMoveDirection.x > 0;

  static bool isClutching(bool isTapping) => isTapping == true;

  static bool isStationary(bool isTapping) => isTapping == false;
}
