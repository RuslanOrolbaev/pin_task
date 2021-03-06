import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/view/custom_widgets/keyboard.dart';
import 'package:pin_task/view/custom_widgets/user_instruction.dart';
import 'package:pin_task/viewModel/context_controller.dart';
import 'package:pin_task/model/i_key_controller.dart';
import 'package:pin_task/model/pin_buffer_controller.dart';
import 'package:pin_task/viewModel/pin_indicators_row.dart';
import 'package:pin_task/viewModel/user_instruction_controller.dart';

Logger _logger = Logger('Pin Screen');

class PinManager extends StatelessWidget {
  PinManager(
      {required this.pinController, this.initialUserInstructionText, Key? key})
      : super(key: key);
  final IKeyController pinController;
  final String? initialUserInstructionText;
  final UserInstructionController userInstructionController =
      UserInstructionController.instance;
  final PinBufferController pinBufferController = PinBufferController();
  final ContextController contextController = ContextController.instance;

  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    contextController.context = context;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            UserInstruction(
                initialText: initialUserInstructionText ?? '',
                userInstructionController: userInstructionController),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
              child: PinIndicatorsRow(pinBufferController: pinBufferController),
            ),
            const SizedBox(height: 60.0),
            Keyboard(
              keyController: pinController,
            )
          ],
        ),
      ),
    );
  }
}
