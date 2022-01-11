import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/view/custom_widgets/pin_display.dart';
import 'package:pin_task/view/custom_widgets/keyboard.dart';
import 'package:pin_task/view/custom_widgets/user_instruction.dart';
import 'package:pin_task/viewModel/context_controller.dart';
import 'package:pin_task/viewModel/key_controller.dart';
import 'package:pin_task/viewModel/pin_buffer.dart';
import 'package:pin_task/viewModel/pin_indicators_row.dart';
import 'package:pin_task/constants.dart' as constants;
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
  final PinBufferSingleton pinBuffer = PinBufferSingleton();
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
            UserInstruction(
                initialText: initialUserInstructionText ?? '',
                userInstructionController: userInstructionController),
            const PinIndicatorsRow(pinLength: constants.pinLength),
            PinDisplay(pinBuffer: pinBuffer),
            Keyboard(
              keyController: pinController,
            )
          ],
        ),
      ),
    );
  }
}
