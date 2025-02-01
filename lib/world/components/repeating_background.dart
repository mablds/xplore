import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class RepeatingBackground extends SpriteComponent {
  RepeatingBackground({
    required Sprite sprite,
    required Vector2 size,
  }) : super(sprite: sprite, size: size);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    for (double x = 0; x < size.x; x += sprite!.srcSize.x) {
      for (double y = 0; y < size.y; y += sprite!.srcSize.y) {
        sprite!.render(canvas, position: Vector2(x, y));
      }
    }
  }
}
