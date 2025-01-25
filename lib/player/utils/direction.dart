import 'dart:math';

import 'package:flame/components.dart';

class DirectionUtils {
  static Vector2 getForwardDirection(double angle) =>
      Vector2(cos(angle - pi / 2), sin(angle - pi / 2));
}
