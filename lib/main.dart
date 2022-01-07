import 'package:flutter/material.dart';
import 'package:pin_task/constants.dart';
import 'package:pin_task/view/screens/create_pin_screen.dart';
import 'package:provider/provider.dart';
import 'model/provider_classes/pin_buffer_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PinBufferProvider())
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
