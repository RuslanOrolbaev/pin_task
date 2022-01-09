import 'package:flutter/material.dart';

class ContextController {
  ContextController._createSingleton();

  static final ContextController _instance =
      ContextController._createSingleton();
  static ContextController get instance => _instance;

  BuildContext? context;
}
