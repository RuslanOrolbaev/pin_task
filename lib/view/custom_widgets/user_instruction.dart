import 'package:flutter/material.dart';
import 'package:pin_task/viewModel/user_instruction_controller.dart';

class UserInstruction extends StatefulWidget {
  const UserInstruction(
      {required this.initialText,
      required this.userInstructionController,
      Key? key})
      : super(key: key);
  final UserInstructionController userInstructionController;
  final String initialText;

  @override
  State<UserInstruction> createState() => _UserInstructionState();
}

class _UserInstructionState extends State<UserInstruction> {
  @override
  void dispose() {
    print(' UserInstruction disposed'); //todo remove
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: widget.initialText,
        stream: widget.userInstructionController.stream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Text(snapshot.data ?? '');
        });
  }
}
