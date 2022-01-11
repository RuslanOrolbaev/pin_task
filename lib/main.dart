import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/constants.dart';
import 'package:pin_task/view/custom_widgets/pin_manager.dart';
import 'package:pin_task/view/screens/auth_by_pin_screen.dart';
import 'package:pin_task/view/screens/create_pin_screen.dart';
import 'package:pin_task/view/screens/menu_screen.dart';

Logger _logger = Logger('main');

void main() async {
  _initLogging();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    return MaterialApp(
      title: 'Flutter Demo',
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
    print(
        '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}');
  });
}
