import 'package:flutter/material.dart';

class SnackBarController {
  static void clearSnackbars(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  static void showSnackBar(BuildContext context, String text) {
    clearSnackbars(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[700],
        content: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  static void showSnackBarWithActionButton(
    BuildContext context, {
    required String text,
    required String buttonLabel,
    required void Function() onPressed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 6),
        backgroundColor: Colors.grey[700],
        content: Row(
          children: [
            Flexible(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SnackBarAction(label: buttonLabel, onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}
