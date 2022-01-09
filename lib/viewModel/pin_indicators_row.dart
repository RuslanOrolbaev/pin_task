import 'package:flutter/material.dart';
import 'package:pin_task/view/custom_widgets/pin_indicator.dart';

class PinIndicatorsRow extends StatefulWidget {
  const PinIndicatorsRow({required this.pinLength, Key? key}) : super(key: key);

  final int pinLength; //todo assert pinLength>0

  @override
  _PinIndicatorsRowState createState() => _PinIndicatorsRowState();
}

class _PinIndicatorsRowState extends State<PinIndicatorsRow> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 1; i < widget.pinLength; i++) {
      children.add(const PinIndicator(filled: true));
    }
    return Row(children: children);
  }
}
