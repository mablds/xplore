import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CirclePad {
  CirclePad({
    Vector2? pointerCurrentLocation,
    Vector2? pointerStartLocation,
  })  : pointerCurrentLocation = pointerCurrentLocation ?? Vector2.zero(),
        pointerStartLocation = pointerStartLocation ?? Vector2.zero();

  Vector2 pointerStartLocation;
  Vector2 pointerCurrentLocation;

  void drawLateralRectangle(Canvas canvas) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCircle(center: pointerStartLocation.toOffset(), radius: 30),
        const Radius.circular(10),
      ),
      Paint()..color = Colors.grey.withAlpha(100),
    );
  }

  void drawInnerLateralRectangle(Canvas canvas) {
    var delta =
        pointerCurrentLocation.toOffset() - pointerStartLocation.toOffset();

    if (delta.distance > 30) {
      delta = pointerStartLocation.toOffset() +
          (Vector2(delta.dx, delta.dy).normalized() * 30).toOffset();
    } else {
      delta = pointerCurrentLocation.toOffset();
    }

    delta = Offset(delta.dx, pointerStartLocation.toOffset().dy);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: delta, width: 40, height: 40),
        const Radius.circular(10),
      ),
      Paint()..color = Colors.white.withAlpha(100),
    );
  }

  void renderCirclePad(Canvas canvas) {
    if (pointerStartLocation != Vector2.zero()) drawLateralRectangle(canvas);
    if (pointerCurrentLocation != Vector2.zero())
      drawInnerLateralRectangle(canvas);
  }

  void setPointerStartLocation(Vector2 newLocation) =>
      pointerStartLocation.setFrom(newLocation);

  void setPointerCurrentLocation(Vector2 newLocation) =>
      pointerCurrentLocation.setFrom(newLocation);

  void reset() {
    pointerStartLocation = Vector2.zero();
    pointerCurrentLocation = Vector2.zero();
  }
}
