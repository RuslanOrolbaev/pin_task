import 'package:flutter/material.dart';
import 'package:pin_task/view/buttons/key_button.dart';
import 'package:pin_task/viewModel/key_controller.dart';
import 'package:pin_task/constants.dart' as constants;

class Keyboard extends StatelessWidget {
  const Keyboard({required this.keyController, Key? key}) : super(key: key);
  final IKeyController keyController;

  @override
  Widget build(BuildContext context) {
    List<KeyButton> keysForKeyBoard = [];
    for (int i = 0; i < 10; i++) {
      keysForKeyBoard.add(KeyButton(
        numberToDisplay: i.toString(),
        onPressed: () async {
          await keyController.processKeyCode(i.toString());
        },
      ));
    }
    keysForKeyBoard.add(KeyButton(
        numberToDisplay: constants.backspaceSymbol,
        onPressed: () async {
          await keyController.processKeyCode(constants.backspaceKeyCode);
        }));
    return Wrap(children: keysForKeyBoard);
  }
}
