import 'dart:async';

class UserInstructionController {
  UserInstructionController._createSingleton();

  static final UserInstructionController _instance =
      UserInstructionController._createSingleton();
  static UserInstructionController get instance => _instance;

  final _controller = StreamController<String>.broadcast();

  Stream<String> get stream => _controller.stream;

  void text(String userInstructionText) {
    _controller.sink.add(userInstructionText);
  }
}
