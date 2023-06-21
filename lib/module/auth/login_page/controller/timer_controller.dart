import 'dart:async';

import 'package:get/get.dart';

class CountdownController extends GetxController {
  final _seconds = 600.obs;
  late Timer _timer;

  int get seconds => _seconds.value;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds.value > 0) {
        _seconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    _seconds.value = 120;
  }
}
