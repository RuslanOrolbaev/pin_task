import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/model/helpers/pin_operations.dart';
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
  Future<List<String>?>? _initialPin;

  @override
  void initState() {
    LocalStorage localStorage = LocalStorage();
    _initialPin =
        PinOperations.loadPin(localStorage, constants.keyForPinInSharedPrefs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    return FutureBuilder(
        future: _initialPin,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            _logger.severe(
                'error occurred: ${snapshot.error} with stackTrace: ${snapshot.stackTrace}');
            return const MessageScreen(message: constants.storageError);
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
}
