import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:xplore/hud/direction_pad.dart';
import 'package:xplore/hud/clutch.dart';

import 'player/entities/spaceship.dart';

void main() {
  runApp(GameWidget(game: Xplore()));
}

class Xplore extends FlameGame with PanDetector {
  late DirectionalPad directionalPad;
  late Spaceship spaceship;
  late ClutchButton clutchButton;

  @override
  Future<void> onLoad() async {
    directionalPad = DirectionalPad();
    clutchButton = ClutchButton();
    spaceship = Spaceship(
      clutch: clutchButton,
      left: directionalPad.leftDirectionalButton,
      right: directionalPad.rightDirectionalButton,
    );

    add(spaceship..position = size / 2);
    add(
      directionalPad.leftDirectionalButton
        ..position = Vector2(50, size.y - 100)
        ..size = Vector2.all(50),
    );
    add(
      directionalPad.rightDirectionalButton
        ..position = Vector2(150, size.y - 100)
        ..size = Vector2.all(50),
    );
    add(
      clutchButton
        ..position = Vector2(size.x - 100, size.y - 100)
        ..size = Vector2.all(50),
    );

    await super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
