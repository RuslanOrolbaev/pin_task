import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/view/custom_widgets/pin_manager.dart';
import 'package:pin_task/viewModel/auth_by_pin_controller.dart';
import 'package:pin_task/constants.dart' as constants;

Logger _logger = Logger('AuthByPinScreen');

class AuthByPinScreen extends StatefulWidget {
  const AuthByPinScreen({Key? key}) : super(key: key);

  @override
  State<AuthByPinScreen> createState() => _AuthByPinScreenState();
}

class _AuthByPinScreenState extends State<AuthByPinScreen> {
  List<String> initialPin = ['1', '2', '3', '4'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    return PinManager(
        initialUserInstructionText: constants.enterYourPin,
        pinController: AuthByPinController(initialPin));
  }
}
