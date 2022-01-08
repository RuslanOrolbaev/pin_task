abstract class IKeyController {
  void sendKeyCode(String keycode);
}

class KeyController implements IKeyController {
  @override
  void sendKeyCode(String keycode) {
    print(keycode);
  }
}
