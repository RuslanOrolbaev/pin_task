import 'i_pin.dart';

class Pin implements IPin {
  Pin(this.pinLength);
  final int pinLength;

  List<String> _currentPin = [];

  @override
  void addToPin(String code) {
    if (_currentPin.length < pinLength) {
      _currentPin.add(code);
    }
  }

  @override
  List<String> get currentPin => _currentPin;

  @override
  void removeLast() {
    if (_currentPin.isNotEmpty) {
      currentPin.removeLast();
    }
  }

  @override
  void clear() {
    _currentPin.clear();
  }

  @override
  int length() => _currentPin.length;
}
