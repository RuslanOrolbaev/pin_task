import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/constants.dart';
import 'package:pin_task/view/custom_widgets/pin_display.dart';
import 'package:pin_task/view/custom_widgets/keyboard.dart';
import 'package:pin_task/viewModel/key_controller.dart';
import 'package:pin_task/viewModel/pin_buffer.dart';
import 'package:pin_task/viewModel/pin_indicators_row.dart';
import 'package:pin_task/constants.dart' as constants;

Logger _logger = Logger('Create Pin Screen');

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    PinController pinController = PinController();
    PinBuffer pinBuffer = PinBuffer.instance;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(createPin),
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
