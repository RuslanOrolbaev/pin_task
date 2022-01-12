import 'dart:async';

import 'package:pin_task/model/i_buffer.dart';

class PinBufferController implements IBufferController {
  PinBufferController._createSingleton();
  static final PinBufferController _instance =
      PinBufferController._createSingleton();
  factory PinBufferController() {
    return _instance;
  }

  final _controller = StreamController<int>.broadcast();

  @override
  Stream<int> get stream => _controller.stream;

  @override
  void update(int pinLength) {
    _controller.sink.add(pinLength);
  }
}
