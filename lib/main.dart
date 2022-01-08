import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/constants.dart';
import 'package:pin_task/view/screens/create_pin_screen.dart';
import 'package:provider/provider.dart';
import 'model/provider_classes/pin_buffer_provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PinBufferProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: ScreenID.createPinScreen,
        routes: {
          ScreenID.createPinScreen: (context) => const CreatePinScreen()
        },
      ),
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
