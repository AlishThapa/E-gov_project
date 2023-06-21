import 'package:egov_proj/module/auth/register_page/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_page/controller/login_controller.dart';
import '../widget/custom_button.dart';
import '../widget/auth_text_field.dart';

class RegisteraPage extends StatelessWidget {
  RegisteraPage({Key? key}) : super(key: key);
  final rc = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image(
                      image: AssetImage(
                        'assets/images/R.png',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              AuthTextField(hintText: 'Enter Name', controller: rc.nameController),
              const SizedBox(height: 10),
              const Text(
                'Phone',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              AuthTextField(hintText: 'Enter Phone Number', controller: rc.phoneController),
              const SizedBox(height: 10),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              AuthTextField(hintText: 'Enter Email', controller: rc.emailController),
              const SizedBox(height: 10),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              AuthTextField(hintText: 'Enter Password', controller: rc.passwordController),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'forgot password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              CustomButton(
                text: 'Register',
                onPressed: rc.onRegisterPressed,
              ),
              CustomButton(
                text: 'Login',
                onPressed: rc.onLoginPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
