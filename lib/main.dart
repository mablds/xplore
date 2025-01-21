import 'dart:developer';

import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/src/components/core/component.dart';
import 'package:flutter/material.dart';
import 'package:xplore/hud/circlepad.dart';
import 'package:xplore/hud/clutch.dart';

import 'entities/spaceship.dart';

void main() {
  runApp(GameWidget(game: Xplore()));
}

class Xplore extends FlameGame with PanDetector {
  final CirclePad circlePad = CirclePad();

  late Spaceship spaceship;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    spaceship = Spaceship();

    //TODO fix clutch button
    add(const ClutchButton() as Component);

    add(spaceship);
  }

  @override
  void render(Canvas canvas) {
    circlePad.renderCirclePad(canvas);
    super.render(canvas);
  }

  @override
  void onPanStart(DragStartInfo info) {
    circlePad.pointerStartLocation = info.eventPosition.global;
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    circlePad.setPointerCurrentLocation(info.eventPosition.global);

    final delta =
        circlePad.pointerCurrentLocation - circlePad.pointerStartLocation;

    spaceship.setMoveDirection(delta);
  }

  @override
  void onPanEnd(DragEndInfo info) {
    circlePad.reset();
    spaceship.turnOff();
  }

  @override
  void onPanCancel() {
    circlePad.reset();
    spaceship.turnOff();
  }
}
