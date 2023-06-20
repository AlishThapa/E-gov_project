import 'package:egov_proj/module/auth/widget/count_down_timer.dart';
import 'package:egov_proj/module/home_page/admin/widget/add_bidding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/login_page/login_page.dart';
import '../controller/home_controller.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hc = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Home Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 5),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierColor: Colors.transparent,
                  builder: (context) {
                    return AlertDialog(
                      elevation: 0,
                      actionsPadding: EdgeInsets.zero,
                      titlePadding: EdgeInsets.zero,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      content: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Do you want to Logout?'),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.offAll(LogInPage());
                                  },
                                  child: const Text('Logout'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      // Inside the Obx widget in AdminHomePage class
      body: Obx(
        () {
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemCount: hc.data.length,
            itemBuilder: (context, index) {
              final item = hc.data[index];
              return Card(
                elevation: 0,
                color: Colors.teal.withOpacity(0.7),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title: ${item.title}'),
                          Text('Description: ${item.subTitle}'),
                        ],
                      ),
                      const CountdownTimer(),
                      Obx(() {
                        return Text(item.number.value.toString());
                      }),
                    ],
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
