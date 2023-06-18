import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

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
      body: Obx(() {
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          itemCount: hc.biddingModel.length,
          itemBuilder: (context, index) {
            final item = hc.biddingModel[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              title: Text(item.title),
              subtitle: Text(item.subTitle),
              trailing: Text(
                item.biddingPrice.toString(),
              ),
            );
          },
        );
      }),
    );
  }
}
