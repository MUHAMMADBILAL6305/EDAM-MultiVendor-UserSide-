import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/authentications/sign_up_screen.dart';
import 'package:progress_indicators/progress_indicators.dart';
import '../../utils/my_app_colors.dart';
import '../my_navigation_bar/my_nav_bar.dart';
import '../my_navigation_bar/my_navbar.dart';
import '../my_widgets/my_button.dart';
import '../my_widgets/my_large_button.dart';
import '../my_widgets/my_text_field.dart';
import 'forgot_password.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final List<String> _choices = ['Customer', 'Vendor'];

  int _index = 0;
  bool isRememberChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
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
                  color: MyAppColors.appPrimaryColor),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: Get.height * .1),
                  padding: EdgeInsets.all(Get.width * .05),
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      // borderRadius: BorderRadius.circular(18)),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Welcome back!',
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
                            'Please provide your credential to LogIn to your account.',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: Get.height * .02),
                          )),
                      SizedBox(height: Get.height * .05),
                      // Container(
                      //   height: Get.height * .06,
                      //   width: Get.width * .815,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(40),
                      //       color: MyAppColors.appPrimaryColor.withOpacity(.1)),
                      //   child: ListView.builder(
                      //       itemCount: 2,
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (ctx, index) {
                      //         return GestureDetector(
                      //           onTap: () {
                      //             setState(() {
                      //               _index = index;
                      //             });
                      //           },
                      //           child: Container(
                      //             margin: const EdgeInsets.all(3),
                      //             height: 35,
                      //             width: Get.width * 0.39,
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(40),
                      //                 border: _index == index
                      //                     ? Border.all(
                      //                         color:
                      //                             MyAppColors.appSecondaryColor)
                      //                     : Border.all(
                      //                         color: Colors.transparent),
                      //                 color: _index == index
                      //                     ? Colors.white
                      //                     : Colors.transparent),
                      //             child: Center(
                      //                 child: Text(
                      //               _choices[index],
                      //               style: TextStyle(
                      //                   color: _index == index
                      //                       ? MyAppColors.appPrimaryColor
                      //                       : Theme.of(context)
                      //                           .textTheme
                      //                           .bodyText2!
                      //                           .color,
                      //                   fontSize: Get.height * 0.018,
                      //                   fontWeight: FontWeight.w600),
                      //             )),
                      //           ),
                      //         );
                      //       }),
                      // ),
                      SizedBox(height: Get.height * .02),
                      MyTextFormField(
                        titleText: 'Phone or Email',
                        hintText: 'Enter your phone number or email',
                        myController: phoneController,
                        // isNumeric: true,
                      ),
                      MyTextFormField(
                        titleText: 'Password',
                        hintText: '******',
                        myController: passwordController,
                        isPassword: true,
                      ),
                      SizedBox(height: Get.height * 0.00001),
                      Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () {
                                Get.to(ForgotPassword());
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: MyAppColors.appSecondaryColor),
                              ))),
                      SizedBox(height: Get.height * 0.01),
                      MyLargeButton(
                          title: 'LogIn',
                          buttonColor: MyAppColors.appPrimaryColor,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Get.off( MyNavBar());
                              // makeLoadingFalse();
                              // showDialog(
                              //     context: context,
                              //     builder: (context) {
                              //       return CupertinoAlertDialog(
                              //         title: const Text('Message'),
                              //         content: Column(
                              //           children: [
                              //             Text(error.toString()),
                              //           ],
                              //         ),
                              //         actions: [
                              //           // LineScalePulseOutRapid();
                              //           TextButton(
                              //               onPressed: () => Navigator.pop(context),
                              //               child: const Text('OK'))
                              //         ],
                              //       );
                              //     });

                              // TODO submit
                            }
                          },),
                      SizedBox(height: Get.height * .01),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            // fillColor: MaterialStateProperty.resolveWith(MyAppColors.appPrimaryColor),
                            value: isRememberChecked,
                            activeColor: MyAppColors.appPrimaryColor,
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              setState(() {
                                isRememberChecked = value!;
                              });
                            },
                          ),
                          TextButton(
                            child:  Text('Remember me?',style: TextStyle(color: MyAppColors.appPrimaryColor),),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(32.0)),
                                        side: BorderSide(
                                            color: MyAppColors.appPrimaryColor),
                                      ),
                                      content: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const Text(
                                            'Your credential will be saved and you can login with one tap on next app lunch.',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          Container(
                                            // height: Get.height*.3,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  width: 2,
                                                  color: MyAppColors
                                                      .appPrimaryColor
                                                      .withOpacity(0.5),
                                                  style: BorderStyle.solid,
                                                ),
                                              ),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: MyAppColors
                                                        .appPrimaryColor),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 1,
                              width: Get.width * .25,
                              child: Divider(
                                thickness: 1,
                                color: Theme.of(context).dividerColor,
                              )),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(
                                // fontFamily: 'SF Pro Text',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                          // MyButton(imagePath: 'assets/images/google.png',onTap: (){print('pressed');}),
                          SizedBox(
                              height: 1,
                              width: Get.width * .25,
                              child: Divider(
                                thickness: 1,
                                color: Theme.of(context).dividerColor,
                              )),
                        ],
                      ),
                      SizedBox(height: Get.height * .03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                            onTap: () {
                              print('pressed');
                            },
                            imagePath: 'assets/images/google.png',
                          ),
                          SizedBox(width: Get.width * .07),
                          MyButton(
                            onTap: () {
                              print('pressed');
                            },
                            imagePath: 'assets/images/apple.png',
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * .03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          TextButton(
                              onPressed: () {
                                Get.off(const SignUpScreen());
                              },
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                    color: MyAppColors.appSecondaryColor),
                              ))
                        ],
                      ),
                      // SizedBox(height: Get.height * .14),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
