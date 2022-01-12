import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget {
  const KeyButton(
      {Key? key, required this.numberToDisplay, required this.onPressed})
      : super(key: key);
  final String numberToDisplay;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 80, height: 80),
        child: ElevatedButton(
          child: Text(
            numberToDisplay,
            style: const TextStyle(fontSize: 24, color: Color(0xFF6B81A2)),
          ),
          onPressed: onPressed as void Function(),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: const Color(0xFFF7F5FA),
            shape: const CircleBorder(),
          ),
        ),
      ),
    );
  }
}
