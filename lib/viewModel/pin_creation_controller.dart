import 'package:pin_task/model/helpers/pin_operations.dart';
import 'package:pin_task/model/local_storage.dart';
import 'package:pin_task/model/pin.dart';
import 'package:pin_task/model/pin_buffer_controller.dart';
import 'package:pin_task/viewModel/ui_helper.dart';
import 'package:pin_task/viewModel/user_instruction_controller.dart';
import 'package:pin_task/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'context_controller.dart';
import '../model/i_key_controller.dart';

class PinCreationController implements IKeyController {
  final PinBufferController _pinBuffer = PinBufferController();
  final UserInstructionController _userInstructionController =
      UserInstructionController.instance;
  final ContextController _contextController = ContextController.instance;
  List<String> _firstEnteredPinCode = [];
  bool _pinEnteredFirstTime = true;
  final Pin _pin = Pin(constants.pinLength);
  final LocalStorage _localStorage = LocalStorage();

  @override
  Future<void> processKeyCode(String keyCode) async {
    PinOperations.receivePinFromKeyCodes(
        keyCode: keyCode,
        pin: _pin,
        bufferToUpdate: _pinBuffer,
        onPinReceivingComplete: () async {
          await _processPin();
        });
  }

  Future<void> _processPin() async {
    if (_pinEnteredFirstTime) {
      _rememberTheFirstPinAndUpdateUI();
    } else {
      await _comparePinsSaveIfMatchedAndUpdateUI();
    }
  }

  _rememberTheFirstPinAndUpdateUI() {
    _firstEnteredPinCode = _pin.currentPin.toList();
    _pin.clear();
    _pinBuffer.update(_pin.length);
    _pinEnteredFirstTime = false;
    _userInstructionController.text(constants.reEnterYourPin);
  }

  Future<void> _comparePinsSaveIfMatchedAndUpdateUI() async {
    bool pinAreEqual = PinOperations.receivedPinIsEqualToStoredPin(
        _pin.currentPin, _firstEnteredPinCode);
    if (pinAreEqual) {
      try {
        await PinOperations.savePin(
            _pin.currentPin, constants.keyForPinInSharedPrefs, _localStorage);
        UiHelper.showOKDialog(
            context: _contextController.context!,
            message: constants.yourPinHasBeenSetUp,
            onOKPressed: () {
              Navigator.popUntil(_contextController.context!,
                  ModalRoute.withName(constants.ScreenID.menuScreen));
            });
      } catch (e) {
        UiHelper.showOKDialog(
            context: _contextController.context!,
            message: constants.storageError,
            onOKPressed: () {
              Navigator.pop(_contextController.context!);
            });
      }
    } else {
      UiHelper.showOKDialog(
          context: _contextController.context!,
          message: constants.pinsDoNotMatch,
          onOKPressed: () {
            Navigator.pop(_contextController.context!);
          });
      _restartEnteringPinProcessAndUpdateUI();
    }
  }

  _restartEnteringPinProcessAndUpdateUI() {
    _userInstructionController.text(constants.enterYourPin);
    _pin.clear();
    _firstEnteredPinCode.clear();
    _pinBuffer.update(_pin.length);
    _pinEnteredFirstTime = true;
  }
}
