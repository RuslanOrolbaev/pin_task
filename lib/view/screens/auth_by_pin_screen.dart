import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/model/i_storage.dart';
import 'package:pin_task/model/local_storage.dart';
import 'package:pin_task/view/custom_widgets/pin_manager.dart';
import 'package:pin_task/viewModel/auth_by_pin_controller.dart';
import 'package:pin_task/constants.dart' as constants;

import 'message_screen.dart';

Logger _logger = Logger('AuthByPinScreen');

class AuthByPinScreen extends StatefulWidget {
  const AuthByPinScreen({Key? key}) : super(key: key);

  @override
  State<AuthByPinScreen> createState() => _AuthByPinScreenState();
}

class _AuthByPinScreenState extends State<AuthByPinScreen> {
  Future<List<String>>? _initialPin;

  @override
  void initState() {
    LocalStorage localStorage = LocalStorage();
    _initialPin = _loadPin(localStorage, constants.keyForPinInSharedPrefs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    return FutureBuilder(
        future: _initialPin,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const MessageScreen(message: constants.error);
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const MessageScreen(message: constants.loading);
            default:
              if (snapshot.hasData) {
                return PinManager(
                    initialUserInstructionText: constants.enterYourPin,
                    pinController:
                        AuthByPinController(snapshot.data as List<String>));
              } else {
                return const MessageScreen(message: constants.noPinStored);
              }
          }
        });
  }

  //TODO move to viewModel
  Future<List<String>>? _loadPin(
      IStorage localStorage, String keyForPinInMap) async {
    try {
      List<String>? storedPin = await localStorage.loadData(keyForPinInMap);
      return Future.value(storedPin);
    } catch (e) {
      return Future.error(e);
    }
  }
}
