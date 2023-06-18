import 'package:flutter/material.dart';
import 'package:get/get.dart';import '../widget/custom_button.dart';
import '../widget/auth_text_field.dart';
import 'controller/login_controller.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  final lc = Get.put(LoginController());

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
              const SizedBox(height: 10),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              AuthTextField(hintText: 'Enter Email', controller: lc.emailController),
              const SizedBox(height: 10),
              const Text(
                'password',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              AuthTextField(hintText: 'Enter Password', controller: lc.passwordController),
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
                text: 'Login',
                onPressed: lc.onLoginPressed,
              ),
              CustomButton(
                text: 'Login as Admin',
                onPressed: () {},
              ),
              CustomButton(
                text: 'Register',
                onPressed: lc.onRegisterPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
