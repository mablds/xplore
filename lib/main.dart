import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'hud/hud.dart';
import 'player/spaceship/spaceship.dart';
import 'constants/positions.dart';
import 'world/components/repeating_background.dart';

void main() => runApp(GameWidget(game: Xplore()));

class Xplore extends FlameGame {
  late Hud hud;
  late Spaceship spaceship;
  late RepeatingBackground background;

  @override
  Future<void> onLoad() async {
    camera = CameraComponent(world: world);

    hud = Hud()..size = size;

    spaceship = Spaceship(hud: hud)
      ..position = PositionsUtils.spaceshipInitialPosition(size);

    camera
      ..viewfinder.anchor = Anchor.center
      ..viewport.add(hud)
      ..follow(spaceship);

    background = RepeatingBackground();

    world.addAll([spaceship, background]);

    await super.onLoad();
  }
}
