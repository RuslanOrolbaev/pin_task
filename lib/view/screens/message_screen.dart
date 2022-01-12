import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({required this.message, Key? key}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}
