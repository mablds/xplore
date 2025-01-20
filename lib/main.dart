import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'entities/spaceship.dart';

void main() {
  runApp(
    GameWidget(
      game: FlameGame(world: Xplore()),
    ),
  );
}

class Xplore extends World with TapCallbacks {
  @override
  Future<void> onLoad() async {
    add(Spaceship(position: Vector2.random()));
  }
}
