import 'package:egov_proj/module/auth/login_page/login_page.dart';
import 'package:egov_proj/module/home_page/admin/home_page.dart';
import 'package:egov_proj/module/widget/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void onInit() {
    emailController.clear();
    passwordController.clear();
    super.onInit();
  }

  onRegisterPressed() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
      CustomSnackBar.error('Please enter in all the fields');
    } else {
      CustomSnackBar.success('Welcome');
      Get.to(
        () => const AdminHomePage(),
      );
    }
  }

  onLoginPressed() {
    Get.to(
      () => LogInPage(),
    );
  }
}
