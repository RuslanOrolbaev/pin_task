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
          int? pinLength = snapshot.data as int?;
          pinLength ??= 0;
          List<Widget> children = [];
          for (int i = 0; i < pinLength; i++) {
            children.add(const PinIndicator(filled: true));
          }
          for (int i = 0; i < constants.pinLength - pinLength; i++) {
            children.add(const PinIndicator(filled: false));
          }
          return Row(
              mainAxisAlignment: MainAxisAlignment.center, children: children);
        });
  }
}
