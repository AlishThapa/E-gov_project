import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/bidding_model.dart';

class HomeController extends GetxController {
  final forKey= GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  var biddingModel = <BiddingModel>[].obs;

  void addList() {
    biddingModel.add(
      BiddingModel(
        title: titleController.text.trim(),
        subTitle: subTitleController.text.trim(),
        biddingPrice: int.parse(
          priceController.text.trim(),
        ),
      ),
    );
  }
}
