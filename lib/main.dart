import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:xplore/hud/direction_pad.dart';
import 'package:xplore/hud/clutch.dart';
import 'package:xplore/utils/positions.dart';

import 'player/entities/spaceship.dart';
import 'player/utils/effects.dart';
import 'utils/sizes.dart';

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

    add(spaceship..position = PositionsUtils.spaceshipInitialPosition(size));

    add(directionalPad.leftDirectionalButton
      ..position = PositionsUtils.leftDirectionalPadPosition(size)
      ..size = SizesUtils.directionalPadButtonsSize);
    add(directionalPad.rightDirectionalButton
      ..position = PositionsUtils.rightDirectionalPadPosition(size)
      ..size = SizesUtils.directionalPadButtonsSize);
    add(clutchButton
      ..position = PositionsUtils.clutchButtonPosition(size)
      ..size = SizesUtils.clutchButtonSize);

    await super.onLoad();
  }
}
