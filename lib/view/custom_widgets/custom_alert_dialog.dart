import 'package:flutter/cupertino.dart';
import 'package:pin_task/constants.dart' as constants;

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {required this.message, required this.onOKPressed, Key? key})
      : super(key: key);
  final String message;
  final Function onOKPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Column(
        children: <Widget>[
          Text(message),
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
            child: const Text(constants.ok),
            onPressed: onOKPressed as void Function()),
      ],
    );
  }
}
