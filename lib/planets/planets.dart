import 'package:flame/components.dart';

class Planets {
  static List<Map<String, dynamic>> getPlanets() {
    return [
      {
        'sprite': 'planets/planet1.png',
        'position': Vector2(150.0, -200.0),
      },
      {
        'sprite': 'planets/planet2.png',
        'position': Vector2(300.0, 400.0),
      },
      {
        'sprite': 'planets/planet3.png',
        'position': Vector2(500.0, -60.0),
      },
    ];
  }
}
