import 'package:flutter/material.dart';
import 'package:pin_task/view/custom_widgets/custom_alert_dialog.dart';
import 'package:pin_task/viewModel/context_controller.dart';
import 'package:pin_task/viewModel/pin_buffer.dart';
import 'package:pin_task/constants.dart' as constants;
import 'package:pin_task/viewModel/user_instruction_controller.dart';
import 'package:collection/collection.dart';

abstract class IKeyController {
  void processKeyCode(String keycode);
}

class PinController implements IKeyController {
  final PinBuffer _pinBuffer = PinBuffer.instance;
  final UserInstructionController _userInstructionController =
      UserInstructionController.instance;
  final ContextController _contextController = ContextController.instance;
  final List<String> _currentPinCode = [];
  List<String> _firstEnteredPinCode = [];
  bool enteringPinFirstTime = true;

  @override
  void processKeyCode(String keyCode) {
    //TODO refactor to make code readable
    _currentPinCode.add(keyCode);
    _pinBuffer.add(_currentPinCode);
    if (_currentPinCode.length == constants.pinLength) {
      if (enteringPinFirstTime) {
        _firstEnteredPinCode = _currentPinCode.toList();
        _userInstructionController.text(constants.reEnterYourPin);
        _currentPinCode.clear();
        enteringPinFirstTime = false;
      } else {
        if (_firstEnteredPinCode.equals(_currentPinCode)) {
          //TODO save to local storage here
          //todo remove print
          print('pins match');
          _showOKDialog(
              context: _contextController.context!,
              message: constants.yourPinHasBeenSetUp,
              onOKPressed: () {
                Navigator.pop(_contextController.context!);
              });
        } else {
          print('pins do NOT match');
          //TODO
          _showOKDialog(
              context: _contextController.context!,
              message: constants.pinsDoNotMatch,
              onOKPressed: () {
                Navigator.pop(_contextController.context!);
              });
        }
      }
    }
  }

  _showOKDialog(
      {required BuildContext context,
      required String message,
      required Function onOKPressed}) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(message: message, onOKPressed: onOKPressed);
        });
  }
}
