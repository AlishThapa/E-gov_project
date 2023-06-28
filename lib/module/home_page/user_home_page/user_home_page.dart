import 'package:egov_proj/module/home_page/user_home_page/bidding_more_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/login_page/login_page.dart';
import '../controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov_proj/module/widget/custom_snackbar.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hc = Get.find<HomeController>();
    final fireStore =
        FirebaseFirestore.instance.collection("admincollection").snapshots();
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
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return const Center(child: CircularProgressIndicator());
                if (snapshot.hasError) {
                  CustomSnackBar.error("Something went wrong");
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            child: Card(
                              child: ListTile(
                                title: Text(snapshot
                                    .data!.docs[index]['biddingTitle']
                                    .toString()),
                                subtitle: Text(snapshot
                                    .data!.docs[index]['biddingDescreption']
                                    .toString()),
                                trailing: Text(
                                  "RS${snapshot.data!.docs[index]['price'].toString()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20.0),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(BiddingInfoo(
                                inde: index,
                                ide:
                                    snapshot.data!.docs[index]['id'].toString(),
                              ));
                            });
                      }),
                );
              }),
        ],
      ),
    );
  }
}
