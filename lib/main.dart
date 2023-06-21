import 'package:egov_proj/module/home_page/admin/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'module/home_page/controller/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffFFECEC),
      ),
      home: const AdminHomePage(),
    );
  }
}
