abstract class IPin {
  final List<String> _currentPin = [];
  void addToPin(String code) {}
  void removeLast() {}
  void clear() {}
  int get length => _currentPin.length;
  List<String> get currentPin => _currentPin;
}
