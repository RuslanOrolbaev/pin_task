import 'package:flutter/material.dart';
import 'package:pin_task/view/pin_indicator.dart';

class PinIndicatorsRow extends StatefulWidget {
  const PinIndicatorsRow({Key? key}) : super(key: key);

  @override
  _PinIndicatorsRowState createState() => _PinIndicatorsRowState();
}

class _PinIndicatorsRowState extends State<PinIndicatorsRow> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < 3; i++) {
      children.add(const PinIndicator(filled: true));
    }
    return Row(children: children);
  }
}
