import 'package:flutter/material.dart';
import 'package:pin_task/view/buttons/key_button.dart';
import 'package:pin_task/model/i_key_controller.dart';
import 'package:pin_task/constants.dart' as constants;

class Keyboard extends StatelessWidget {
  const Keyboard({required this.keyController, Key? key}) : super(key: key);
  final IKeyController keyController;

  @override
  Widget build(BuildContext context) {
    List<KeyButton> keysForKeyBoard = [];
    for (int i = 1; i < 10; i++) {
      keysForKeyBoard.add(KeyButton(
        child: Text(
          i.toString(),
          style: const TextStyle(fontSize: 24, color: Color(0xFF6B81A2)),
        ),
        onPressed: () async {
          await keyController.processKeyCode(i.toString());
        },
      ));
    }
    keysForKeyBoard.add(KeyButton(
      child: const Text(
        '0',
        style: TextStyle(fontSize: 24, color: Color(0xFF6B81A2)),
      ),
      onPressed: () async {
        await keyController.processKeyCode('0');
      },
    ));
    keysForKeyBoard.add(KeyButton(
        child: const Icon(Icons.backspace_outlined, color: Color(0xFF6B81A2)),
        onPressed: () async {
          await keyController.processKeyCode(constants.backspaceKeyCode);
        }));
    return Wrap(spacing: 10, children: keysForKeyBoard);
  }
}
