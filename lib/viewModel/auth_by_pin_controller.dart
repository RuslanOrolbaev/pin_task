import 'package:pin_task/model/pin.dart';
import 'package:pin_task/model/i_key_controller.dart';
import 'package:pin_task/model/pin_buffer_controller.dart';
import 'package:pin_task/viewModel/ui_helper.dart';
import 'package:pin_task/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:pin_task/model/helpers/pin_operations.dart';

import 'context_controller.dart';

class AuthByPinController implements IKeyController {
  AuthByPinController(this.storedPin);
  final List<String> storedPin;
  final PinBufferController _pinBuffer = PinBufferController();
  final ContextController _contextController = ContextController.instance;
  final Pin _pin = Pin(constants.pinLength);

  @override
  Future<void> processKeyCode(String keyCode) async {
    PinOperations.receivePinFromKeyCodes(
        keyCode: keyCode,
        pin: _pin,
        bufferToUpdate: _pinBuffer,
        onPinReceivingComplete: () {
          _onReceivingComplete();
        });
  }

  _onReceivingComplete() {
    assert(_contextController.context != null);
    if (PinOperations.receivedPinIsEqualToStoredPin(
        _pin.currentPin, storedPin)) {
      UiHelper.showOKDialog(
          context: _contextController.context!,
          message: constants.authenticationSuccessful,
          onOKPressed: () {
            Navigator.popUntil(_contextController.context!,
                ModalRoute.withName(constants.ScreenID.menuScreen));
          });
    } else {
      UiHelper.showOKDialog(
          context: _contextController.context!,
          message: constants.authenticationFailed,
          onOKPressed: () {
            Navigator.pop(_contextController.context!);
          });
      _resetPinAndUpdateUI();
    }
  }

  _resetPinAndUpdateUI() {
    _pin.clear();
    _pinBuffer.update(_pin.currentPin);
  }
}
