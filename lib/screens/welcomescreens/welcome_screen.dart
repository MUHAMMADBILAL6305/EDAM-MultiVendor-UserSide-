import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../theme_shared_preferences/theme_provider.dart';
import '../../utils/my_app_colors.dart';
import '../authentications/log_in_screen.dart';
import '../authentications/sign_up_screen.dart';
import '../my_navigation_bar/my_nav_bar.dart';
import '../my_navigation_bar/my_navbar.dart';
import '../my_widgets/my_large_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * .15),
              Image.asset(
                'assets/images/Welcome.png',
              ),
              SizedBox(height: Get.height * .01),
              Text(
                "Welcome", style: Theme.of(context).textTheme.headline6,
                // style: TextStyle(
                //   fontFamily: 'Inter',
                //   fontStyle: FontStyle.normal,
                //   fontWeight: FontWeight.w700,
                //   fontSize: 14,
                //   color: MyAppColors.appPrimaryColor,
                // ),
              ),
              // Divider(color: Theme.of(context).dividerColor,),
              const SizedBox(height: 8),
              const Text(
                "Enjoy our best eShop experience ever.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  letterSpacing: -0.5,
                  height: 1.1,
                  color: Color(0xff1E1A15),
                ),
              ),
              SizedBox(height: Get.height * .2),
              MyLargeButton(
                  title: 'Create an account',
                  buttonColor: MyAppColors.appPrimaryColor,
                  isShadow: false,
                  onTap: () {
                    Get.to(const SignUpScreen());
                  }),
              const SizedBox(height: 15),
              MyLargeButton(
                  title: 'LogIn',
                  isShadow: false,
                  buttonColor: Colors.white,
                  titleColor: MyAppColors.appPrimaryColor,
                  borderColor: MyAppColors.appPrimaryColor,
                  onTap: () {
                    Get.to(LogInScreen());
                  }),
              const SizedBox(height: 15),
              MyLargeButton(
                  title: 'Continue as Guest',
                  isShadow: false,
                  buttonColor: MyAppColors.guestButtonColor,
                  borderColor: themeNotifier.isDark
                      ? MyAppColors.appPrimaryColor
                      : Colors.transparent,
                  onTap: () {
                    Get.to( MyNavBar());
                  }),
            ],
          ),
        )),
      ),
    );
  }
}
