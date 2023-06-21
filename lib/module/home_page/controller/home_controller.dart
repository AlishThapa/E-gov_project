import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/bidding_model.dart';

class HomeController extends GetxController {
  var data = <Data>[].obs;
  final formKey = GlobalKey<FormState>();
  final enteredNumber = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();

  void decreaseNumber(int index) {
    if (data[index].number.value > 0) {
      data[index].number.value--;
    }
    print(data[index].number.value);

  }



  void add(int number) {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      data.add(
        Data(
          number: number.obs,
          title: titleController.text.trim(),
          subTitle: subTitleController.text.trim(),
        ),
      );
      Get.back();
    }
  }
}
