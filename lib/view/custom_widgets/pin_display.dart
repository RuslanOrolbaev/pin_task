import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pin_task/model/pin_buffer_controller.dart';

Logger _logger = Logger('Pin Display');

class PinDisplay extends StatelessWidget {
  const PinDisplay({required this.pinBuffer, Key? key}) : super(key: key);

  final PinBufferController pinBuffer;

  @override
  Widget build(BuildContext context) {
    _logger.info('running build');
    return StreamBuilder(
        stream: pinBuffer.stream,
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          List<Text> pinNumbers = [];
          if (snapshot.hasData) {
            for (String pinKey in snapshot.data!) {
              pinNumbers.add(Text(pinKey));
            }
            return Row(
              children: pinNumbers,
            );
          } else {
            return const Text('');
          }
        });
  }
}
