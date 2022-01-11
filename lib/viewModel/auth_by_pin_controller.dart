import 'package:pin_task/model/pin_handler.dart';
import 'package:pin_task/viewModel/key_controller.dart';
import 'package:pin_task/viewModel/pin_buffer.dart';
import 'package:pin_task/viewModel/ui_helper.dart';
import 'package:pin_task/viewModel/user_instruction_controller.dart';
import 'package:pin_task/constants.dart' as constants;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'context_controller.dart';

class AuthByPinController implements IKeyController {
  AuthByPinController(this.storedPin);

  final List<String> storedPin;
  final PinBufferSingleton _pinBuffer = PinBufferSingleton();
  final UserInstructionController _userInstructionController =
      UserInstructionController.instance;
  final ContextController _contextController = ContextController.instance;
  final Pin _pin = Pin(constants.pinLength);

  @override
  Future<void> processKeyCode(String keyCode) async {
    receivePinFromKeyCodes(
        keyCode: keyCode,
        pin: _pin,
        bufferToUpdate: _pinBuffer,
        onPinReceivingComplete: () {
          assert(_contextController.context != null);
          if (_receivedPinIsEqualToStoredPin(_pin.currentPin, storedPin)) {
            UiHelper.showOKDialog(
                context: _contextController.context!,
                message: constants.authenticationSuccessful,
                onOKPressed: () {
                  Navigator.pop(_contextController.context!);
                });
          } else {
            UiHelper.showOKDialog(
                context: _contextController.context!,
                message: constants.authenticationFailed,
                onOKPressed: () {
                  Navigator.pop(_contextController.context!);
                });
          }
        });
  }

  receivePinFromKeyCodes(
      {required String keyCode,
      required IPin pin,
      required Function onPinReceivingComplete,
      IBuffer? bufferToUpdate}) async {
    if (keyCode == constants.backspaceKeyCode) {
      pin.removeLast();
    } else {
      pin.addToPin(keyCode);
    }
    if (bufferToUpdate != null) {
      bufferToUpdate.update(pin.currentPin);
    }
    if (pin.length() == constants.pinLength) {
      onPinReceivingComplete();
    }
  }

  bool _receivedPinIsEqualToStoredPin(
      List<String> receivedPin, List<String> storedPin) {
    if (receivedPin.equals(storedPin)) {
      return true;
    } else {
      return false;
    }
  }
}
