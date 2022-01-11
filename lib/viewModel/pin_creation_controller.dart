import 'package:pin_task/model/pin_handler.dart';
import 'package:pin_task/viewModel/pin_buffer.dart';
import 'package:pin_task/viewModel/ui_helper.dart';
import 'package:pin_task/viewModel/user_instruction_controller.dart';
import 'package:pin_task/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'context_controller.dart';
import 'key_controller.dart';
import 'package:collection/collection.dart';

class PinCreationController implements IKeyController {
  final PinBufferSingleton _pinBuffer = PinBufferSingleton();
  final UserInstructionController _userInstructionController =
      UserInstructionController.instance;
  final ContextController _contextController = ContextController.instance;
  List<String> _firstEnteredPinCode = [];
  bool enteringPinFirstTime = true;
  final Pin _pin = Pin(constants.pinLength);

  @override
  Future<void> processKeyCode(String keyCode) async {
    if (keyCode == constants.backspaceKeyCode) {
      _pin.removeLast();
      _pinBuffer.update(_pin.currentPin);
    } else {
      _pin.addToPin(keyCode);
      _pinBuffer.update(_pin.currentPin);
      if (_pin.length() == constants.pinLength) {
        _comparePinsAndUpdateUI();
      }
    }
  }

  _comparePinsAndUpdateUI() {
    if (enteringPinFirstTime) {
      _firstEnteredPinCode = _pin.currentPin.toList();
      _pin.clear();
      _userInstructionController.text(constants.reEnterYourPin);
      enteringPinFirstTime = false;
    } else {
      if (_firstEnteredPinCode.equals(_pin.currentPin)) {
        //TODO save to local storage here
        //todo remove print
        UiHelper.showOKDialog(
            context: _contextController.context!,
            message: constants.yourPinHasBeenSetUp,
            onOKPressed: () {
              Navigator.pop(_contextController.context!);
            });
      } else {
        UiHelper.showOKDialog(
            context: _contextController.context!,
            message: constants.pinsDoNotMatch,
            onOKPressed: () {
              Navigator.pop(_contextController.context!);
            });
        _restartEnteringPinProcess();
      }
    }
  }

  _restartEnteringPinProcess() {
    _userInstructionController.text(constants.enterYourPin);
    _pin.clear();
    enteringPinFirstTime = true;
  }
}
