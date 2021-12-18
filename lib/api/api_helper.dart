import 'dart:io';

import 'package:evemts/prefs/shared_pref_controller.dart';
import 'package:flutter/material.dart';

mixin ApiHelper {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: const Duration(seconds: 1),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  Map<String, String> get headers {
    var headers = {
      'Accept': 'application/json',
    };
    if (SharedPrefController().loggedIn) {
      headers[HttpHeaders.authorizationHeader] = SharedPrefController().token;
      headers[HttpHeaders.acceptHeader] = 'application/json';
    }
    return
      headers;
  }
}
