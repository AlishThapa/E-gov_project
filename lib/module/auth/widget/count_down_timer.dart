import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login_page/controller/timer_controller.dart';

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final CountdownController controller = Get.put(CountdownController());

    return Obx(() {
      int minutes = controller.seconds ~/ 60;
      int seconds = controller.seconds % 60;
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (controller.seconds == 0)
                InkWell(
                  onTap: () {
                    controller.resetTimer();
                    controller.startTimer();
                  },
                  child: const Text(
                    'Resend',
                    style: TextStyle(
                      color: Color(0xffF6921E),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Eligible in ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff831529),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff831529),
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
