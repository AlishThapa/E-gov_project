import 'package:egov_proj/firebase_auth/firebase_service.dart';
import 'package:egov_proj/module/auth/register_page/register_page.dart';
import 'package:egov_proj/module/home_page/admin/home_page.dart';
import 'package:egov_proj/module/widget/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  onLoginPressed() async {

      final email = emailController.text.trim();
      final password = passwordController.text.trim();

        final res=await FirebaseAuthServices().login(
            useremail: email, password: password);
        if(res!=null) {
          CustomSnackBar.success('Welcome');
          Get.to(
                () => const AdminHomePage(),
          );



      }


      if (email.isEmpty && password.isEmpty) {
        CustomSnackBar.error('Please enter the email and password');
      }


  }

  onRegisterPressed() {
    Get.to(
      () => RegisteraPage(),
    );
  }

}
