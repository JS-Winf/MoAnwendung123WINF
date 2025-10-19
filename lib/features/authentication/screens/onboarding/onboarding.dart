import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../login/login.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Hotshop', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(() => const LoginScreen()),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}