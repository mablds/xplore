import 'package:flame/components.dart';

class PositionsUtils {
  static Vector2 spaceshipInitialPosition(Vector2 size) => size / 2;
  static Vector2 leftDirectionalPadPosition(Vector2 size) =>
      Vector2(50, size.y - 100);
  static Vector2 rightDirectionalPadPosition(Vector2 size) =>
      Vector2(150, size.y - 100);
  static Vector2 clutchButtonPosition(Vector2 size) =>
      Vector2(size.x - 100, size.y - 100);
}
