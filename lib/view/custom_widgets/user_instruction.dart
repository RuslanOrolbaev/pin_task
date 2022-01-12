import 'package:flutter/material.dart';
import 'package:pin_task/viewModel/user_instruction_controller.dart';

class UserInstruction extends StatelessWidget {
  const UserInstruction(
      {required this.initialText,
      required this.userInstructionController,
      Key? key})
      : super(key: key);
  final UserInstructionController userInstructionController;
  final String initialText;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: initialText,
        stream: userInstructionController.stream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Text(snapshot.data ?? '',
              style: const TextStyle(color: Colors.grey, fontSize: 24.0));
        });
  }
}
