import 'package:get/get.dart';

class BiddingModel {
  String title;
  String subTitle;
  RxInt biddingPrice;

  BiddingModel({
    required this.title,
    required this.subTitle,
    required this.biddingPrice,
  });
}

class Data {
  String title;
  String subTitle;
  RxInt number;

  Data({
    required this.title,
    required this.subTitle,
    required this.number,
  });
}
