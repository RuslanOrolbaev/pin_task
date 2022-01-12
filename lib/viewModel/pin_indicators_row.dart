import 'package:flutter/material.dart';
import 'package:pin_task/model/i_buffer.dart';
import 'package:pin_task/view/custom_widgets/pin_indicator.dart';
import 'package:pin_task/constants.dart' as constants;

class PinIndicatorsRow extends StatelessWidget {
  const PinIndicatorsRow({required this.pinBufferController, Key? key})
      : super(key: key);
  final IBufferController pinBufferController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: pinBufferController.stream,
        builder: (context, AsyncSnapshot snapshot) {
          List<String>? pinCode = snapshot.data as List<String>?;
          pinCode ??= [];
          List<Widget> children = [];
          for (int i = 0; i < pinCode.length; i++) {
            children.add(const PinIndicator(filled: true));
          }
          for (int i = 0; i < constants.pinLength - pinCode.length; i++) {
            children.add(const PinIndicator(filled: false));
          }
          return Row(
              mainAxisAlignment: MainAxisAlignment.center, children: children);
        });
  }
}
