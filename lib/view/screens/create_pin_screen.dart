import 'package:flutter/material.dart';
import 'package:pin_task/view/custom_widgets/pin_manager.dart';
import 'package:pin_task/viewModel/pin_creation_controller.dart';
import 'package:pin_task/constants.dart' as constants;

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PinManager(
        initialUserInstructionText: constants.createPin,
        pinController: PinCreationController());
  }
}
