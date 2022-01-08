import 'package:flutter/material.dart';
import 'package:pin_task/model/key_code_flow.dart';

class KeyCodeFlowDisplay extends StatelessWidget {
  const KeyCodeFlowDisplay({required this.keyCodeFlow, Key? key})
      : super(key: key);

  final KeyCodeFlow keyCodeFlow;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: keyCodeFlow.stream,
        builder: (context, AsyncSnapshot<String?> streamBuilderSnapshot) {
          return Text(streamBuilderSnapshot.data ?? '');
        });
  }
}
