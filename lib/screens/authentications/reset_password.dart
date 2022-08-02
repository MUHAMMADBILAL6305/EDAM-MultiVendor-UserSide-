import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/alert_dialog_box_widget.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../utils/my_app_colors.dart';
import '../my_widgets/my_large_button.dart';
import '../my_widgets/my_text_field.dart';
import 'log_in_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key, this.isOldPassword = false}) : super(key: key);

  final bool isOldPassword;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  String myErrorText = '';
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
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyText2!.color),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: Get.height * .06),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Get.height * .04),
                        )),
                    SizedBox(
                      height: Get.height * .01,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Please enter your new password and confirm password to reset.',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: Get.height * .02),
                        )),
                    SizedBox(height: Get.height * .04),
                    widget.isOldPassword
                        ? MyTextFormField(
                            titleText: 'Old password',
                            hintText: '******',
                            myController: oldPasswordController,
                            isPassword: true,
                          )
                        : Container(),
                    MyTextFormField(
                      titleText: 'New password',
                      hintText: '******',
                      myController: passwordController,
                      isPassword: true,
                    ),
                    MyTextFormField(
                      titleText: 'Confirm new password',
                      hintText: '******',
                      myController: confirmPasswordController,
                      isPassword: true,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          myErrorText,
                          style:
                              const TextStyle(fontSize: 11, color: Colors.red),
                        )),
                    SizedBox(
                        height: widget.isOldPassword
                            ? Get.height * .25
                            : Get.height * .338),
                    MyLargeButton(
                        title: 'Reset Password',
                        buttonColor: MyAppColors.appPrimaryColor,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              setState(() {
                                myErrorText =
                                    "Password & confirm password doesn't match!";
                              });
                            } else {
                              setState(() {
                                myErrorText = '';
                              });
                              widget.isOldPassword
                                  ? openAlertBox(context)
                                  : Get.off(const LogInScreen());
                              // TODO submit
                            }
                          }
                        }),
                    SizedBox(height: Get.height * .08),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
