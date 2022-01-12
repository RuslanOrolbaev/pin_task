import 'package:flutter/material.dart';
import 'package:pin_task/constants.dart' as constants;

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, constants.ScreenID.createPinScreen);
                },
                child: const Text(constants.createPinCodeButtonTitle)),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, constants.ScreenID.authByPinScreen);
                },
                child: const Text(constants.authByPinCodeButtonTitle))
          ],
        ),
      )),
    );
  }
}
