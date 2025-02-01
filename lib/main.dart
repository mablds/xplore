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
    hud = Hud()
      ..size = size
      ..position = Vector2.zero();
    spaceship = Spaceship(hud: hud)
      ..position = PositionsUtils.spaceshipInitialPosition(size);

    final backgroundSprite = await Sprite.load('stars1.png');
    background = RepeatingBackground(sprite: backgroundSprite, size: size * 3);

    camera = CameraComponent(world: world)
      ..viewfinder.visibleGameSize = Vector2.zero()
      ..viewfinder.anchor = Anchor.center
      ..viewfinder.position = Vector2.zero()
      ..viewport.position = size
      ..follow(spaceship);

    addAll([world, background, hud, spaceship, camera]);

    await super.onLoad();
  }
}
