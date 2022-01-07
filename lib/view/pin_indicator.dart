import 'package:flutter/material.dart';

class PinIndicator extends StatelessWidget {
  const PinIndicator({Key? key, required this.filled}) : super(key: key);

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20,
        height: 20,
        decoration:
            const ShapeDecoration(shape: CircleBorder(side: BorderSide())));
  }
}
