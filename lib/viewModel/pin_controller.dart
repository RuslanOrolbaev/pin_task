abstract class IPinController {
  void addKeyCodeToPin(String keyCode);
  String getPinCode();
}

class PinController implements IPinController {
  @override
  void addKeyCodeToPin(String keyCode) {
    // TODO: implement addKeyCodeToPin
  }

  @override
  String getPinCode() {
    // TODO: implement getPinCode
    throw UnimplementedError();
  }
}
