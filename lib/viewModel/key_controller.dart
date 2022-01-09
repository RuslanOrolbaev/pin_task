import 'package:pin_task/viewModel/pin_buffer.dart';
import 'package:pin_task/constants.dart' as constants;
import 'package:pin_task/viewModel/user_instruction_controller.dart';

abstract class IKeyController {
  void processKeyCode(String keycode);
}

class PinController implements IKeyController {
  final PinBuffer _pinBuffer = PinBuffer.instance;
  final UserInstructionController _userInstructionController =
      UserInstructionController.instance;
  final List<String> _currentPinCode = [];
  bool enteringPinFirstTime = true;
  List<String> _firstEnteredPinCode = [];
  @override
  void processKeyCode(String keyCode) {
    _currentPinCode.add(keyCode);
    _pinBuffer.add(_currentPinCode);
    if (_currentPinCode.length == constants.pinLength) {
      if (enteringPinFirstTime) {
        _firstEnteredPinCode = _currentPinCode;
        _userInstructionController.text(constants.reEnterYourPin);
        _currentPinCode.clear();
        enteringPinFirstTime = false;
      } else {
        if (_firstEnteredPinCode == _currentPinCode) {
          //todo remove print
          print('pins are equal');
        } else {
          print('pins are NOT equal');
        }
      }
    }
  }
}
