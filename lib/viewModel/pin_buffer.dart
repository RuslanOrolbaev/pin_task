import 'dart:async';

class PinBuffer {
  PinBuffer._createSingleton();

  static final PinBuffer _instance = PinBuffer._createSingleton();
  static PinBuffer get instance => _instance;

  final _controller = StreamController<List<String>>();

  Stream<List<String>> get stream => _controller.stream;

  void add(List<String> pinCode) {
    _controller.sink.add(pinCode);
  }
}
