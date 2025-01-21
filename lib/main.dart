import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:xplore/hud/circlepad.dart';
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
    spaceship = Spaceship(clutch: clutchButton);

    add(spaceship..position = size / 2);
    add(clutchButton
      ..position = Vector2(size.x - 100, size.y - 100)
      ..size = Vector2.all(50));

    await super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    directionalPad.renderDirectionalPad(canvas);
    super.render(canvas);
  }

  @override
  void onPanStart(DragStartInfo info) {
    directionalPad.pointerStartLocation = info.eventPosition.global;
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    directionalPad.setPointerCurrentLocation(info.eventPosition.global);

    final delta = directionalPad.pointerCurrentLocation -
        directionalPad.pointerStartLocation;

    spaceship.setMoveDirection(delta);
  }

  @override
  void onPanEnd(DragEndInfo info) {
    directionalPad.reset();
    spaceship.turnOff();
  }

  @override
  void onPanCancel() {
    directionalPad.reset();
    spaceship.turnOff();
  }
}
