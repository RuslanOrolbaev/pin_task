import 'package:flutter/material.dart';
import 'package:pin_task/constants.dart';
import 'package:pin_task/view/keyboard.dart';
import 'package:pin_task/viewModel/pin_indicators_row.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({Key? key}) : super(key: key);

  @override
  _CreatePinScreenState createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text(createPin), PinIndicatorsRow(), Keyboard()],
        ),
      ),
    );
  }
}
