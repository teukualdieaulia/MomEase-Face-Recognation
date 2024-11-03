import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

class Splashcren extends StatelessWidget {
  const Splashcren({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed("/Login");
    });
    return Scaffold(
        backgroundColor: Appcolor.Primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset("Images/logo.png"),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                'MomEase',
                style: TextStyle(
                    letterSpacing: 3,
                    wordSpacing: 5,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Appcolor.textPrimary,
                    height: 1),
              )
            ],
          ),
        ));
  }
}
