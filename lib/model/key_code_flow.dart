import 'dart:async';

class KeyCodeFlow {
  KeyCodeFlow._createSingleton();
  static final KeyCodeFlow _instance = KeyCodeFlow._createSingleton();
  static KeyCodeFlow get instance => _instance;

  final _controller = StreamController<String>();
  Stream<String> get stream => _controller.stream;
  void addToFlow(String keyCode) {
    _controller.sink.add(keyCode);
  }
}
