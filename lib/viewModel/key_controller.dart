import 'package:pin_task/viewModel/pin_buffer.dart';
import 'package:pin_task/constants.dart' as constants;

abstract class IKeyController {
  void processKeyCode(String keycode);
}

class PinController implements IKeyController {
  final PinBuffer _pinBuffer = PinBuffer.instance;
  final List<String> _pinCode = [];
  @override
  void processKeyCode(String keyCode) {
    if (_pinCode.length < constants.pinLength) {
      _pinCode.add(keyCode);
      _pinBuffer.add(_pinCode);
    }
  }
}
