import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../utils/my_app_colors.dart';
import '../my_widgets/my_large_button.dart';
import '../my_widgets/my_text_field.dart';
import 'otp_screen.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: JumpingText(
              'Edam',
              style:  TextStyle(
                  fontWeight: FontWeight.w600, color: Theme.of(context).textTheme.bodyText2!.color),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.height * .06),
                padding: EdgeInsets.only(top:Get.width * .05,left: Get.width * .05,right: Get.width * .05,bottom: Get.width * .13),
                decoration:  BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Get.height * .035),
                        )),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'We will get you back! Let us know your email and we will send a 4 digits PIN to reset it.',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: Get.height * .018),
                        )),
                    SizedBox(height: Get.height * .03),
                    MyTextFormField(
                      titleText: 'Email Address',
                      hintText: 'Enter your email address',
                      myController: emailController,
                    ),
                    SizedBox(height: Get.height * .5),
                    MyLargeButton(
                        title: 'Continue',
                        buttonColor: MyAppColors.appPrimaryColor,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Get.off(OtpScreen(
                                emailAddress: emailController.text.toString()));
                            // TODO submit
                          }
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
