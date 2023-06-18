import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void error(String message) {
    Get.snackbar(
      'Something went wrong !',
      message,
      margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
      padding: const EdgeInsets.all(10),
      colorText: const Color(0xff831529),
      snackStyle: SnackStyle.FLOATING,
      dismissDirection: DismissDirection.horizontal,
      borderRadius: 20,
      backgroundColor: Colors.red.withOpacity(0.7),
      duration: const Duration(seconds: 3),
      forwardAnimationCurve: Curves.elasticOut,
      reverseAnimationCurve: Curves.easeIn,
      icon: const Icon(Icons.warning_amber),
      shouldIconPulse: true,
    );
  }

  static void success(String message) {
    Get.snackbar(
      'Success',
      message,
      margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
      padding: const EdgeInsets.all(10),
      colorText: const Color(0xff831529),
      snackStyle: SnackStyle.FLOATING,
      dismissDirection: DismissDirection.horizontal,
      borderRadius: 20,
      backgroundColor: Colors.green.withOpacity(0.7),
      duration: const Duration(seconds: 3),
      forwardAnimationCurve: Curves.elasticOut,
      reverseAnimationCurve: Curves.easeOut,
      icon: const Icon(Icons.check),
      shouldIconPulse: true,
    );
  }
}
