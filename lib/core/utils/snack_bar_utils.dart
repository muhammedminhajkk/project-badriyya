import 'package:flutter/material.dart';
import 'package:project_badriyya/main.dart';

class SnackBarUtils {
  static void showMessage(String message) {
    MyApp.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
