import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class RepeatingBackground extends SpriteComponent {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('stars1.png');
  }

  @override
  void render(Canvas canvas) {
    final spriteSize = sprite!.originalSize * 2;
    final canvasSize = size;
    final startX = -((canvasSize.x / spriteSize.x).ceil() * spriteSize.x);
    final startY = -((canvasSize.y / spriteSize.y).ceil() * spriteSize.y);
    final endX = canvasSize.x + spriteSize.x;
    final endY = canvasSize.y + spriteSize.y;

    for (double x = startX; x < endX; x += spriteSize.x) {
      for (double y = startY; y < endY; y += spriteSize.y) {
        sprite!.render(
          canvas,
          position: Vector2(x, y),
          size: spriteSize,
        );
        sprite!.render(
          canvas,
          position: Vector2(x, y + spriteSize.y),
          size: spriteSize,
        );
      }
      for (double y = startY; y < endY; y += spriteSize.y) {
        sprite!.render(
          canvas,
          position: Vector2(x + spriteSize.x / 2, y),
          size: spriteSize,
        );
        sprite!.render(
          canvas,
          position: Vector2(x + spriteSize.x / 2, y + spriteSize.y),
          size: spriteSize,
        );
      }
    }
  }
}
