import 'package:egov_proj/module/home_page/admin/widget/add_bidding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../model/bidding_model.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hc = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Home Page'),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: Obx(
        () {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemCount: hc.biddingModel.length,
            itemBuilder: (context, index) {
              final item = hc.biddingModel[index];
              return Card(
                elevation: 10,
                color: Colors.teal,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  title: Text(item.title),
                  subtitle: Text(item.subTitle),
                  trailing: Text(
                    item.biddingPrice.toString(),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text(
          'Add Bidding',
          style: TextStyle(fontSize: 13),
        ),
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            barrierDismissible: true,
            barrierColor: Colors.transparent,
            context: context,
            builder: (context) {
              return AddBidding();
            },
          );
        },
      ),
    );
  }
}
