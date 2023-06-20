
import 'package:flutter/material.dart';

import '../auth/login_page/login_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 6),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogInPage(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.blue,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: const Center(
          child: Image(
            image: AssetImage(
              'assets/images/R.png',
            ),
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
