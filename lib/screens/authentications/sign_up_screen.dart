import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/theme_shared_preferences/theme_provider.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import '../../utils/my_app_colors.dart';
import '../my_navigation_bar/my_profile/pdf_viewer.dart';
import '../my_widgets/my_button.dart';
import '../my_widgets/my_large_button.dart';
import '../my_widgets/my_text_field.dart';
import 'log_in_screen.dart';
import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController sureNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String myErrorText = '';
  // final List<String> _choices = ['Customer', 'Vendor'];
  // int _index = 0;

  bool isRememberChecked = false;

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
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
            color: Theme.of(context).iconTheme.color,
            size: 20,
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
              Container(
                margin: EdgeInsets.only(top: Get.height * .06),
                padding: EdgeInsets.all(Get.width * .05),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  // borderRadius: BorderRadius.circular(18),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    // Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Text(
                    //       'Please select to SignUp as vendor or customer.',
                    //       style: TextStyle(
                    //           color: Colors.grey,
                    //           fontWeight: FontWeight.w400,
                    //           fontSize: Get.height * .02),
                    //     )),
                    // Container(
                    //   margin: EdgeInsets.symmetric(vertical: 8),
                    //   width: Get.width * .65,
                    //   padding: const EdgeInsets.all(6),
                    //   decoration: BoxDecoration(
                    //       color: MyAppColors.appPrimaryColor.withOpacity(.12),
                    //       borderRadius: BorderRadius.circular(40)),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       SizedBox(
                    //           width: Get.width * .3,
                    //           child: MyLargeButton(
                    //             title: 'Customer',
                    //             titleColor: isCustomer
                    //                 ? Colors.white
                    //                 : MyAppColors.appPrimaryColor,
                    //             // borderColor: isCustomer ? MyAppColors.appThemeColor: Colors.white,
                    //             buttonColor: isCustomer
                    //                 ? MyAppColors.appPrimaryColor
                    //                 : Colors.white,
                    //             onTap: () {
                    //               setState(() {
                    //                 isVendor = false;
                    //                 isCustomer = true;
                    //               });
                    //             },
                    //           )),
                    //       SizedBox(
                    //           width: Get.width * .3,
                    //           // color: Colors.white,
                    //           child: MyLargeButton(
                    //             title: 'Vendor',
                    //             titleColor: isVendor
                    //                 ? Colors.white
                    //                 : MyAppColors.appPrimaryColor,
                    //             // borderColor: isCustomer ? MyAppColors.appThemeColor: Colors.white,
                    //             buttonColor: isVendor
                    //                 ? MyAppColors.appPrimaryColor
                    //                 : Colors.white,
                    //             onTap: () {
                    //               setState(() {
                    //                 isVendor = true;
                    //                 isCustomer = false;
                    //               });
                    //             },
                    //           )),
                    //     ],
                    //   ),
                    // ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign Up',
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
                          'Please provide your information to create your account.',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: Get.height * .02),
                        )),
                    SizedBox(height: Get.height * .03),
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
                    //                     : Border.all(color: Colors.transparent),
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
                    const SizedBox(height: 6),
                    MyTextFormField(
                      titleText: 'Name',
                      hintText: 'Enter your first name',
                      myController: nameController,
                    ),
                    MyTextFormField(
                      titleText: 'Last Name',
                      hintText: 'Enter your last name',
                      myController: sureNameController,
                    ),
                    MyTextFormField(
                      titleText: 'Email Address',
                      hintText: 'Enter your sure email address',
                      myController: emailController,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 6),
                      child: IntlPhoneField(
                        initialCountryCode: "KW",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                        decoration: InputDecoration(
                          labelStyle: themeNotifier.isDark
                              ? const TextStyle(color: Colors.black26)
                              : TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor),
                          hintText: 'Enter phone number',
                          hintStyle:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                          filled: true,
                          contentPadding: const EdgeInsets.all(18),
                          fillColor: Colors.grey.shade100,
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              width: .1,
                              color: MyAppColors.appPrimaryColor,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyAppColors.appPrimaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: MyAppColors.appPrimaryColor)),
                        ),
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          // print('Country changed to: ' + country.name);
                        },
                      ),
                    ),
                    MyTextFormField(
                      titleText: 'Password',
                      hintText: '******',
                      myController: passwordController,
                      isPassword: true,
                    ),
                    MyTextFormField(
                      titleText: 'Confirm Password',
                      hintText: '******',
                      myController: confirmPasswordController,
                      isPassword: true,
                      errorText: myErrorText,
                    ),
                    // SizedBox(height: Get.height * .01),
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
                        const Text('I accept the'),
                        TextButton(
                            onPressed: () {
                              Get.to(const MyPDFViewer(
                                pageTitle: 'Terms and Conditions',
                                pdfPath: 'assets/pdf/TermsOfUse.pdf',
                              ));
                            },
                            child: Text(
                              'Terms and Conditions?',
                              style:
                                  TextStyle(color: MyAppColors.appPrimaryColor),
                            ))
                      ],
                    ),
                    SizedBox(height: Get.height * .01),
                    MyLargeButton(
                        title: 'Sign Up',
                        buttonColor: MyAppColors.appSecondaryColor,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              setState(() {
                                myErrorText =
                                    "Password & confirm password doesn't match!";
                              });
                            } else {
                              if (isRememberChecked != true) {
                                setState(() {
                                  myErrorText =
                                      "Please accept the terms and conditions!";
                                });
                                Get.snackbar('Terms and conditions?',
                                    'Please accept the terms and conditions!',
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 3),
                                    margin: const EdgeInsets.only(
                                        bottom: 12, left: 12, right: 12),
                                    overlayBlur: 2,
                                    borderColor: MyAppColors.appPrimaryColor,
                                    borderWidth: 1.5,
                                    overlayColor: Colors.black45,
                                    backgroundColor: MyAppColors.appPrimaryColor
                                        .withOpacity(0.3));
                              } else {
                                setState(() {
                                  myErrorText = '';
                                  Get.to(OtpScreen(
                                    emailAddress:
                                        phoneController.text.toString(),
                                    // TODO submit
                                  ));
                                });
                              }
                            }
                          }
                        }),
                    SizedBox(height: Get.height * .02),
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
                            setState(() {
                              IsDarkMode.isDarkMode = !IsDarkMode.isDarkMode;
                            });
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
                    SizedBox(height: Get.height * .025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                            onPressed: () {
                              Get.off(const LogInScreen());
                            },
                            child: Text(
                              'LogIn',
                              style: TextStyle(
                                  color: MyAppColors.appSecondaryColor),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
