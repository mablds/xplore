import 'package:flame/components.dart';

class Spaceship extends SpriteComponent {
  Spaceship({super.position}) : super(size: Vector2.all(40.0));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('ship.png');
  }
}
