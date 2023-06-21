import 'package:egov_proj/module/auth/login_page/login_page.dart';
import 'package:egov_proj/module/home_page/admin/home_page.dart';
import 'package:egov_proj/module/widget/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:egov_proj/register_user_model/register_user.dart';

import '../../../../cloud_firestore/cloud_firestore.dart';
import '../../../../firebase_auth/firebase_service.dart';

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

  onRegisterPressed() async{
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();

    if (email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty) {
      CustomSnackBar.error('Please enter in all the fields');

    } else{
      final authresponse= await FirebaseAuthServices().createUser(useremail: email,password: password);
      final firestoreresponse=await FirestoreServices().createUser(RegisterUser(Name: name,Phone: phone,password: password,email: email));
      CustomSnackBar.success(authresponse+" "+firestoreresponse);
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
