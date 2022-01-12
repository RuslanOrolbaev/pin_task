import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/constants.dart';
import 'package:pin_task/view/screens/auth_by_pin_screen.dart';
import 'package:pin_task/view/screens/create_pin_screen.dart';
import 'package:pin_task/view/screens/menu_screen.dart';

Logger _logger = Logger('main');

void main() {
  //It seems that using Provider third-party package would be more elegant
  //for this test task, however as far as I understand the task description,
  // third party packages are allowed only for storage usage. So I decided to
  // go for streams for the state management where needed

  _initLogging();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    return MaterialApp(
      title: 'Pin task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ScreenID.menuScreen,
      routes: {
        ScreenID.createPinScreen: (context) => const CreatePinScreen(),
        ScreenID.menuScreen: (context) => const MenuScreen(),
        ScreenID.authByPinScreen: (context) => const AuthByPinScreen()
      },
    );
  }
}

void _initLogging() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print(
          '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
    }
  });
}
