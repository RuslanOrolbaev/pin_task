import 'package:pin_task/model/key_code_flow.dart';

abstract class IKeyController {
  void processKeyCode(String keycode);
}

class KeyController implements IKeyController {
  KeyCodeFlow keyCodeFlow = KeyCodeFlow.instance;
  @override
  void processKeyCode(String keyCode) {
    keyCodeFlow.addToFlow(keyCode);
  }
}
