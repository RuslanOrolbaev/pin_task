import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/constants.dart';
import 'package:pin_task/model/key_code_flow.dart';
import 'package:pin_task/view/key_code_flow_display.dart';
import 'package:pin_task/view/keyboard.dart';
import 'package:pin_task/viewModel/key_controller.dart';
import 'package:pin_task/viewModel/pin_indicators_row.dart';

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
    KeyController keyController = KeyController();
    KeyCodeFlow keyCodeFlow = KeyCodeFlow.instance;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(createPin),
            const PinIndicatorsRow(),
            KeyCodeFlowDisplay(keyCodeFlow: keyCodeFlow),
            Keyboard(
              keyController: keyController,
            )
          ],
        ),
      ),
    );
  }
}
