import 'dart:async';

abstract class IBuffer {
  Stream get stream;
  void update(List<String> bufferElement);
}

class PinBufferSingleton implements IBuffer {
  PinBufferSingleton._createSingleton();
  static final PinBufferSingleton _instance =
      PinBufferSingleton._createSingleton();
  factory PinBufferSingleton() {
    return _instance;
  }

  final _controller = StreamController<List<String>>();

  @override
  Stream<List<String>> get stream => _controller.stream;

  @override
  void update(List<String> pinCode) {
    _controller.sink.add(pinCode);
  }
}
