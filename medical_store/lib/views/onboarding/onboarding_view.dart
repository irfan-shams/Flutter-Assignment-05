import 'package:flutter/material.dart';
import 'package:medical_store/constant/color.dart';
import 'package:medical_store/views/login/login.dart';
import 'package:medical_store/views/onboarding/onboarding_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: primaryBgColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      pageController.jumpTo(controller.items.length - 1);
                    },
                    child: const Text("Skip",
                        style: TextStyle(color: secondaryTxtColor)),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: controller.items.length,
                    effect: const WormEffect(
                      activeDotColor: blueBtnColor,
                      dotColor: greyBtnColor,
                      dotHeight: 6,
                      dotWidth: 6,
                      spacing: 10,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn);
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(color: blueBtnColor),
                    ),
                  ),
                ],
              ),
      ),
      backgroundColor: primaryBgColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: PageView.builder(
          onPageChanged: (index) =>
              setState(() => isLastPage = controller.items.length - 1 == index),
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(controller.items[index].image),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  child: Text(
                    controller.items[index].title,
                    style: const TextStyle(
                      color: primaryTxtColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child: Text(
                    controller.items[index].descriptions,
                    style: const TextStyle(
                      color: secondaryTxtColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: blueBtnColor,
      ),
      width: MediaQuery.of(context).size.width * .9,
      height: 45,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginView()));
        },
        child: const Text(
          "GET STARTED",
          style: TextStyle(
            color: primaryBgColor,
          ),
        ),
      ),
    );
  }
}
