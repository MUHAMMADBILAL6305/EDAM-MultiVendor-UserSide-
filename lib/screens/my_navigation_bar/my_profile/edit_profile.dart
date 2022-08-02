import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/alert_dialog_box_widget.dart';
import 'package:multi_vendor_edam/screens/my_widgets/my_large_button.dart';
import 'package:multi_vendor_edam/screens/my_widgets/my_text_field.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';

import '../../../theme_shared_preferences/theme_provider.dart';
import '../../../utils/my_app_colors.dart';
import 'my_chats/chat_data.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController myNameController = TextEditingController();
  TextEditingController mySureNameController = TextEditingController();
  TextEditingController myIDController = TextEditingController();
  TextEditingController myPhoneController = TextEditingController();
  TextEditingController myDOBController = TextEditingController();
  TextEditingController myPrimaryController = TextEditingController();
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myCountryController = TextEditingController();
  var sArray = myChatsDummyData[1].profileName.split(" ");
  final _formKey = GlobalKey<FormState>();

  // TextEditingController myEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    myNameController.text = sArray[0];
    mySureNameController.text = sArray[1];
    myIDController.text = '202205035111';
    myPhoneController.text = '01234567889';
    myDOBController.text = '13/04/1884';
    myPrimaryController.text = '123 Main Street, Islamabad, blue area';
    myEmailController.text = 'test@gmail.com';
    myCountryController.text = 'Pakistan';
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).primaryColorDark.withOpacity(0.42)
          : Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.headline6,
        ),
        actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
        centerTitle: true,
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
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * .03),
                Stack(
                  children: [
                    Container(
                      // margin: EdgeInsets.symmetric(vertical: Get.height*0.04),
                      decoration: const BoxDecoration(
                          // color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage('assets/images/userAvatar.png'),
                              fit: BoxFit.cover)),
                      child: CircleAvatar(
                        radius: Get.height * .1,
                        backgroundColor: MyAppColors.appPrimaryColor,
                        child: ClipOval(
                          child: Image.asset(
                            myChatsDummyData[0].profileImagePath,
                            height: Get.height * .195,
                            width: Get.height * .195,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: Get.height * .008,
                        left: Get.width * .29,
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: Get.height * .02,
                            backgroundColor: Theme.of(context)
                                .backgroundColor
                                .withOpacity(0.8),
                            child: const ClipOval(
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: Get.height * .03),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * .04, horizontal: Get.width * .05),
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      MyTextFormField(
                          titleText: 'ID',
                          hintText: 'MyID',
                          myController: myIDController),
                      MyTextFormField(
                          titleText: 'Name',
                          hintText: 'Enter your name',
                          myController: myNameController),
                      MyTextFormField(
                          titleText: 'SureName',
                          hintText: 'Enter your sureName',
                          myController: mySureNameController),
                      MyTextFormField(
                          titleText: 'Phone',
                          hintText: 'Enter yur phone',
                          myController: myPhoneController),
                      MyTextFormField(
                        titleText: 'Email',
                        hintText: 'Enter your email',
                        myController: myEmailController,
                      ),
                      MyTextFormField(
                          titleText: 'Date of Birth',
                          hintText: 'Enter your birth day date',
                          myController: myDOBController),
                      MyTextFormField(
                          titleText: 'Primary Address',
                          hintText: 'Primary Address',
                          myController: myPrimaryController),
                      MyTextFormField(
                          titleText: 'Country',
                          hintText: 'Enter your country name',
                          myController: myCountryController),
                      SizedBox(height: Get.height * .04),
                      MyLargeButton(
                          title: 'Update Profile',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              // TODO submit
                              Get.back();
                            }
                          },
                          buttonColor: MyAppColors.appPrimaryColor),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
