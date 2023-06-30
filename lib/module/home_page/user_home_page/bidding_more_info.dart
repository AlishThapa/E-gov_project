import 'package:egov_proj/admin_register_model/register_admin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/login_page/login_page.dart';
import '../controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egov_proj/module/widget/custom_snackbar.dart';

class BiddingInfoo extends StatelessWidget {
  int inde;
  String ide;
  BiddingInfoo({Key? key, required this.inde, required this.ide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hc = Get.find<HomeController>();
    final fireStoree =
        FirebaseFirestore.instance.collection("admincollection").snapshots();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Bidding Descreption'),
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
              stream: fireStoree,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        "Title:${snapshot.data!.docs[inde]['biddingTitle'].toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Descreption:${snapshot.data!.docs[inde]['biddingDescreption'].toString()}",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Price:${snapshot.data!.docs[inde]['price'].toString()}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                );
              }),
          const SizedBox(height: 40.0),
          TextButton(
              onPressed: () async {
                final fs = FirebaseFirestore.instance;
                final snapshott =
                    await fs.collection("admincollection").doc(ide).get();
                final data=snapshott.data()??{};
                var price=data['price'];
                price=int.parse(price);
                print(price);
                print(price.runtimeType);

               price=price-((5/100)*price).truncate();
                print(price);
                if(price<=0){
                  price=0;
                }
                price=price.toString();


                fs
                    .collection("admincollection")
                    .doc(ide)
                    .update({'price':price});
              },
              child: const Text("Decrease price")),
        ],
      ),
    );
  }
}
