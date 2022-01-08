import 'package:flutter/material.dart';
import 'package:pin_task/view/buttons/key_button.dart';
import 'package:pin_task/viewModel/key_controller.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({required this.keyController, Key? key}) : super(key: key);
  final IKeyController keyController;

  @override
  Widget build(BuildContext context) {
    List<KeyButton> keysForKeyBoard = [];
    for (int i = 0; i < 5; i++) {
      keysForKeyBoard.add(KeyButton(
        numberToDisplay: i.toString(),
        onPressed: () {
          keyController.processKeyCode(i.toString());
        },
      ));
    }
    return Row(children: keysForKeyBoard);
  }
}
