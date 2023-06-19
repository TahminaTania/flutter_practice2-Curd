import 'package:flutter/material.dart';

class ErrorBox {
  static void showError(BuildContext context, String title, String message,
      VoidCallback onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
