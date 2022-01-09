import 'package:flutter/material.dart';

class UserInstruction extends StatelessWidget {
  const UserInstruction(
      {required this.initialText, required this.inputStream, Key? key})
      : super(key: key);
  final Stream<String> inputStream;
  final String initialText;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: initialText,
        stream: inputStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Text(snapshot.data ?? '');
        });
  }
}
