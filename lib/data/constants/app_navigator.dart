import 'package:flutter/material.dart';

class AppNavigator {
  static void navigatorPop(BuildContext context) {
    Navigator.pop(context);
  }

  static navigatorPush(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static navigatorPushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
