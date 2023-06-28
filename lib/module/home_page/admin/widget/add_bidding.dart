import 'dart:ui';

import 'package:egov_proj/admin_register_model/register_admin.dart';
import 'package:egov_proj/cloud_firestore/cloud_firestore.dart';
import 'package:egov_proj/module/home_page/admin/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class AddBidding extends StatelessWidget {
  AddBidding({
    super.key,
  });

  final hc =Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xff2c3e50),
                Color(0xff3498db),
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: hc.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: hc.id,
                  validator: (p0) {
                    final price = hc.id.text.trim();
                    if (!price.isNum) {
                      return 'Enter id in number only';
                    }
                  },
                  labelText: 'bidding id',
                ),
                CustomTextField(
                  controller: hc.titleController,
                  validator: (p0) {
                    final title = hc.titleController.text.trim();
                    if (title.isEmpty) {
                      return 'the field cannot be empty';
                    }
                  },
                  labelText: 'Bidding title',
                ),
                CustomTextField(
                  controller: hc.subTitleController,
                  validator: (p0) {
                    final subTitle = hc.subTitleController.text.trim();
                    if (subTitle.isEmpty) {
                      return 'the field cannot be empty';
                    }
                  },
                  onChanged: (p0) {
                  //
                  },
                  labelText: 'Bidding description',
                ),
                CustomTextField(
                  controller: hc.enteredNumber,
                  validator: (p0) {
                    final price = hc.enteredNumber.text.trim();
                    if (!price.isNum) {
                      return 'Please specify only the price';
                    }
                  },
                  labelText: 'Bidding price',
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CupertinoColors.systemBlue,
                    elevation: 10,
                  ),
                  onPressed: () {
    hc.formKey.currentState!.save();
    if (hc.formKey.currentState!.validate()) {
    FirestoreServices().createAdmin(AdminMOdel(biddingTitle: hc.titleController.text, biddingDescreption: hc.subTitleController.text, price: hc.enteredNumber.text, id: hc.id.text));
    int number = int.tryParse(hc.enteredNumber.text) ?? 0;
    hc.add(number);

    }
                  },
                  child: const Text(
                    'Add Bidding',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
