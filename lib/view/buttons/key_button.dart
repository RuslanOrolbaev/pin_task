import 'package:flutter/material.dart';

class KeyButton extends StatelessWidget {
  const KeyButton(
      {Key? key, required this.numberToDisplay, required this.onPressed})
      : super(key: key);
  final String numberToDisplay;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 50, height: 50),
      child: ElevatedButton(
        child: Text(
          numberToDisplay,
          style: const TextStyle(fontSize: 24),
        ),
        onPressed: onPressed as void Function(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
