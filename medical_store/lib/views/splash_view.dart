import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medical_store/constant/color.dart';
import 'package:medical_store/views/onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill,
                opacity: 0.5,
              ),
              color: blueBtnColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: primaryBgColor,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/icon.png"),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Quick Medical",
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w100,
                    color: primaryBgColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
