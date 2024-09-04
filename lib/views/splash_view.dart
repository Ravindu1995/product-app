import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_app/views/login/login_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Get.to(LoginView());
        },
        child: Container(
          padding: EdgeInsets.all(12),
          color: Colors.red,
          child: Text("Start"),
        ),
      ),
      body: Container(
        child: Text("Hello"),
      ),
    );
  }
}
