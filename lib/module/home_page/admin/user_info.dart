import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/login_page/login_page.dart';
import '../controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov_proj/module/widget/custom_snackbar.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hc = Get.find<HomeController>();
    final fireStore =
        FirebaseFirestore.instance.collection("usercollection").snapshots();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('User Info'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.chevron_left))
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Total User=${snapshot.data!.docs.length}",
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w900),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  child: Card(
                                    color: Colors.pinkAccent,
                                    child: ListTile(
                                      title: Text(snapshot
                                          .data!.docs[index]['Name']
                                          .toString()),
                                      subtitle: Text(snapshot
                                          .data!.docs[index]['email']
                                          .toString()),
                                      trailing: Text(
                                          "Tel:${snapshot.data!.docs[index]['Phone'].toString()}"),
                                    ),
                                  ),
                                  onTap: () {});
                            }),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
