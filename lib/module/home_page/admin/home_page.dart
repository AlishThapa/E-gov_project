import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov_proj/module/auth/widget/count_down_timer.dart';
import 'package:egov_proj/module/home_page/admin/user_info.dart';
import 'package:egov_proj/module/home_page/admin/widget/add_bidding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/login_page/login_page.dart';
import '../../widget/custom_snackbar.dart';
import '../controller/home_controller.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hc = Get.find<HomeController>();
    final fireStore = FirebaseFirestore.instance.collection("admincollection").snapshots();
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
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    width: Get.width,
                    height: Get.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }
                if (snapshot.hasError) {
                  CustomSnackBar.error("Something went wrong");
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return SizedBox(
                    width: Get.width,
                    height: Get.height * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/no_data.png'),
                      ],
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            child: Card(
                              color: Colors.pinkAccent,
                              child: ListTile(
                                title: Text(
                                  snapshot.data!.docs[index]['biddingTitle'].toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w900),
                                ),
                                subtitle: Text(
                                  snapshot.data!.docs[index]['biddingDescreption'].toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 10.0),
                                ),
                                leading: Text(
                                  "RS:${snapshot.data!.docs[index]['price'].toString()}",
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15.0),
                                ),
                                trailing: TextButton(
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      FirebaseFirestore.instance.collection("admincollection").doc(snapshot.data!.docs[index]['id'].toString()).delete();
                                    }),
                              ),
                            ),
                            onTap: () {});
                      }),
                );
              }),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton.extended(
            heroTag: 'hero1',
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
          FloatingActionButton.extended(
              heroTag: 'hero2',
              onPressed: () {
                Get.to(const UserInfo());
              },
              label: const Text("User Info")),
        ],
      ),
    );
  }
}
