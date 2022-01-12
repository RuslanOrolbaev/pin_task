import 'package:flutter/material.dart';

class PinIndicator extends StatelessWidget {
  const PinIndicator({Key? key, required this.filled}) : super(key: key);

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 10,
          height: 10,
          decoration: filled
              ? const BoxDecoration(
                  color: Color(0xFF8F74FA), shape: BoxShape.circle)
              : const ShapeDecoration(
                  shape: CircleBorder(side: BorderSide(color: Colors.grey)))),
    );
  }
}
