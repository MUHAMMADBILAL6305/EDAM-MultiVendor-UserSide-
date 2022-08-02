import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../on_boarding_screens/on_boarding_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Get.offAll(const OnBoardingScreens()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/E Logo.png",
                height: Get.height * .3, //143.14,
                width: Get.height * .3,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              ScalingText(
                "Edam",
                style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    color: Color(0xff27272E),
                    letterSpacing: -0.005),
              ),
              const SizedBox(height: 140),
              JumpingDotsProgressIndicator(
                color: Theme.of(context).primaryColor,
                fontSize: 40,
                numberOfDots: 10,
                milliseconds: 100,
              ),
              // CircularProgressIndicator(
              //   backgroundColor: Colors.grey.withOpacity(.2),
              //   // Color(0xff209CEE),
              //   valueColor: AlwaysStoppedAnimation(MyAppColors.appThemeColor),
              //   strokeWidth: 4,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
