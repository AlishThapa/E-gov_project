import 'package:egov_proj/module/auth/register_page/register_page.dart';
import 'package:egov_proj/module/home_page/admin/home_page.dart';
import 'package:egov_proj/module/widget/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    emailController.clear();
    passwordController.clear();
    super.onInit();
  }

  onLoginPressed() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty && password.isEmpty) {
      CustomSnackBar.error('Please enter the email and password');
    } else {
      CustomSnackBar.success('Welcome');
      Get.to(
        () => const AdminHomePage(),
      );
    }
  }

  onRegisterPressed() {
    Get.to(
      () => RegisteraPage(),
    );
  }
}
