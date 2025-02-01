import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:xplore/main.dart';

import 'components/button.dart';
import '../constants/positions.dart';
import '../constants/sizes.dart';

class Hud extends PositionComponent {
  final PositionedButton leftDirectionalButton = PositionedButton.create();
  final PositionedButton rightDirectionalButton = PositionedButton.create();
  final PositionedButton clutchButton = PositionedButton.create(
    defaultColor: const Color(0xFF00FF00),
  );

  @override
  Future<void> onLoad() async {
    add(leftDirectionalButton
      ..position = PositionsUtils.leftDirectionalPadPosition(size)
      ..size = SizesUtils.directionalPadButtonsSize);
    add(rightDirectionalButton
      ..position = PositionsUtils.rightDirectionalPadPosition(size)
      ..size = SizesUtils.directionalPadButtonsSize);
    add(clutchButton
      ..position = PositionsUtils.clutchButtonPosition(size)
      ..size = SizesUtils.clutchButtonSize);
    await super.onLoad();
  }
}
