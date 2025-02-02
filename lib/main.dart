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

    hud = Hud()
      ..size = size
      ..position = Vector2.zero();
    spaceship = Spaceship(hud: hud, camera: camera)
      ..position = PositionsUtils.spaceshipInitialPosition(size);

    camera
      ..viewfinder.anchor = Anchor.center
      ..viewport.position = spaceship.position.clone();

    final backgroundSprite = await Sprite.load('stars1.png');
    background = RepeatingBackground(sprite: backgroundSprite, size: size * 3);

    final circle = CircleComponent(
      radius: 50,
      paint: Paint()..color = Colors.white,
      position: Vector2(-60, 60),
    );

    addAll([world, camera, background, hud, spaceship, circle]);

    await super.onLoad();
  }
}
