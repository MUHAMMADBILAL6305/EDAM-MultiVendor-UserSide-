import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/authentications/reset_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../utils/my_app_colors.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key, required this.emailAddress}) : super(key: key);

  final String emailAddress;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController = StreamController();
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

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
          icon: Icon(Icons.arrow_back_ios,size: 20,color: Theme.of(context).iconTheme.color,),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: JumpingText(
              'Edam',
              style:  TextStyle(
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
              padding: EdgeInsets.all(Get.width * .05),
              decoration:  BoxDecoration(

                  color: Theme.of(context).backgroundColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'OTP Verification',
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
                        'We have sent a 4 digits PIN to your email ${widget.emailAddress} fill up it carefully.',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: Get.height * .02),
                      )),
                  SizedBox(height: Get.height * .07),
                  Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 30),
                            child: PinCodeTextField(
                              appContext: context,
                              // pastedTextStyle: TextStyle(
                              //   color: Colors.green.shade600,
                              //   fontWeight: FontWeight.bold,
                              // ),
                              length: 4,
                              obscureText: false,
                              blinkWhenObscuring: true,
                              animationType: AnimationType.fade,
                              validator: (v) {},
                              pinTheme: PinTheme(
                                inactiveFillColor: Colors.grey,
                                shape: PinCodeFieldShape.underline,
                                borderRadius: BorderRadius.circular(7),
                                // borderWidth: 2,
                                // fieldHeight: 50,
                                selectedColor: MyAppColors.appPrimaryColor,
                                //     fieldWidth: 48,
                                selectedFillColor: Colors.black12,
                                inactiveColor: MyAppColors.appPrimaryColor,
                                //   activeColor: MyAppColors.whitecolor,
                                activeFillColor: MyAppColors.appPrimaryColor,
                              ),
                              cursorColor: Colors.black38,
                              animationDuration: Duration(milliseconds: 300),
                              enableActiveFill: true,
                              // backgroundColor: Colors.red,
                              errorAnimationController: errorController,
                              controller: textEditingController,
                              keyboardType: TextInputType.number,

                              onCompleted: (v) {
                                Get.off(ResetPassword());
                                print("Completed");
                              },

                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                              // beforeTextPaste: (text) {
                              //   print("Allowing to paste $text");
                              //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              //   return true;
                              // },
                            )),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      //   child: Text(
                      //     hasError ? "*Please fill up all the cells properly" : "",
                      //     style: TextStyle(
                      //         color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Didn't receive code?",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Resend Code",
                                  style: TextStyle(
                                      color: MyAppColors.appPrimaryColor,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w500),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * .45),
                  // MyLargeButton(title: 'Continue',
                  //     buttonColor: MyAppColors.appThemeColor, onTap: () {}),
                  // SizedBox(height: Get.height * .05),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
