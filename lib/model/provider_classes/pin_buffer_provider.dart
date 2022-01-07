import 'package:flutter/material.dart';

class PinBufferProvider extends ChangeNotifier {
  String _pinBuffer = '';

  set pinBuffer(String value) {
    _pinBuffer = value;
    notifyListeners();
  }

  String get pinBuffer => _pinBuffer;
}
