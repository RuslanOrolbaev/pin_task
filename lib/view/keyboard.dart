import 'package:flutter/material.dart';
import 'package:pin_task/view/buttons/key_button.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<KeyButton> keysForKeyBoard = [];
    for (int i = 0; i < 5; i++) {
      keysForKeyBoard.add(KeyButton(numberToDisplay: i.toString()));
    }
    return Row(children: keysForKeyBoard);
  }
}
