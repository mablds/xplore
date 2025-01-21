import 'package:flutter/material.dart';

class ClutchButton extends StatefulWidget {
  const ClutchButton({super.key});

  @override
  _ClutchButtonState createState() => _ClutchButtonState();
}

class _ClutchButtonState extends State<ClutchButton> {
  bool _isClutchPressed = false;

  void _handleLongPressStart(LongPressStartDetails details) {
    setState(() {
      _isClutchPressed = true;
    });
  }

  void _handleLongPressEnd(LongPressEndDetails details) {
    setState(() {
      _isClutchPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: _handleLongPressStart,
      onLongPressEnd: _handleLongPressEnd,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: _isClutchPressed ? Colors.red : Colors.blue,
        child: const Text(
          'Long Press Me',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
