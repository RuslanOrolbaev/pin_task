import 'package:flutter/material.dart';
import 'package:pin_task/view/custom_widgets/custom_alert_dialog.dart';

class UiHelper {
  static void showOKDialog(
      {required BuildContext context,
      required String message,
      required Function onOKPressed}) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(message: message, onOKPressed: onOKPressed);
        });
  }
}
