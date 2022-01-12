abstract class IPin {
  List<String> _currentPin = [];
  void addToPin(String code) {}
  void removeLast() {}
  void clear() {}
  int length() => _currentPin.length;
  List<String> get currentPin => _currentPin;
}
