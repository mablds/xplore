import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/parallax.dart';

import 'hud/hud.dart';
import 'player/spaceship/spaceship.dart';
import 'constants/positions.dart';
import 'world/components/parallax.dart';

void main() => runApp(GameWidget(game: Xplore()));

class Xplore extends FlameGame {
  late Hud hud;
  late Spaceship spaceship;
  late ParallaxComponent parallax;

  @override
  Future<void> onLoad() async {
    camera = CameraComponent(world: world);
    parallax = ParallaxBackground();
    hud = Hud()..size = size;

    spaceship = Spaceship(
      hud: hud,
    )..position = PositionsUtils.spaceshipInitialPosition(size);

    camera
      ..viewfinder.anchor = Anchor.center
      ..viewport.add(hud)
      ..follow(spaceship);

    camera.backdrop.add(parallax);

    world.addAll([
      spaceship,
    ]);

    await super.onLoad();
  }
}
